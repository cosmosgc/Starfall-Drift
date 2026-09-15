-create-3rd-person =
    { $chance ->
        [1] Cria
       *[other] criam
    }

-cause-3rd-person =
    { $chance ->
        [1] Causa
       *[other] causam
    }

-satiate-3rd-person =
    { $chance ->
        [1] Sacia
       *[other] saciam
    }

entity-effect-guidebook-spawn-entity =
    { $chance ->
        [1] Cria
       *[other] criam
    } { $amount ->
        [1] { INDEFINITE($entname) }
       *[other] {$amount} { MAKEPLURAL($entname) }
    }

entity-effect-guidebook-destroy =
    { $chance ->
        [1] Destrói
       *[other] destroem
    } o objeto

entity-effect-guidebook-break =
    { $chance ->
        [1] Quebra
       *[other] quebram
    } o objeto

entity-effect-guidebook-explosion =
    { $chance ->
        [1] Causa
       *[other] causam
    } uma explosão

entity-effect-guidebook-emp =
    { $chance ->
        [1] Causa
       *[other] causam
    } um pulso eletromagnético

entity-effect-guidebook-flash =
    { $chance ->
        [1] Causa
       *[other] causam
    } um clarão ofuscante

entity-effect-guidebook-foam-area =
    { $chance ->
        [1] Cria
       *[other] criam
    } grandes quantidades de espuma

entity-effect-guidebook-smoke-area =
    { $chance ->
        [1] Cria
       *[other] criam
    } grandes quantidades de fumaça

entity-effect-guidebook-satiate-thirst =
    { $chance ->
        [1] Sacia
       *[other] saciam
    } { $relative ->
        [1] sede normalmente
       *[other] sede a { NATURALFIXED($relative, 3) }x a taxa média
    }

entity-effect-guidebook-satiate-hunger =
    { $chance ->
        [1] Sacia
       *[other] saciam
    } { $relative ->
        [1] fome normalmente
       *[other] fome a { NATURALFIXED($relative, 3) }x a taxa média
    }

entity-effect-guidebook-health-change =
    { $chance ->
        [1]
            { $healsordeals ->
                [heals] Cura
                [deals] Causa dano
               *[both] Modifica a saúde em
            }
       *[other]
            { $healsordeals ->
                [heals] curam
                [deals] causam dano
               *[both] modificam a saúde em
            }
    } { $changes }

entity-effect-guidebook-even-health-change =
    { $chance ->
        [1]
            { $healsordeals ->
                [heals] Cura uniformemente
                [deals] Causa dano uniformemente
               *[both] Modifica a saúde uniformemente em
            }
       *[other]
            { $healsordeals ->
                [heals] curam uniformemente
                [deals] causam dano uniformemente
               *[both] modificam a saúde uniformemente em
            }
    } { $changes }

entity-effect-guidebook-status-effect-old =
    { $type ->
        [update]
            { $chance ->
                [1] Causa
               *[other] causam
            } { LOC($key) } por pelo menos { NATURALFIXED($time, 3) } { MANY("second", $time) } sem acúmulo
        [add]
            { $chance ->
                [1] Causa
               *[other] causam
            } { LOC($key) } por pelo menos { NATURALFIXED($time, 3) } { MANY("second", $time) } com acúmulo
        [set]
            { $chance ->
                [1] Causa
               *[other] causam
            } { LOC($key) } por { NATURALFIXED($time, 3) } { MANY("second", $time) } sem acúmulo
       *[remove]
            { $chance ->
                [1] Remove
               *[other] removem
            } { NATURALFIXED($time, 3) } { MANY("second", $time) } de { LOC($key) }
    }

entity-effect-guidebook-status-effect =
    { $type ->
        [update]
            { $chance ->
                [1] Causa
               *[other] causam
            } { LOC($key) } por pelo menos { NATURALFIXED($time, 3) } { MANY("second", $time) } sem acúmulo
        [add]
            { $chance ->
                [1] Causa
               *[other] causam
            } { LOC($key) } por pelo menos { NATURALFIXED($time, 3) } { MANY("second", $time) } com acúmulo
        [set]
            { $chance ->
                [1] Causa
               *[other] causam
            } { LOC($key) } por { NATURALFIXED($time, 3) } { MANY("second", $time) } sem acúmulo
       *[remove]
            { $chance ->
                [1] Remove
               *[other] removem
            } { NATURALFIXED($time, 3) } { MANY("second", $time) } de { LOC($key) }
    } { $delay ->
        [0] imediatamente
       *[other] após { NATURALFIXED($delay, 3) } segundos
    }

entity-effect-guidebook-status-effect-indef =
    { $type ->
        [update]
            { $chance ->
                [1] Causa
               *[other] causam
            } { LOC($key) } permanente
        [add]
            { $chance ->
                [1] Causa
               *[other] causam
            } { LOC($key) } permanente
        [set]
            { $chance ->
                [1] Causa
               *[other] causam
            } { LOC($key) } permanente
       *[remove]
            { $chance ->
                [1] Remove
               *[other] removem
            } { LOC($key) }
    } { $delay ->
        [0] imediatamente
       *[other] após { NATURALFIXED($delay, 3) } segundos
    }

