using Content.Shared._Starfall.Particles;

namespace Content.Client._Starfall.Particles;

/// <summary>
/// Spawns a particle effect on this client when an entity with
/// <see cref="ParticleEmitterComponent"/> is initialized (including on PVS re-entry).
/// </summary>
public sealed partial class ParticleEmitterSystem : EntitySystem
{
    [Dependency] private ParticleSystem _particles = default!;
    [Dependency] private SharedTransformSystem _transform = default!;

    // Track emitter references so we can stop them when the entity leaves PVS or is removed.
    private readonly Dictionary<EntityUid, ActiveEmitter> _activeEmitters = new();

    // Entities whose respawn attempt already logged a warning. Prevents per-frame
    // log spam when an emitter can't be (re)created for a persistent reason.
    private readonly HashSet<EntityUid> _respawnWarned = new();

    public override void Initialize()
    {
        base.Initialize();
        SubscribeLocalEvent<ParticleEmitterComponent, ComponentInit>(OnCompInit);
        SubscribeLocalEvent<ParticleEmitterComponent, ComponentShutdown>(OnCompShutdown);
    }

    public override void Update(float frameTime)
    {
        base.Update(frameTime);

        // Safety net: if ComponentInit was missed (PVS re-entry races, init order),
        // the entity has the component but no live emitter. Respawn it so ambient
        // effects always resume when back on screen.
        var query = EntityQueryEnumerator<ParticleEmitterComponent>();
        while (query.MoveNext(out var uid, out var comp))
        {
            if (_activeEmitters.ContainsKey(uid))
                continue;

            try
            {
                SpawnEmitter((uid, comp));
                _respawnWarned.Remove(uid);
            }
            catch (Exception e)
            {
                // Transform may not be ready yet; retry next frame, warn once.
                if (_respawnWarned.Add(uid))
                    Log.Warning($"ParticleEmitterSystem: failed to (re)spawn emitter for {uid}: {e.Message}");
            }
        }
    }

    private void OnCompInit(Entity<ParticleEmitterComponent> ent, ref ComponentInit args)
    {
        SpawnEmitter(ent);
    }

    private void SpawnEmitter(Entity<ParticleEmitterComponent> ent)
    {
        // Stop any lingering emitter from a previous PVS cycle for this entity.
        if (_activeEmitters.TryGetValue(ent.Owner, out var old))
        {
            _particles.RemoveParticle(old);
            _activeEmitters.Remove(ent.Owner);
        }

        var coords = _transform.GetMapCoordinates(ent.Owner);
        var emitter = _particles.SpawnEffect(ent.Comp.Effect, coords, ent.Owner, ent.Comp.ColorOverride);
        if (emitter == null)
            return;

        if (ent.Comp.Intensity != 1f)
            emitter.Intensity = ent.Comp.Intensity;

        if (ent.Comp.SpawnOffset != default)
            emitter.SpawnOffset = ent.Comp.SpawnOffset;

        _activeEmitters[ent.Owner] = emitter;
    }

    private void OnCompShutdown(Entity<ParticleEmitterComponent> ent, ref ComponentShutdown args)
    {
        if (_activeEmitters.Remove(ent.Owner, out var emitter))
            _particles.RemoveParticle(emitter);
        _respawnWarned.Remove(ent.Owner);
    }
}

