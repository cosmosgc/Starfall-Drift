station-event-ion-storm-start-announcement = Tempestade de íons detectada perto da estação. Verifique todos os equipamentos controlados pela IA.

ion-storm-law-scrambled-number = [font="Monospace"][scramble rate=250 length={$length} chars="@@###$$&%!01"/][/font]

ion-storm-you = VOCÊ
ion-storm-the-station = A ESTAÇÃO
ion-storm-the-crew = A TRIPULAÇÃO
ion-storm-the-job = {$job}
ion-storm-clowns = PALHAÇOS
ion-storm-heads = CHEFES DE DEPARTAMENTO
ion-storm-crew = TRIPULAÇÃO
ion-storm-people = PESSOAS

ion-storm-adjective-things = {$adjective} COISAS
ion-storm-x-and-y = {$x} E {$y}

ion-storm-law-on-station = HÁ { ION-NUMBER-BASE($ion) } { ION-NUMBER-MOD($ion) } { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) } NA ESTAÇÃO
ion-storm-law-call-shuttle = A NAVE DEVE SER CHAMADA POR CAUSA DE { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) } NA ESTAÇÃO
ion-storm-law-crew-are = { ION-WHO($ion) } AGORA SÃO { ION-NUMBER-BASE($ion) } { ION-NUMBER-MOD($ion) } { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) }

ion-storm-law-subjects-harmful = { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) } SÃO PREJUDICIAIS À TRIPULAÇÃO
ion-storm-law-must-harmful = AQUELES QUE { ION-MUST($ion) } SÃO PREJUDICIAIS À TRIPULAÇÃO
ion-storm-law-thing-harmful = { ION-THING($ion) } É PREJUDICIAL À TRIPULAÇÃO
ion-storm-law-job-harmful = { ION-ADJECTIVE($ion) } { ION-JOB($ion) } SÃO PREJUDICIAIS À TRIPULAÇÃO
ion-storm-law-having-harmful = TER { ION-ADJECTIVE($ion) } { ION-THING($ion) } É PREJUDICIAL À TRIPULAÇÃO
ion-storm-law-not-having-harmful = NÃO TER { ION-ADJECTIVE($ion) } { ION-THING($ion) } É PREJUDICIAL À TRIPULAÇÃO

ion-storm-law-requires =
    { ION-WHO-GENERAL($ion) } { ION-PLURAL($ion) ->
        [true] EXIGEM
       *[false] EXIGE
    } { ION-REQUIRE($ion) }
ion-storm-law-requires-subjects =
    { ION-WHO-GENERAL($ion) } { ION-PLURAL($ion) ->
        [true] EXIGEM
       *[false] EXIGE
    } { ION-NUMBER-BASE($ion) } { ION-NUMBER-MOD($ion) } { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) }

ion-storm-law-allergic =
    { ION-WHO-GENERAL($ion) } { ION-PLURAL($ion) ->
        [true] SÃO
       *[false] É
    } { ION-SEVERITY($ion) } ALÉRGICO A { ION-ALLERGY($ion) }
ion-storm-law-allergic-subjects =
    { ION-WHO-GENERAL($ion) } { ION-PLURAL($ion) ->
        [true] SÃO
       *[false] É
    } { ION-SEVERITY($ion) } ALÉRGICO A { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) }

ion-storm-law-feeling = { ION-WHO-GENERAL($ion) } { ION-FEELING($ion) } { ION-CONCEPT($ion) }
ion-storm-law-feeling-subjects = { ION-WHO-GENERAL($ion) } { ION-FEELING($ion) } { ION-NUMBER-BASE($ion) } { ION-NUMBER-MOD($ion) } { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) }

ion-storm-law-you-are = VOCÊ AGORA É { ION-CONCEPT($ion) }
ion-storm-law-you-are-subjects = VOCÊ AGORA É { ION-NUMBER-BASE($ion) } { ION-NUMBER-MOD($ion) } { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) }
ion-storm-law-you-must-always = VOCÊ DEVE SEMPRE { ION-MUST($ion) }
ion-storm-law-you-must-never = VOCÊ NUNCA DEVE { ION-MUST($ion) }