entity-effect-guidebook-knockdown =
    { $type ->
        [update]
            { $chance ->
                [1] Causa
               *[other] causam
            } { LOC($key) } por pelo menos { NATURALFIXED($time, 3) } { MANY("second", $time) } sem acúmulo
        [add]
            { $chance ->
                [1] Causa
               *[other] causam
            } atordoamento por pelo menos { NATURALFIXED($time, 3) } { MANY("second", $time) } com acúmulo
       *[set]
            { $chance ->
                [1] Causa
               *[other] causam
            } atordoamento por pelo menos { NATURALFIXED($time, 3) } { MANY("second", $time) } sem acúmulo
        [remove]
            { $chance ->
                [1] Remove
               *[other] removem
            } { NATURALFIXED($time, 3) } { MANY("second", $time) } de atordoamento
    }

entity-effect-guidebook-set-solution-temperature-effect =
    { $chance ->
        [1] Define
       *[other] definem
    } a temperatura da solução para exatamente { NATURALFIXED($temperature, 2) } K

entity-effect-guidebook-adjust-solution-temperature-effect =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Adiciona
               *[-1] Remove
            }
       *[other]
            { $deltasign ->
                [1] adicionam
               *[-1] removem
            }
    } calor da solução até { $deltasign ->
        [1] no máximo { NATURALFIXED($maxtemp, 2) } K
       *[-1] no mínimo { NATURALFIXED($mintemp, 2) } K
    }

entity-effect-guidebook-adjust-reagent-reagent =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Adiciona
               *[-1] Remove
            }
       *[other]
            { $deltasign ->
                [1] adicionam
               *[-1] removem
            }
    } { NATURALFIXED($amount, 2) }u de {$reagent} { $deltasign ->
        [1] à
       *[-1] da
    } solução

entity-effect-guidebook-adjust-reagent-group =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Adiciona
               *[-1] Remove
            }
       *[other]
            { $deltasign ->
                [1] adicionam
               *[-1] removem
            }
    } { NATURALFIXED($amount, 2) }u de reagentes do grupo {$group} { $deltasign ->
        [1] à
       *[-1] da
    } solução

entity-effect-guidebook-adjust-temperature =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Adiciona
               *[-1] Remove
            }
       *[other]
            { $deltasign ->
                [1] adicionam
               *[-1] removem
            }
    } { POWERJOULES($amount) } de calor { $deltasign ->
        [1] ao
       *[-1] do
    } corpo

entity-effect-guidebook-chem-cause-disease =
    { $chance ->
        [1] Causa
       *[other] causam
    } a doença { $disease }

entity-effect-guidebook-chem-cause-random-disease =
    { $chance ->
        [1] Causa
       *[other] causam
    } as doenças { $diseases }

entity-effect-guidebook-jittering =
    { $chance ->
        [1] Causa
       *[other] causam
    } tremor

entity-effect-guidebook-clean-bloodstream =
    { $chance ->
        [1] Limpa
       *[other] limpam
    } a corrente sanguínea de outros químicos

entity-effect-guidebook-cure-disease =
    { $chance ->
        [1] Cura
       *[other] curam
    } doenças

entity-effect-guidebook-eye-damage =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Causa
               *[-1] Cura
            }
       *[other]
            { $deltasign ->
                [1] causam
               *[-1] curam
            }
    } dano ocular

entity-effect-guidebook-vomit =
    { $chance ->
        [1] Causa
       *[other] causam
    } vômito

entity-effect-guidebook-create-gas =
    { $chance ->
        [1] Cria
       *[other] criam
    } { $moles } { $moles ->
        [1] mol
       *[other] mols
    } de { $gas }

entity-effect-guidebook-drunk =
    { $chance ->
        [1] Causa
       *[other] causam
    } embriaguez

entity-effect-guidebook-electrocute =
    { $chance ->
        [1]
            { $stuns ->
                [true] Eletrocuta
               *[false] Dá choque em
            }
       *[other]
            { $stuns ->
                [true] eletrocutam
               *[false] dão choque em
            }
    } o metabolizador por { NATURALFIXED($time, 3) } { MANY("second", $time) }

entity-effect-guidebook-emote =
    { $chance ->
        [1] Força
       *[other] forçam
    } o metabolizador a [bold][color=white]{$emote}[/color][/bold]

entity-effect-guidebook-extinguish-reaction =
    { $chance ->
        [1] Extingue
       *[other] extinguem
    } fogo

entity-effect-guidebook-flammable-reaction =
    { $chance ->
        [1] Aumenta
       *[other] aumentam
    } a inflamabilidade

entity-effect-guidebook-ignite =
    { $chance ->
        [1] Incendeia
       *[other] incendeiam
    } o metabolizador

