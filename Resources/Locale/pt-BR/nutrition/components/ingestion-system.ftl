ingestion-you-need-to-hold-utensil = Você precisa estar segurando { INDEFINITE($utensil) } { $utensil } para comer isso!

ingestion-try-use-is-empty = { CAPITALIZE(THE($entity)) } está vazio!

ingestion-try-use-wrong-utensil = Você não pode { $verb } { THE($food) } com { INDEFINITE($utensil) } { $utensil }.

ingestion-remove-mask = Você precisa tirar o { $entity } primeiro.

ingestion-you-cannot-ingest-any-more = Você não pode { $verb } mais!

ingestion-other-cannot-ingest-any-more = { CAPITALIZE(SUBJECT($target)) } não pode { $verb } mais!

ingestion-cant-digest = Você não pode digerir { THE($entity) }!

ingestion-cant-digest-other = { CAPITALIZE(SUBJECT($target)) } não consegue digerir { THE($entity) }!

ingestion-verb-food = Comer

ingestion-verb-drink = Beber

-edible-satiated =
    { $satiated ->
        [true] { " " } Você não sente que pode { $verb } mais.
       *[false] { "" }
    }

edible-nom = Nhom. { $flavors }{ -edible-satiated(satiated: $satiated, verb: "comer") }

edible-nom-other = Nhom.

edible-slurp = Glup. { $flavors }{ -edible-satiated(satiated: $satiated, verb: "beber") }

edible-slurp-other = Glup.

edible-swallow = Você engole { THE($food) }.{ -edible-satiated(satiated: $satiated, verb: "engolir") }

edible-gulp = Glup. { $flavors }

edible-gulp-other = Glup.

edible-has-used-storage = Você não pode { $verb } { THE($food) } com um item armazenado dentro.

edible-noun-edible = comestível

edible-noun-food = comida

edible-noun-drink = bebida

edible-noun-pill = pílula

edible-verb-edible = ingerir

edible-verb-food = comer

edible-verb-drink = beber

edible-verb-pill = engolir

edible-force-feed = { CAPITALIZE(THE($user)) } está tentando fazer você { $verb } algo!

edible-force-feed-success = { CAPITALIZE(THE($user)) } forçou você a { $verb } algo! { $flavors }{ -edible-satiated(satiated: $satiated, verb: $verb) }

edible-force-feed-success-user = Você alimentou { THE($target) } com sucesso!
