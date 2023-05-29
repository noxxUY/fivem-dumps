Translations = {}

function _(str, ...) -- Translate string
    if Translations[Config.TranslationSelected] ~= nil then
        if Translations[Config.TranslationSelected][str] ~= nil then
            return string.format(Translations[Config.TranslationSelected][str], ...)
        else
            return 'Translation [' .. Config.TranslationSelected .. '][' .. str .. '] does not exist'
        end
    else
        return 'Locale [' .. Config.TranslationSelected .. '] does not exist'
    end
end

function _U(str, ...) -- Translate string first char uppercase
    return tostring(_(str, ...):gsub('^%l', string.upper))
end

Translations['en'] = {
    ['limit_exceed'] = 'Su apuesta es demasiado baja o demasiado alta para esta mesa.',
    ['invalid_bet'] = 'Monto de la apuesta inválida.',
    ['chair_used'] = 'Esta silla está ocupada.',
    ['can_not_bet_because_started'] = 'El juego comenzó, no podes apostar en este momento..',
    ['not_enough_chips'] = 'No tenes suficiente dinero.',
    ['input_place_bet'] = 'Cuanto te gustaria apostar?',
    -- help msg
    ['help_sit_rulett'] = '~INPUT_CONTEXT~ Para sentarte en la mesa.',
    ['help_rulett_all'] = '~INPUT_CELLPHONE_CANCEL~ Salir\n~INPUT_CONTEXT~ Cambiar camara\n~INPUT_LOOK_LR~ Seleccionar numero\n~INPUT_ATTACK~ Apostar a numero\n~INPUT_CELLPHONE_UP~ Subir apuesta\n~INPUT_CELLPHONE_DOWN~ Bajar apuesta\n~INPUT_JUMP~ Ingresar cantidad a apostar',
    -- nui
    ['starting_soon'] = 'El juego comenzará pronto..',
    ['game_going_on'] = 'La ruleta esta girando..',
    ['seconds'] = 'Segundos.',
    -- formatted msg
    ['won_chips'] = 'Ganaste %s dolares. Mutiplicaste: x%s',
    ['placed_bet'] = 'Apuesta de %s realizada.'
}

Translations['hu'] = {
    ['limit_exceed'] = 'Túl nagy vagy túl alacsony a téted.',
    ['invalid_bet'] = 'Érvénytelen tét érték.',
    ['chair_used'] = 'Ez a szék foglalt.',
    ['can_not_bet_because_started'] = 'Már elkezdődött a játszma, nem rakhatsz tétet.',
    ['not_enough_chips'] = 'Nincs elég chipsed hogy megtedd a tétet.',
    ['input_place_bet'] = 'Tét megadása',
    -- help msg
    ['help_sit_rulett'] = '~INPUT_CONTEXT~ Leülés a rulett asztalhoz.',
    ['help_rulett_all'] = '~INPUT_CELLPHONE_CANCEL~ Felállás\n~INPUT_CONTEXT~ Kameranézet váltás.\n~INPUT_LOOK_LR~ Szám kiválasztása\n~INPUT_ATTACK~ Szám megrakása\n~INPUT_CELLPHONE_UP~ Tét emelése\n~INPUT_CELLPHONE_DOWN~ Tét csökkentése\n~INPUT_JUMP~ Tét megadása',
    -- nui
    ['starting_soon'] = 'Játék hamarosan kezdődik..',
    ['game_going_on'] = 'Játék jelenleg folyamatban..',
    ['seconds'] = 'másodperc.',
    -- formatted msg
    ['won_chips'] = 'Nyertél %s chipset.\n(Szorzó x%s)',
    ['placed_bet'] = 'Tét megrakva %s chipssel.'
}
