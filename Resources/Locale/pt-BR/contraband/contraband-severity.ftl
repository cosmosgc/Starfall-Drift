contraband-examine-text-Minor =
    { $type ->
        *[item] [color={$color}]Este item é considerado contrabando leve.[/color]
        [reagent] [color={$color}]Este reagente é considerado contrabando leve.[/color]
    }

contraband-examine-text-Restricted =
    { $type ->
        *[item] [color={$color}]Este item é restrito ao departamento.[/color]
        [reagent] [color={$color}]Este reagente é restrito ao departamento.[/color]
    }

contraband-examine-text-Restricted-department =
    { $type ->
        *[item] [color={$color}]Este item é restrito a {$departments} e pode ser considerado contrabando.[/color]
        [reagent] [color={$color}]Este reagente é restrito a {$departments} e pode ser considerado contrabando.[/color]
    }

contraband-examine-text-Major =
    { $type ->
        *[item] [color={$color}]Este item é considerado contrabando grave.[/color]
        [reagent] [color={$color}]Este reagente é considerado contrabando grave.[/color]
    }

contraband-examine-text-GrandTheft =
    { $type ->
        *[item] [color={$color}]Este item é um alvo altamente valioso para agentes do Sindicato![/color]
        [reagent] [color={$color}]Este reagente é um alvo altamente valioso para agentes do Sindicato![/color]
    }

contraband-examine-text-Highly-Illegal =
    { $type ->
        *[item] [color={$color}]Este item é contrabando altamente ilegal![/color]
        [reagent] [color={$color}]Este reagente é contrabando altamente ilegal![/color]
    }

contraband-examine-text-Syndicate =
    { $type ->
        *[item] [color={$color}]Este item é contrabando do Sindicato altamente ilegal![/color]
        [reagent] [color={$color}]Este reagente é contrabando do Sindicato altamente ilegal![/color]
    }

contraband-examine-text-Magical =
    { $type ->
        *[item] [color={$color}]Este item é contrabando mágico altamente ilegal![/color]
        [reagent] [color={$color}]Este reagente é contrabando mágico altamente ilegal![/color]
    }

contraband-examine-text-avoid-carrying-around = [color=red][italic]Provavelmente é melhor evitar carregar isso visivelmente sem um bom motivo.[/italic][/color]
contraband-examine-text-in-the-clear = [color=green][italic]Você pode carregar isso visivelmente sem problemas.[/italic][/color]

contraband-examinable-verb-text = Legalidade
contraband-examinable-verb-message = Verificar a legalidade deste item.

contraband-department-plural = {$department}
contraband-job-plural = { MAKEPLURAL($job) }
