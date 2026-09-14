guidebook-reagent-name = [bold][color={ $color }]{ CAPITALIZE($name) }[/color][/bold]

guidebook-reagent-recipes-header =  Receita

guidebook-reagent-recipes-reagent-display = [bold]{ $reagent }[/bold] \[{ $ratio }\]

guidebook-reagent-sources-header =  Fontes

guidebook-reagent-sources-ent-wrapper = [bold]{ $name }[/bold] \[1\]

guidebook-reagent-sources-gas-wrapper = [bold]{ $name } (gás)[/bold] \[1\]

guidebook-reagent-effects-header =  Efeitos

guidebook-reagent-effects-metabolism-stage-rate = [bold]{ $stage }[/bold] [color=gray]({ $rate }  unidades por segundo)[/color]

guidebook-reagent-effects-metabolite-item = { $reagent } a uma taxa de { NATURALPERCENT($rate, 2) }

guidebook-reagent-effects-metabolites = Metaboliza em { $items }.

guidebook-reagent-plant-metabolisms-header = Metabolismo de plantas

guidebook-reagent-plant-metabolisms-rate = [bold]Metabolismo de plantas[/bold] [color=gray](1 unidade a cada 3 segundos como base)[/color]

guidebook-reagent-physical-description = [italic] Parece que sim. { $description }.[/italic]

guidebook-reagent-recipes-mix-info =
    { $minTemp ->
        [0]
            { $hasMax ->
                [true] { CAPITALIZE($verb) }  Abaixo. { NATURALFIXED($maxTemp, 2) }K.
               *[false] { CAPITALIZE($verb) }
            }
       *[other]
            { CAPITALIZE($verb) } { $hasMax ->
                [true] entre { NATURALFIXED($minTemp, 2) }K e { NATURALFIXED($maxTemp, 2) }K.
               *[false]  Acima. { NATURALFIXED($minTemp, 2) }K.
            }
    }
