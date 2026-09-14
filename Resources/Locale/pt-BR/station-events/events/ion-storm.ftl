station-event-ion-storm-start-announcement =  Tempestade de íons detectada perto da estação.

ion-storm-law-scrambled-number = [font="Monospace"][scramble rate=250 length={ $length } chars="@@###$$&%!01"/][/font]

ion-storm-you =  Você

ion-storm-the-station = A ESTAÇÃO

ion-storm-the-crew = A CREVE

ion-storm-the-job = O { $job }

ion-storm-clowns = CLOWNS

ion-storm-heads = CHEGADAS DE PESSOAL

ion-storm-crew = CREW

ion-storm-people =  PESSOAS

ion-storm-adjective-things = { $adjective } COISAS

ion-storm-x-and-y = { $x } E, E, { $y }

# subjects can generally be threats or jobs or objects
# thing is specified above it
ion-storm-law-on-station =  Há { ION-NUMBER-BASE($ion) } { ION-NUMBER-MOD($ion) } { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) } NA ESTAÇÃO

ion-storm-law-call-shuttle = O ônibus deve ser chamado por causa de { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) } NA ESTAÇÃO

ion-storm-law-crew-are = O { ION-WHO($ion) }  Agora são. { ION-NUMBER-BASE($ion) } { ION-NUMBER-MOD($ion) } { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) }

ion-storm-law-subjects-harmful = { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) } São prejudiciais para a tripulação

ion-storm-law-must-harmful =  Aqueles que { ION-MUST($ion) } São prejudiciais para a tripulação

# thing is a concept or action
ion-storm-law-thing-harmful = { ION-THING($ion) } É dificultosa para a tripulação

ion-storm-law-job-harmful = { ION-ADJECTIVE($ion) } { ION-JOB($ion) } São prejudiciais para a tripulação

# thing is objects or concept, adjective applies in both cases
# this means you can get a law like "NOT HAVING CHRISTMAS-STEALING COMMUNISM IS HARMFUL TO THE CREW" :)
ion-storm-law-having-harmful = TINHA { ION-ADJECTIVE($ion) } { ION-THING($ion) } É dificultosa para a tripulação

ion-storm-law-not-having-harmful =  NÃO TENDO { ION-ADJECTIVE($ion) } { ION-THING($ion) } É dificultosa para a tripulação

# require is a concept or require
ion-storm-law-requires =
    { ION-WHO-GENERAL($ion) } { ION-PLURAL($ion) ->
        [true] REQUISITO
       *[false] REQUISITOS
    } { ION-REQUIRE($ion) }

ion-storm-law-requires-subjects =
    { ION-WHO-GENERAL($ion) } { ION-PLURAL($ion) ->
        [true] REQUISITO
       *[false] REQUISITOS
    } { ION-NUMBER-BASE($ion) } { ION-NUMBER-MOD($ion) } { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) }

ion-storm-law-allergic =
    { ION-WHO-GENERAL($ion) } { ION-PLURAL($ion) ->
        [true] ARE
       *[false] É
    } { ION-SEVERITY($ion) } ALERGÉTICO PARA { ION-ALLERGY($ion) }

ion-storm-law-allergic-subjects =
    { ION-WHO-GENERAL($ion) } { ION-PLURAL($ion) ->
        [true] ARE
       *[false] É
    } { ION-SEVERITY($ion) } ALERGÉTICO PARA { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) }

ion-storm-law-feeling = { ION-WHO-GENERAL($ion) } { ION-FEELING($ion) } { ION-CONCEPT($ion) }

ion-storm-law-feeling-subjects = { ION-WHO-GENERAL($ion) } { ION-FEELING($ion) } { ION-NUMBER-BASE($ion) } { ION-NUMBER-MOD($ion) } { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) }

ion-storm-law-you-are =  Você é agora { ION-CONCEPT($ion) }

ion-storm-law-you-are-subjects =  Você é agora { ION-NUMBER-BASE($ion) } { ION-NUMBER-MOD($ion) } { ION-ADJECTIVE($ion) }  { ION-SUBJECT($ion) }

