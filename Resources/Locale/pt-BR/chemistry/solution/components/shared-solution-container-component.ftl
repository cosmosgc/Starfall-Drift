shared-solution-container-component-on-examine-main-text =
     Ele contém { INDEFINITE($desc) } [color={ $color }]{ $desc }[/color] { $chemCount ->
        [1]  química.
       *[other]  mistura de produtos químicos.
    }

examinable-solution-has-recognizable-chemicals =  Você pode reconhecer { $recognizedString } na solução.

examinable-solution-recognized = [color={ $color }]{ $chemical }[/color]

examinable-solution-on-examine-volume =
    A solução contida está { $fillLevel ->
        [exact] segurando [color=white]{ $current }/{ $max }u[/color].
       *[other] [bold]{ -solution-vague-fill-level(fillLevel: $fillLevel) }[/bold].
    }

examinable-solution-on-examine-volume-no-max =
    A solução contida está { $fillLevel ->
        [exact] segurando [color=white]{ $current }u[/color].
       *[other] [bold]{ -solution-vague-fill-level(fillLevel: $fillLevel) }[/bold].
    }

examinable-solution-on-examine-volume-puddle =
    A poça é { $fillLevel ->
        [exact] [color=white]{ $current }U[/color].
        [full] Grande e transbordante!
        [mostlyfull] Grande e transbordante!
        [halffull] profunda e fluindo.
        [halfempty] Muito profunda.
       *[mostlyempty]  Juntando-se.
        [empty]  formando várias pequenas piscinas.
    }

-solution-vague-fill-level =
    { $fillLevel ->
        [full] [color=white]Cheio[/color]
        [mostlyfull] [color=#DFDFDF]Quase cheio[/color]
        [halffull] [color=#C8C8C8]Meio cheio[/color]
        [halfempty] [color=#C8C8C8]Meio vazio[/color]
        [mostlyempty] [color=#A4A4A4]Quase vazio[/color]
       *[empty] [color=gray]Vazio[/color]
    }