entity-effect-guidebook-make-sentient =
    { $chance ->
        [1] Torna
       *[other] tornam
    } o metabolizador senciente

entity-effect-guidebook-make-polymorph =
    { $chance ->
        [1] Polimorfa
       *[other] polimorfam
    } o metabolizador em { $entityname }

entity-effect-guidebook-modify-bleed-amount =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Induz
               *[-1] Reduz
            }
       *[other]
            { $deltasign ->
                [1] induzem
               *[-1] reduzem
            }
    } sangramento

entity-effect-guidebook-modify-blood-level =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Aumenta
               *[-1] Diminui
            }
       *[other]
            { $deltasign ->
                [1] aumentam
               *[-1] diminuem
            }
    } o nível de sangue

entity-effect-guidebook-paralyze =
    { $chance ->
        [1] Paralisa
       *[other] paralisam
    } o metabolizador por pelo menos { NATURALFIXED($time, 3) } { MANY("second", $time) }

entity-effect-guidebook-movespeed-modifier =
    { $chance ->
        [1] Modifica
       *[other] modificam
    } a velocidade de movimento em { NATURALFIXED($sprintspeed, 3) }x por pelo menos { NATURALFIXED($time, 3) } { MANY("second", $time) }

entity-effect-guidebook-reset-narcolepsy =
    { $chance ->
        [1] Adia temporariamente
       *[other] adiam temporariamente
    } a narcolepsia

entity-effect-guidebook-wash-cream-pie-reaction =
    { $chance ->
        [1] Lava
       *[other] lavam
    } a torta de creme do rosto

entity-effect-guidebook-cure-zombie-infection =
    { $chance ->
        [1] Cura
       *[other] curam
    } uma infecção zumbi em curso

entity-effect-guidebook-cause-zombie-infection =
    { $chance ->
        [1] Causa
       *[other] causam
    } infecção zumbi em um indivíduo

entity-effect-guidebook-innoculate-zombie-infection =
    { $chance ->
        [1] Cura
       *[other] curam
    } uma infecção zumbi em curso e garante imunidade a futuras infecções

entity-effect-guidebook-reduce-rotting =
    { $chance ->
        [1] Regenera
       *[other] regeneram
    } { NATURALFIXED($time, 3) } { MANY("second", $time) } de apodrecimento

entity-effect-guidebook-area-reaction =
    { $chance ->
        [1] Causa
       *[other] causam
    } uma reação de fumaça ou espuma por { NATURALFIXED($duration, 3) } { MANY("second", $duration) }

entity-effect-guidebook-add-to-solution-reaction =
    { $chance ->
        [1] Causa
       *[other] causam
    } que {$reagent} seja adicionado ao seu recipiente interno de solução

entity-effect-guidebook-artifact-unlock =
    { $chance ->
        [1] Ajuda
       *[other] ajudam
    } a desbloquear um artefato alienígena

entity-effect-guidebook-artifact-durability-restore =
    Restaura { $restored } de durabilidade em nós ativos de artefato alienígena.

entity-effect-guidebook-plant-attribute =
    { $chance ->
        [1] Ajusta
       *[other] ajustam
    } {$attribute} em { $positive ->
        [true] [color=red]{$amount}[/color]
       *[false] [color=green]{$amount}[/color]
    }

entity-effect-guidebook-plant-cryoxadone =
    { $chance ->
        [1] Rejuvenesce
       *[other] rejuvenescem
    } a planta, dependendo da idade e do tempo de crescimento

entity-effect-guidebook-plant-phalanximine =
    { $chance ->
        [1] Restaura
       *[other] restauram
    } a viabilidade de uma planta inviável devido a mutação

entity-effect-guidebook-plant-remove-kudzu =
    { $chance ->
        [1] Remove
       *[other] removem
    } o crescimento de kudzu de uma planta

entity-effect-guidebook-plant-diethylamine =
    { $chance ->
        [1] Aumenta
       *[other] aumentam
    } a vida útil e/ou a saúde base da planta, com 10% de chance para cada

entity-effect-guidebook-plant-robust-harvest =
    { $chance ->
        [1] Aumenta
       *[other] aumentam
    } a potência da planta em {$increase} até no máximo {$limit}. Faz a planta perder suas sementes quando a potência atinge {$seedlesstreshold}. Tentar adicionar potência acima de {$limit} pode diminuir a produção com 10% de chance

entity-effect-guidebook-plant-seeds-add =
    { $chance ->
        [1] Restaura
       *[other] restauram
    } as sementes da planta

entity-effect-guidebook-plant-seeds-remove =
    { $chance ->
        [1] Remove
       *[other] removem
    } as sementes da planta

entity-effect-guidebook-plant-mutate-chemicals =
    { $chance ->
        [1] Faz mutar
       *[other] fazem mutar
    } uma planta para produzir {$name}

entity-effect-guidebook-add-reagent-to-bloodstream =
    { $chance ->
        [1] Injeta
       *[other] injetam
    } {$quantity}u de {$reagent} diretamente na corrente sanguínea