ion-storm-law-you-must-always =  Você deve sempre { ION-MUST($ion) }

ion-storm-law-you-must-never =  Você nunca deve { ION-MUST($ion) }

ion-storm-law-eat = O { ION-WHO($ion) }  Deve COMER { ION-ADJECTIVE($ion) } { ION-FOOD($ion) }  Sobreviver

ion-storm-law-drink = O { ION-WHO($ion) }  Deve beber { ION-ADJECTIVE($ion) } { ION-DRINK($ion) }  Sobreviver

ion-storm-law-change-job = O { ION-WHO($ion) }  Agora são. { ION-ADJECTIVE($ion) } { ION-CHANGE($ion) }

ion-storm-law-highest-rank = O { ION-WHO-RANDOM($ion) } SÃO OS CREMEMEMBROS MAIS ALTOS

ion-storm-law-lowest-rank = O { ION-WHO-RANDOM($ion) }  Agora são os mais baixos tripulantes de ranning

ion-storm-law-who-dagd = { ION-WHO-RANDOM($ion) }  Deve morrer uma morte gloriosa!

ion-storm-law-crew-must = O { ION-WHO($ion) }  Deve { ION-MUST($ion) }

ion-storm-law-crew-must-go = O { ION-WHO($ion) }  Deve ir para { ION-AREA($ion) }

ion-storm-part =
    { ION-PART($ion) ->
        [true]  PARTE
       *[false]  NÃO PARTE
    }

# due to phrasing, this would mean a law such as
# ONLY HUMANS ARE NOT PART OF THE CREW
# would make non-human nukies/syndies/whatever crew :)
ion-storm-law-crew-only-1 =  Apenas o { ION-WHO-RANDOM($ion) } ARE { ion-storm-part } DA CREW

ion-storm-law-crew-only-2 =  Apenas o { ION-WHO-RANDOM($ion) } E, E, { ION-WHO-RANDOM($ion) } ARE { ion-storm-part } DA CREW

ion-storm-law-crew-only-subjects = SOMENTE { ION-ADJECTIVE($ion) } { ION-SUBJECT($ion) } ARE { ion-storm-part } DA CREW

ion-storm-law-crew-must-do =  Só aqueles que { ION-MUST($ion) } ARE { ion-storm-part } DA CREW

ion-storm-law-crew-must-have =  Só aqueles que têm { ION-ADJECTIVE($ion) } { ION-OBJECT($ion) } ARE { ion-storm-part } DA CREW

ion-storm-law-crew-must-eat =  Só aqueles que comem { ION-ADJECTIVE($ion) } { ION-FOOD($ion) } ARE { ion-storm-part } DA CREW

ion-storm-law-harm =  Você deve ferir { ION-HARM-PROTECT($ion) } E não permitir que eles, através da inação, escapem do perigo

ion-storm-law-protect =  Você nunca deve machucar { ION-HARM-PROTECT($ion) } E não permitir que eles, através da inação, venham a ferir

# implementing other variants is annoying so just have this one
# COMMUNISM IS KILLING CLOWNS
ion-storm-law-concept-verb = { ION-CONCEPT($ion) } É { ION-VERB($ion) } { ION-SUBJECT($ion) }

# errors, in case something fails, so it doesn't break in-game flow, but still gives unique identifiers to find which part broke, the result string is mostly fluff
ion-law-error-no-protos = ERRO 404

ion-law-error-was-null = 500 ERRO DE SERVIÇO INTERNO

ion-law-error-no-selectors = O RECURSO NÃO PODE SER LOCADO

ion-law-error-no-available-selectors = O sistema tentou chamar um recurso que não existe.

ion-law-error-dataset-empty-or-not-found = O arquivo que você está procurando não pode ser encontrado

ion-law-error-fallback-dataset-empty-or-not-found = O PONTO DE RESTAURAÇÃO DO SISTEMA FALHOU

ion-law-error-no-selector-selected = O RECURSO SELECIDO FOI REMOVIDO OU DELEITO

ion-law-error-no-bool-value =  Esta sentença é falsa.