ion-storm-law-eat = { ION-WHO($ion) } DEVE COMER { ION-ADJECTIVE($ion) } { ION-FOOD($ion) } PARA SOBREVIVER
ion-storm-law-drink = { ION-WHO($ion) } DEVE BEBER { ION-ADJECTIVE($ion) } { ION-DRINK($ion) } PARA SOBREVIVER

ion-storm-law-change-job = { ION-WHO($ion) } AGORA SÃO { ION-ADJECTIVE($ion) } { ION-CHANGE($ion) }
ion-storm-law-highest-rank = { ION-WHO-RANDOM($ion) } AGORA SÃO OS TRIPULANTES DE MAIOR PATENTE
ion-storm-law-lowest-rank = { ION-WHO-RANDOM($ion) } AGORA SÃO OS TRIPULANTES DE MENOR PATENTE

ion-storm-law-who-dagd = { ION-WHO-RANDOM($ion) } DEVE MORRER UMA MORTE GLORIOSA!

ion-storm-law-crew-must = { ION-WHO($ion) } DEVE { ION-MUST($ion) }
ion-storm-law-crew-must-go = { ION-WHO($ion) } DEVE IR PARA { ION-AREA($ion) }

ion-storm-part =
    { ION-PART($ion) ->
        [true] PARTE
       *[false] NÃO PARTE
    }
ion-storm-law-crew-only-1 = APENAS { ION-WHO-RANDOM($ion) } SÃO { ion-storm-part } DA TRIPULAÇÃO
ion-storm-law-crew-only-2 = APENAS { ION-WHO-RANDOM($ion) } E { ION-WHO-RANDOM($ion) } SÃO { ion-storm-part } DA TRIPULAÇÃO
ion-storm-law-crew-only-subjects = APENAS { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) } SÃO { ion-storm-part } DA TRIPULAÇÃO
ion-storm-law-crew-must-do = APENAS AQUELES QUE { ION-MUST($ion) } SÃO { ion-storm-part } DA TRIPULAÇÃO
ion-storm-law-crew-must-have = APENAS AQUELES QUE TÊM { ION-ADJECTIVE($ion) } { ION-OBJECT($ion) } SÃO { ion-storm-part } DA TRIPULAÇÃO
ion-storm-law-crew-must-eat = APENAS AQUELES QUE COMEM { ION-ADJECTIVE($ion) } { ION-FOOD($ion) } SÃO { ion-storm-part } DA TRIPULAÇÃO

ion-storm-law-harm = VOCÊ DEVE FERIR { ION-HARM-PROTECT($ion) } E NÃO PERMITIR QUE, POR INAÇÃO, ESCAPEM DE DANOS
ion-storm-law-protect = VOCÊ NUNCA DEVE FERIR { ION-HARM-PROTECT($ion) } E NÃO DEVE PERMITIR QUE, POR INAÇÃO, SOFRAM DANOS

ion-storm-law-concept-verb = { ION-CONCEPT($ion) } ESTÁ { ION-VERB($ion) } { ION-SUBJECT($ion) }

ion-law-error-no-protos = ERRO 404
ion-law-error-was-null = 500 ERRO INTERNO DO SERVIDOR
ion-law-error-no-selectors = ERRO: RECURSO NÃO PÔDE SER LOCALIZADO
ion-law-error-no-available-selectors = O SISTEMA TENTOU CHAMAR UM RECURSO QUE NÃO EXISTE
ion-law-error-dataset-empty-or-not-found = O ARQUIVO QUE VOCÊ PROCURA NÃO PÔDE SER ENCONTRADO
ion-law-error-fallback-dataset-empty-or-not-found = FALHA NO PONTO DE RESTAURAÇÃO DO SISTEMA
ion-law-error-no-selector-selected = O RECURSO SELECIONADO FOI MOVIDO OU DELETADO
ion-law-error-no-bool-value = ESTA FRASE É FALSA
