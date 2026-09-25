# Estação Mega Hetero — ConfigPresets
# Branding PT-BR: "Estação Mega Hetero", Medium RP, South America East, PT-BR.
#
# Arquivos:
# - estacao-mega-hetero.toml : hostname, desc, chat.motd, hub tags, loc.culture_name, auth, infolinks.
# - lobby.toml               : controle de lobby (audio.lobby_music_collection, lobbyduration).
#
# Como ativar (escolha UMA):
#
# 1) server_config.toml (recomendado p/ host):
#      [config]
#      presets = "MegaHetero/estacao-mega-hetero,MegaHetero/lobby"
#
# 2) Linha de comando:
#      --cvar config.presets="MegaHetero/estacao-mega-hetero,MegaHetero/lobby"
#
# Tags aplicadas: lang:pt,region:am_s_e,rp:med
#   lang:pt      = Português (IETF)
#   region:am_s_e = South America East
#   rp:med        = Medium RP (valores válidos: rp:none | rp:low | rp:med | rp:high)
#
# Música do lobby:
# - Padrão: LobbyMusic (upstream).
# - Própria: adicione .ogg em Resources/Audio/_MegaHetero/Lobby/
#   (via Tools/Jukebox-Manager com RESOURCE_VARIANT=_MegaHetero),
#   liste em Resources/Prototypes/_MegaHetero/SoundCollections/lobby.yml (id MegaHeteroLobby),
#   e troque em lobby.toml: audio.lobby_music_collection = "MegaHeteroLobby".
#
# Background do lobby:
# - Adicione 1920x1080 WebP em Resources/Textures/_MegaHetero/LobbyScreens/
#   e registre em Resources/Prototypes/_MegaHetero/lobbyscreens.yml
#   (via Tools/Lobby-Background-Manager com RESOURCE_VARIANT=_MegaHetero).
# - Sem filtro de amostragem: crie lado a lado um .yml com `sample:\n  filter: false`
#   (o Lobby-Background-Manager já faz isso).
