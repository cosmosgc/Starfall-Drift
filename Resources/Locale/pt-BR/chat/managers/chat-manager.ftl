chat-manager-max-message-length =  Sua mensagem excede. { $maxMessageLength }  limite de caracteres

chat-manager-ooc-chat-enabled-message = O chat OOC foi ativado.

chat-manager-ooc-chat-disabled-message = O bate-papo da OOC foi desativado.

chat-manager-looc-chat-enabled-message = O bate-papo de ajuda foi ativado.

chat-manager-looc-chat-disabled-message = O bate-papo de ajuda foi desativado.

chat-manager-dead-looc-chat-enabled-message =  Jogadores mortos podem usar ajuda agora.

chat-manager-dead-looc-chat-disabled-message =  Jogadores mortos não podem mais usar a ajuda.

chat-manager-crit-looc-chat-enabled-message =  Jogadores de Críticos podem usar Ajuda.

chat-manager-crit-looc-chat-disabled-message =  Jogadores de críticos não podem mais usar a ajuda.

chat-manager-admin-ooc-chat-enabled-message = O chat do administrador OOC foi ativado.

chat-manager-admin-ooc-chat-disabled-message = O chat do administrador OOC foi desativado.

chat-manager-max-message-length-exceeded-message =  Sua mensagem excedeu { $limit }  limite de caracteres

chat-manager-no-headset-on-message =  Você não tem fone de ouvido!

chat-manager-no-radio-key =  Nenhuma chave de rádio especificada!

chat-manager-no-such-channel =  Não há canal com chave.{ $key }'!

chat-manager-whisper-headset-on-message =  Não pode sussurrar no rádio!

chat-manager-server-wrap-message = [bold]{ $message }[/bold]

chat-manager-sender-announcement =  Comando Central

chat-manager-sender-announcement-wrap-message = [font size=14][bold]{ $sender }  Anúncio:[/font][font size=12]
    { $message }[/bold][/font]

chat-manager-entity-say-wrap-message = [BubbleHeader][bold][Name]{$entityName}[/Name][/bold][/BubbleHeader] {$verb}, [font={$fontType} size={$fontSize}]“[BubbleContent]{$message}[/BubbleContent]”[/font]
chat-manager-entity-say-bold-wrap-message = [BubbleHeader][bold][Name]{$entityName}[/Name][/bold][/BubbleHeader] {$verb}, [font={$fontType} size={$fontSize}]“[BubbleContent][bold]{$message}[/bold][/BubbleContent]”[/font]

chat-manager-entity-whisper-wrap-message = [font size=11][italic][BubbleHeader][Name]{ $entityName }[/Name][/BubbleHeader]  sussurros, "[BubbleContent]{ $message }[/BubbleContent]”[/italic][/font]

chat-manager-entity-whisper-unknown-wrap-message = [font size=11][italic][BubbleHeader] Alguém.[/BubbleHeader]  sussurros, "[BubbleContent]{ $message }[/BubbleContent]”[/italic][/font]

# THE() is not used here because the entity and its name can technically be disconnected if a nameOverride is passed...
chat-manager-entity-me-wrap-message = [italic]{ PROPER($entity) ->
       *[false] O { $entityName } { $message }[/italic]
        [true] { CAPITALIZE($entityName) } [BubbleContent]{ $message }[/BubbleContent][/italic]
    }

chat-manager-entity-looc-wrap-message = LOOC: [bold]{$entityName}:[/bold] {$message}

chat-manager-send-ooc-wrap-message = OOC: [bold]{ $playerName }:[/bold] { $message }

chat-manager-send-ooc-patron-wrap-message = OOC: [bold][color={ $patronColor }]{ $playerName }[/color]:[/bold] { $message }

chat-manager-send-dead-chat-wrap-message = { $deadChannelName }: [bold][BubbleHeader]{ $playerName }[/BubbleHeader]:[/bold] [BubbleContent]{ $message }[/BubbleContent]

chat-manager-send-admin-dead-chat-wrap-message = { $adminChannelName }: [bold]([BubbleHeader]{ $userName }[/BubbleHeader]):[/bold] [BubbleContent]{ $message }[/BubbleContent]

chat-manager-send-admin-chat-wrap-message = { $adminChannelName }: [bold]{ $playerName }:[/bold] { $message }

chat-manager-send-admin-announcement-wrap-message = [bold]{ $adminChannelName }: { $message }[/bold]

chat-manager-send-hook-ooc-wrap-message = OOC: [bold](D){ $senderName }:[/bold] { $message }

chat-manager-send-hook-admin-wrap-message = ADMIN: [bold](D){ $senderName }:[/bold] { $message }

chat-manager-dead-channel-name =  MORTO

chat-manager-admin-channel-name = ADMIN

chat-manager-rate-limited =  Você está enviando mensagens muito rápido!

chat-manager-rate-limit-admin-announcement =  Aviso limite de taxa: { $player }

chat-speech-verb-suffix-exclamation = !

chat-speech-verb-suffix-exclamation-strong = !!

