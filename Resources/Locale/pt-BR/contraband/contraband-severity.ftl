contraband-examine-text-Minor =
    { $type ->
       *[item] [color={ $color }]This item is considered minor contraband.[/color]
        [reagent] [color={ $color }]This reagent is considered minor contraband.[/color]
    }

contraband-examine-text-Restricted =
    { $type ->
       *[item] [color={ $color }]This item is departmentally restricted.[/color]
        [reagent] [color={ $color }]This reagent is departmentally restricted.[/color]
    }

contraband-examine-text-Restricted-department =
    { $type ->
       *[item] [color={ $color }]This item is restricted to { $departments }E pode ser considerado contrabando.[/color]
        [reagent] [color={ $color }]This reagent is restricted to { $departments }E pode ser considerado contrabando.[/color]
    }

contraband-examine-text-Major =
    { $type ->
       *[item] [color={ $color }]This item is considered major contraband.[/color]
        [reagent] [color={ $color }]This reagent is considered major contraband.[/color]
    }

contraband-examine-text-GrandTheft =
    { $type ->
       *[item] [color={ $color }]This item is a highly valuable target for Syndicate agents![/color]
        [reagent] [color={ $color }]This reagent is a highly valuable target for Syndicate agents![/color]
    }

contraband-examine-text-Highly-Illegal =
    { $type ->
       *[item] [color={ $color }]This item is highly illegal contraband![/color]
        [reagent] [color={ $color }]This reagent is highly illegal contraband![/color]
    }

contraband-examine-text-Syndicate =
    { $type ->
       *[item] [color={ $color }]This item is highly illegal Syndicate contraband![/color]
        [reagent] [color={ $color }]This reagent is highly illegal Syndicate contraband![/color]
    }

contraband-examine-text-Magical =
    { $type ->
       *[item] [color={ $color }]This item is highly illegal magical contraband![/color]
        [reagent] [color={ $color }]This reagent is highly illegal magical contraband![/color]
    }

contraband-examine-text-avoid-carrying-around = [color=red][italic] Provavelmente você quer evitar carregar isso visivelmente sem uma boa razão.[/italic][/color]

contraband-examine-text-in-the-clear = [color=green][italic] Você deve estar livre para carregar isso de forma visível.[/italic][/color]

contraband-examinable-verb-text = Legalidade.

contraband-examinable-verb-message =  Verifique a legalidade deste item.

contraband-department-plural = { $department }

contraband-job-plural = { MAKEPLURAL($job) }
