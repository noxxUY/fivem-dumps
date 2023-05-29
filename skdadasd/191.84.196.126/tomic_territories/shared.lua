shared = {
    language = 'en', -- language [en/hr/fr]
    adminCommand = 'territorio', -- /territory (create/delete)
    playerCommand = 'territorios', -- /territories [territory list]
    groups = {'admin', 'superadmin'}, -- group required to manage territories
    rankings = true, -- rank list and points for gangs? (true/false) (not user-friendly yet, but translated at least)
    capturing = 5, -- in minutes
    cooldown = 30, -- in minutes
    rewards = { -- reward is given only after successfully capturing the territory
        on = off, -- off (false) / on (true)
        item = 'black_money', -- item name
        count = 10000 -- amount
    },
    itemsToBuy = { -- buyable items if territory type is 'market'
        ['drugscales'] = {
            label = '🌿 | Balanza',
            worth = 5000,
            black = true, -- true = black money, false = cash
        },
        ['dopebag'] = {
            label = '🌿 | Bolsa Ziploc',
            worth = 5,
            black = true, -- true = black money, false = cash
        },
        ['plantpot'] = {
            label = '🌿 | Maceta',
            worth = 80,
            black = true, -- true = black money, false = cash
        },
        ['wateringcan'] = {
            label = '🌿 | Regadera',
            worth = 200,
            black = true, -- true = black money, false = cash
        },
        ['purifiedwater'] = {
            label = '🌿 | Agua Purificada',
            worth = 50,
            black = true, -- true = black money, false = cash
        },
        ['lowgradefert'] = {
            label = '🌿 | Fertilizante',
            worth = 50,
            black = true, -- true = black money, false = cash
        },
        ['highgradefert'] = {
            label = '🌿 | Fertilizante de calidad',
            worth = 100,
            black = true, -- true = black money, false = cash
        },
        ['highgradefemaleseed'] = {
            label = '🌿 | Semilla AK47 Feminizada',
            worth = 780,
            black = true, -- true = black money, false = cash
        },
        ['lowgradefemaleseed'] = {
            label = '🌿 | Semilla Feminizada Regular',
            worth = 400,
            black = true, -- true = black money, false = cash
        }
    },
    itemsToSell = { -- sellable items if territory type is 'dealer'
        ['bagofdope'] = {
            label = '🌿 | Marijuana',
            worth = 2200,
            black = true, -- true = black money, false = cash
        },
        ['heroin'] = {
            label = '💉 | Heroin',
            worth = 600,
            black = true, -- true = black money, false = cash
        },
        ['amfetamin10g'] = {
            label = '💊 | Amphetamine',
            worth = 800,
            black = true, -- true = black money, false = cash
        },
        ['coke_pooch'] = {
            label = '🏔️ | Cocaine',
            worth = 750,
            black = true, -- true = black money, false = cash
        }
    },
    gangs = { -- https://docs.fivem.net/docs/game-references/blips/ || gangs allowed to capture territories (job name) and blip color
        police = { -- job
            blipColour = 37, -- blip color
        },
        taxi = { -- job
            blipColour = 33, -- blip color
        },
        uber = { -- job
            blipColour = 40, -- blip color
        }
    },
    translations = {
        ['en'] = {
            -- Client Notifications
            ['something_went_wrong'] = 'Error!',
            ['fill_all_fields_out'] = 'Llena el formulario de manera correcta!',
            ['incorrect_amount'] = 'El monto no puede ser menos de 1!',
            ['territory_not_owned'] = 'Este no es tu territorio!',
            ['territory_already_owned'] = 'Este territorio ya te pertenece!',
            ['capture_in_progress'] = 'Alguien esta intentando conquistar este territorio!',
            ['territory_on_cooldown'] = 'Este territorio fue recientemente conquistado, o por lo menos lo intentaron!',
            ['too_far_away'] = 'Estas demasiado lejos del territorio!',
            ['territory_captured'] = 'Capturaste %s!',
            ['territory_cause_death'] = 'Estas muerto, ya no podes seguir tomando el territorio!',
            ['territory_cause_distance'] = 'Saliste del territorio, no podes seguir reclamando el control!',
            ['territory_show_text'] = '[E] - Info | %s',
            ['territory_capture_progress_bar'] = 'Capturando...',
            -- Blips
            ['territory_blip_occupied'] = 'Territorio: %s | Dueño: %s',
            ['territory_blip_unoccupied'] = 'Desocupado',
            -- Client Context Menu
            ['territory_menu_context_title'] = 'Territorios',
            ['territory_menu_title'] = 'Territorios | 🎲',
            ['territory_list_title'] = 'Lista de territorios | 🚩',
            ['territory_list_metadata'] = 'Lista de los territorios.',
            ['territory_list_territory_name'] = '💀 | Territorio: %s',
            ['territory_list_territory_owner'] = '🚩 | Dueño: %s',
            ['territory_list_territory_capturing'] = 'Capturando: %s',
            ['territory_list_territory_cooldown'] = 'Cooldown: %s',
            ['territory_info_menu'] = 'Territorio: %s | 🎲',
            ['territory_info_menu_capture'] = 'Capturar el territorio | 🚩',
            ['territory_info_menu_stash'] = 'Stash | 📦',
            ['territory_info_menu_sell'] = 'Venta de narcoticos | 🌿',
            ['territory_info_menu_buy'] = 'Compra ilegal | 🛒',
            ['territory_info_menu_sell_title'] = 'Items para vender',
            ['territory_info_menu_buy_title'] = 'Items para comprar',
            ['territory_info_menu_buy_sell_price'] = '💸 | Precio: $%s',
            ['territory_rankings_menu_context_title'] = 'Ranking',
            ['territory_rankings_title'] = 'Ranking | 🏆',
            ['territory_rankings_metadata'] = 'Mostrar la lista de todas las organizaciones ilegales...',
            ['territory_rankings_all_time'] = '⭐ | Puntos totales: %s',
            ['territory_rankings_monthly'] = '⭐ | Puntos mensuales: %s',
            ['territory_rankings_weekly'] = '⭐ | Puntos semanales: %s',
            ['territory_rankings_gang'] = '💀 | Organización: %s',
            ['territory_rankings_position'] = '🏆 | Posición: %s',
            ['territory_create_input'] = 'Crear nuevo territorio',
            ['territory_create_name'] = 'Nombre de territorio',
            ['territory_create_radius'] = 'Radio',
            ['territory_create_type'] = 'Tipo de territorio',
            ['territory_create_type_market'] = 'Market (Buying)',
            ['territory_create_type_dealer'] = 'Market (Selling)',
            ['territory_create_type_default'] = 'Default (Stash Only)',
            ['territory_delete_input'] = 'Delete a territory',
            ['territory_delete_input_name'] = 'Territory name',
            ['context_yes'] = 'Yes',
            ['context_no'] = 'No',
            ['amount'] = 'monto',
            -- NUI Messages
            ['defender_message'] = 'Defende tu territorio!',
            ['attacker_message'] = 'Captura en progreso!',
            -- Server Notifications
            ['no_permission'] = 'No tenes permisos para utilizar este comando!',
            ['no_args'] = 'Usage: /territory [create/delete]',
            ['territory_already_exists'] = 'Territory with that name already exists!',
            ['territory_creation_failed'] = 'Territory creation failed!',
            ['territory_created'] = 'Territory created!',
            ['territory_deletion_failed'] = 'Territory deletion failed!',
            ['territory_deleted'] = 'Territory deleted!',
            ['territory_being_attacked'] = 'Territorio: %s Fue atacado por otro bando!',
            ['territory_started_attacking'] = 'Tu bando esta conquistando el territorio: %s',
            ['invalid_amount'] = 'Usted no cuenta con ese monto!',
            ['not_enough_money'] = 'No tenes dinero!',
            ['not_enough_space'] = 'No tenes espacio en el inventario!',
            ['territory_reward'] = 'Ganaste $%s como recompenza por conquistar: %s',
            ['already_used'] = 'Wait for the restart to use the command again.',
            ['no_message'] = 'The message is empty.'
        },
        ['hr'] = {
            -- Client Notifications
            ['something_went_wrong'] = 'Greška!',
            ['fill_all_fields_out'] = 'Morate točno ispuniti sva polja!',
            ['incorrect_amount'] = 'Količina ne može biti manja od 1',
            ['territory_not_owned'] = 'Ne posjedujete ovu teritoriju!',
            ['territory_already_owned'] = 'Ova teritorija već pripada vama!',
            ['capture_in_progress'] = 'Netko već zauzima ovu teritoriju!',
            ['territory_on_cooldown'] = 'Ova teritorija je na cooldown-u!',
            ['too_far_away'] = 'Predaleko ste od teritorije!',
            ['territory_captured'] = 'Uspješno ste zauzeli teritoriju %s!',
            ['territory_cause_death'] = 'Umrli ste, zauzimanje je prekinuto!',
            ['territory_cause_distance'] = 'Napustili ste teritoriju, zauzimanje je prekinuto!',
            ['territory_show_text'] = '[E] - Info | %s',
            ['territory_capture_progress_bar'] = 'Zauzimanje...',
            -- Blips
            ['territory_blip_occupied'] = 'Teritorija: %s | Vlasnik: %s',
            ['territory_blip_unoccupied'] = 'Nitko',
            -- Client Context Menu
            ['territory_menu_context_title'] = 'devTomic | Popis teritorija',
            ['territory_menu_title'] = 'Teritorije | 🎲',
            ['territory_list_title'] = 'Popis teritorija | 🚩',
            ['territory_list_metadata'] = 'Popis svih dostupnih teritorija.',
            ['territory_list_territory_name'] = '💀 | Teritorija: %s',
            ['territory_list_territory_owner'] = '🚩 | Vlasnik: %s',
            ['territory_list_territory_capturing'] = 'Zauzima se: %s',
            ['territory_list_territory_cooldown'] = 'Na cooldown-u: %s',
            ['territory_info_menu'] = 'Teritorija: %s | 🎲',
            ['territory_info_menu_capture'] = 'Zauzmite teritoriju | 🚩',
            ['territory_info_menu_stash'] = 'Stash teritorije | 📦',
            ['territory_info_menu_sell'] = 'Prodaja | 🌿',
            ['territory_info_menu_buy'] = 'Kupovina | 🛒',
            ['territory_info_menu_sell_title'] = 'devTomic | Prodaja item-a',
            ['territory_info_menu_buy_title'] = 'devTomic | Kupovina item-a',
            ['territory_info_menu_buy_sell_price'] = '💸 | Cijena: $%s',
            ['territory_rankings_menu_context_title'] = 'devTomic | Rank List-a',
            ['territory_rankings_title'] = 'Rank List-a | 🏆',
            ['territory_rankings_metadata'] = 'Lista organizacija i poeni...',
            ['territory_rankings_all_time'] = '⭐ | Ukupni poeni: %s',
            ['territory_rankings_monthly'] = '⭐ | Mjesečni poeni: %s',
            ['territory_rankings_weekly'] = '⭐ | Tjedni poeni: %s',
            ['territory_rankings_gang'] = '💀 | Organizacija: %s',
            ['territory_rankings_position'] = '🏆 | Pozicija: %s',
            ['territory_create_input'] = 'Napravite novu teritoriju',
            ['territory_create_name'] = 'Ime teritorije',
            ['territory_create_radius'] = 'Radius',
            ['territory_create_type'] = 'Tip teritorije',
            ['territory_create_type_market'] = 'Prodavnica (Kupovina)',
            ['territory_create_type_dealer'] = 'Prodavnica (Prodaja)',
            ['territory_create_type_default'] = 'Default (Samo stash)',
            ['territory_delete_input'] = 'Obrisite teritoriju',
            ['territory_delete_input_name'] = 'Ime teritorije',
            ['context_yes'] = 'Da',
            ['context_no'] = 'Ne',
            ['amount'] = 'Količina',
            -- NUI Messages
            ['defender_message'] = 'Obranite svoju teritoriju!',
            ['attacker_message'] = 'Zauzimanje u tijeku!',
            -- Server Notifications
            ['no_permission'] = 'Nemate dozvolu za tu komandu!',
            ['no_args'] = 'Upotreba: /territory [create/delete]',
            ['territory_already_exists'] = 'Teritorija s tim imenom već postoji!',
            ['territory_creation_failed'] = 'Teritorija neuspješno kreirana!',
            ['territory_created'] = 'Teritorija kreirana!',
            ['territory_deletion_failed'] = 'Teritorija neuspješno obrisana!',
            ['territory_deleted'] = 'Teritorija obrisana!',
            ['territory_being_attacked'] = 'Teritorija: %s je napadnuta od strane druge organizacije!',
            ['territory_started_attacking'] = 'Vaša organizacija je napala teritoriju: %s',
            ['invalid_amount'] = 'Ne posjedujete tu količinu kod sebe!',
            ['not_enough_money'] = 'Nemate dovoljno novca!',
            ['not_enough_space'] = 'Nemate dovoljno prostora u rancu!',
            ['territory_reward'] = 'Dobili ste $%s kao nagradu za zauzimanje teritorije: %s',
            ['already_used'] = 'Već ste iskoristili tu komadnu! Pričekajte server restart.',
            ['no_message'] = 'Poruka je prazna.'
        },
        ['fr'] = {
            -- Client Notifications
            ['something_went_wrong'] = 'Quelque chose s\'est mal passé !',
            ['fill_all_fields_out'] = 'Vous devez remplir tous les champs correctement !',
            ['incorrect_amount'] = 'Le montant ne peut pas être inférieur à 1 !',
            ['territory_not_owned'] = 'Vous n\'êtes pas propriétaire de ce territoire !',
            ['territory_already_owned'] = 'Ce territoire vous appartient déjà !',
            ['capture_in_progress'] = 'Quelqu\'un prend déjà le territoire !',
            ['territory_on_cooldown'] = 'Ce territoire a été récemment capturé, ou une tentative de capture a été effectuée !',
            ['too_far_away'] = 'Vous êtes trop loin du territoire !',
            ['territory_captured'] = 'Vous avez capturé avec succès %s!',
            ['territory_cause_death'] = 'Tu es mort, la progression de la capture s\'est arrêtée !',
            ['territory_cause_distance'] = 'Vous avez quitté le territoire, la progression de la capture s\'est arrêtée !',
            ['territory_show_text'] = '[E] - Info | %s',
            ['territory_capture_progress_bar'] = 'Capture en cours...',
            -- Blips
            ['territory_blip_occupied'] = 'Territoire: %s | Propriétaire: %s',
            ['territory_blip_unoccupied'] = 'Inoccupé',
            -- Client Context Menu
            ['territory_menu_context_title'] = 'Liste des territoires',
            ['territory_menu_title'] = 'Territoires | 🎲',
            ['territory_list_title'] = 'Liste des territoires | 🚩',
            ['territory_list_metadata'] = 'Liste des territoires.',
            ['territory_list_territory_name'] = '💀 | Territoires: %s',
            ['territory_list_territory_owner'] = '🚩 | Propriétaire: %s',
            ['territory_list_territory_capturing'] = 'Capture: %s',
            ['territory_list_territory_cooldown'] = 'Attendez : %s',
            ['territory_info_menu'] = 'Territoires : %s | 🎲',
            ['territory_info_menu_capture'] = 'Capture le territoire | 🚩',
            ['territory_info_menu_stash'] = 'Réserve du territoire | 📦',
            ['territory_info_menu_sell'] = 'Racheteur | 🌿',
            ['territory_info_menu_buy'] = 'Vendeur | 🛒',
            ['territory_info_menu_sell_title'] = 'Articles vendables',
            ['territory_info_menu_buy_title'] = 'Articles achetables',
            ['territory_info_menu_buy_sell_price'] = '💸 | Prix : $%s',
            ['territory_rankings_menu_context_title'] = 'Liste de classement',
            ['territory_rankings_title'] = 'Liste de classement | 🏆',
            ['territory_rankings_metadata'] = 'Afficher la liste de toutes les organisations illégales, ainsi que les points...',
            ['territory_rankings_all_time'] = '⭐ | Points de tous les temps : %s',
            ['territory_rankings_monthly'] = '⭐ | Points mensuels : %s',
            ['territory_rankings_weekly'] = '⭐ | Points hebdomadaires : %s',
            ['territory_rankings_gang'] = '💀 | Gangs: %s',
            ['territory_rankings_position'] = '🏆 | Position: %s',
            ['territory_create_input'] = 'Créer un nouveau territoire',
            ['territory_create_name'] = 'Nom du territoire',
            ['territory_create_radius'] = 'Radius',
            ['territory_create_type'] = 'Type de territoire',
            ['territory_create_type_market'] = 'Marché (Achat)',
            ['territory_create_type_dealer'] = 'Marché (Vente)',
            ['territory_create_type_default'] = 'Par défaut (cache uniquement)',
            ['territory_delete_input'] = 'Supprimer un territoire',
            ['territory_delete_input_name'] = 'Nom du territoire',
            ['context_yes'] = 'Oui',
            ['context_no'] = 'Non',
            ['amount'] = 'Combien',
            -- NUI Messages
            ['defender_message'] = 'Défendez votre territoire !',
            ['attacker_message'] = 'Capture en cours !',
            -- Server Notifications
            ['no_permission'] = 'Vous n\'êtes pas autorisé à utiliser cette commande !',
            ['no_args'] = 'Utiliser: /territory [créer/supprimer]',
            ['territory_already_exists'] = 'Le territoire portant ce nom existe déjà !',
            ['territory_creation_failed'] = 'La création du territoire a échoué !',
            ['territory_created'] = 'Territoire créé !',
            ['territory_deletion_failed'] = 'Échec de la suppression du territoire !',
            ['territory_deleted'] = 'Territoire supprimé !',
            ['territory_being_attacked'] = 'Territoires: %s est attaqué par un autre gang !',
            ['territory_started_attacking'] = 'Votre gang a commencé à attaquer Territoire: %s',
            ['invalid_amount'] = 'Vous n\'avez pas ce montant !',
            ['not_enough_money'] = 'Vous n\'avez pas assez d\'argent !',
            ['not_enough_space'] = 'Vous n\'avez plus de place dans votre inventaire !',
            ['territory_reward'] = 'Vous avez $%s en récompense pour avoir capturé : %s',
            ['already_used'] = 'Attendez le redémarrage pour utiliser à nouveau la commande.',
            ['no_message'] = 'Le message est vide.'
        }
    },
    debugging = {
        allowPrints = true, -- This will allow prints to be shown in the console
        allowErrorAnalysis = true -- This will share errors with the developer (me) in order to improve the script
    }
}

function insert(tbl, val, i)
    local index = i or (#tbl + 1)
    tbl[index] = val
end

function translateMessage(message)
    local lang = shared.translations[shared.language]
    if not lang[message] then
        print('devTomic | Missing translation for: ' .. message)
        return message
    end

    return lang[message]
end

function debugPrint(msg)
    if not msg then return end
    msg = type(msg) == 'table' and json.encode(msg) or tostring(msg)

    if shared.debugging.allowPrints then
        print('devTomic | Line: ' .. debug.getinfo(3, "Sl").currentline .. ' | \n' .. msg)
    end

    if shared.debugging.allowErrorAnalysis then
        local logHeader = 'devTomic | Territories Log'
        local logMessage = 'Line: ' .. debug.getinfo(3, "Sl").currentline .. ' | \n' .. msg

        if IsDuplicityVersion() then
            logAction(logHeader, logMessage)
            return
        end

        TriggerServerEvent('tomic_territories:logAction', logHeader, logMessage)
    end
end