chat-speech-verb-suffix-question = ?

chat-speech-verb-suffix-stutter = -

chat-speech-verb-suffix-mumble = ..

chat-speech-verb-name-none =  Nenhum.

chat-speech-verb-name-default = Predefinição

chat-speech-verb-default =  diz

chat-speech-verb-name-exclamation = Exclamando

chat-speech-verb-exclamation = exclama

chat-speech-verb-name-exclamation-strong =  Gritando

chat-speech-verb-exclamation-strong =  Grita.

chat-speech-verb-name-question =  Perguntando

chat-speech-verb-question =  Pergunta

chat-speech-verb-name-stutter = Gagueira

chat-speech-verb-stutter = gagueja

chat-speech-verb-name-mumble = Murmurando

chat-speech-verb-mumble = murmúrios

chat-speech-verb-name-arachnid = Arani.

chat-speech-verb-insect-1 = cricrila

chat-speech-verb-insect-2 = gorjeia

chat-speech-verb-insect-3 = estala

chat-speech-verb-name-moth = Lumnari.

chat-speech-verb-winged-1 = Estremece.

chat-speech-verb-winged-2 = Abas

chat-speech-verb-winged-3 = Buzzes

chat-speech-verb-name-slime = Slime

chat-speech-verb-slime-1 = chapinha

chat-speech-verb-slime-2 = borbulha

chat-speech-verb-slime-3 = goteja

chat-speech-verb-name-plant = Diona

chat-speech-verb-plant-1 = farfalha

chat-speech-verb-plant-2 =  balança

chat-speech-verb-plant-3 = Range

chat-speech-verb-name-robotic = Robótica

chat-speech-verb-robotic-1 =  estados

chat-speech-verb-robotic-2 = Apita.

chat-speech-verb-robotic-3 = "Boops"

chat-speech-verb-name-reptilian = Unathi.

chat-speech-verb-reptilian-1 = sibila

chat-speech-verb-reptilian-2 = bufa

chat-speech-verb-reptilian-3 = ofega

chat-speech-verb-name-skeleton = Esqueleto

chat-speech-verb-skeleton-1 =  chocalhos

chat-speech-verb-skeleton-2 =  clacks

chat-speech-verb-skeleton-3 = Rasga

chat-speech-verb-name-vox = Vox.

chat-speech-verb-vox-1 =  Gritos

chat-speech-verb-vox-2 =  Gritos

chat-speech-verb-vox-3 = Morra.

chat-speech-verb-name-canine = Canino.

chat-speech-verb-canine-1 = Late

chat-speech-verb-canine-2 = Woofs

chat-speech-verb-canine-3 = Uivar

chat-speech-verb-name-goat =  Cabra

chat-speech-verb-goat-1 = Bleats

chat-speech-verb-goat-2 = Grunhidos

chat-speech-verb-goat-3 = Chora

chat-speech-verb-name-sheep = Ovelhas

chat-speech-verb-sheep-1 = Bleats

chat-speech-verb-sheep-2 = Baas.

chat-speech-verb-name-small-mob = Rato

chat-speech-verb-small-mob-1 = Gritos

chat-speech-verb-small-mob-2 = Pies.

chat-speech-verb-name-large-mob = Carpa.

chat-speech-verb-large-mob-1 = rugidos

chat-speech-verb-large-mob-2 = Rosnados

chat-speech-verb-name-monkey =  Macaco.

chat-speech-verb-monkey-1 = Chimpers.

chat-speech-verb-monkey-2 =  Gritos

chat-speech-verb-name-cluwne = Cluwne

chat-speech-verb-name-parrot = Papagaio.

chat-speech-verb-parrot-1 =  Gritos

chat-speech-verb-parrot-2 = tweets

chat-speech-verb-parrot-3 = Chirps

chat-speech-verb-cluwne-1 = Risadas

chat-speech-verb-cluwne-2 = Guffaws

chat-speech-verb-cluwne-3 = Riso

chat-speech-verb-name-ghost =  Fantasma

chat-speech-verb-ghost-1 = reclama

chat-speech-verb-ghost-2 =  respira

chat-speech-verb-ghost-3 = Hums.

chat-speech-verb-ghost-4 = Mutters.

chat-speech-verb-name-electricity =  Eletricidade

chat-speech-verb-electricity-1 = "Crackles"

chat-speech-verb-electricity-2 = Buzzes

chat-speech-verb-electricity-3 =  Gritos

chat-speech-verb-vulpkanin-1 = Rawrs.

chat-speech-verb-vulpkanin-2 = Late

chat-speech-verb-vulpkanin-3 = Rurs.

chat-speech-verb-vulpkanin-4 = - Sim, sim.

chat-speech-verb-vulpkanin =  Vulpkanin

chat-speech-verb-name-wawa = Wawa.

chat-speech-verb-wawa-1 = - É isso aí.

chat-speech-verb-wawa-2 =  estados

chat-speech-verb-wawa-3 =  declara

chat-speech-verb-wawa-4 = ponderou
