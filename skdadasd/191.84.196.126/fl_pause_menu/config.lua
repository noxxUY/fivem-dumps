config = {
    discordLink = "https://discord.gg/YxZ3aRYn4A", -- Set discrod link
    discord_Webhook = "https://discord.com/api/webhooks/1088954467401076766/f1IQK3HyHmB7zhD0PK7_C_S8zBYweXHHt4q-7t4vrtYDxCydPphFLutgrg76-5aoh02g",
    discord_WebhookName = "Lagorra",
    discord_footer_message = "Mensaje de reporte: ",
    discord_WebhookColor = 16753920, -- Only decimal color
    discord_error_message = "Error en reporte!",

    ServerName = 'ParkZ RP', -- Server Name
    server_language = 'en', -- en or hu

    -- Section Names and text
    Sections = {
        News = {
            title = 'Novedades', 
            text = 'Drogas parcialmente funcionando. Nuevo acto delictivo con airdrop paraguayo.'
        }, -- News Section

        Updates = {
            title = 'Actualizaciones del sv', 
            text = 'El servidor sigue en beta hasta el dia 30/04'
        }, -- Updates Section

        CharacterInfo = {
            title = 'Información del personaje', 
        }, -- Charachter Information Section
        
        Rules = {
            title = 'Reglas', 
        }, -- Rules Section

        Report = {
            title = 'Reportes', 
            text = 'Seguimo en beta'
        }, -- Report Section

        DiscordSection = {
            title = 'Discord', 
            text = 'Este boton copia el link de nuestro discord!'
        }, -- Discord Section

        SubmitSection = {
            title = 'Enviar', 
            text = 'Enviar reporte!'
        }, -- Submit Section

        CustomSection = {
            title = 'Proximos eventos', 
            text = 'SABADO 23 HS - INAUGURACIÓN OFICIAL DE DIAMOND CASINO'
        }, -- Submit Section

    },


    -- Set Button title and text
    Buttons = {
        MapSection = {
            title = 'Mapa', 
            text = 'Ingresa al mapa de la ciudad!'
        }, 
        SettingsSection = {
            title = 'Opciones', 
            text = 'Opciones de GTA!'
        },
        ResumeSection = {
            title = 'Volver', 
            text = 'Volver a jugar!'
        },
        DisconnectSection = {
            title = 'Desconectar', 
            text = 'Desconectar del servidor'
        },
    },

    -- Set rules
    rules = {
        -- First Rule
        {
            title = 'Metagaming (MG)',
            text = 'El MG se produce cuando se usa cualquier tipo de información obtenida fuera del juego, ya sea de forma intencional o por error, para obtener beneficio. Está prohibido y conlleva a una sanción'
        },

        -- Second Rule
        {
            title = 'Rol de entorno',
            text = 'El rol de entorno es todo aquello que nos rodea y tenemos que simular a través de nuestra mente e interpretación.'
        },

        -- Third Rule
        {
            title = 'Player Kill (PK)',
            text = 'Cuando tu personaje muere y es reanimado por un médico, pierdes la memoria, por lo que no podrás acordarte de quien, o que, como, cuando, donde ni nada relacionado con tu muerte de forma In Character (IC), todo aquello vivido, sabido y visto que nos relacione con el motivo de este Player Kill (PK) será olvidado..'
        },

        -- 4 Rule
        {
            title = 'Revenge Kill (RK)',
            text = 'Cuando un jugador hace caso omiso al rol de pérdida de memoria explicado anteriormente (PK) y acude al lugar donde ha muerto a tomar represalias contra su asesino. Está prohibido y conlleva una sanción.'
        },
        -- 5 Rule
        {
            title = 'Character Kill (CK)',
            text = 'Muerte total de tu personaje. No se podrá volver a usar el mismo personaje en todas las pérdidas que eso conlleva. Deberás crear un nuevo personaje desde cero.'
        },
        -- 6 Rule
        {
            title = 'DeathMatch (DM)',
            text = 'Jugador que se dedica a agredir o matar al resto de jugadores sin motivo aparente o rol previo. Está prohibido y conlleva una sanción.'
        },
        -- 7 Rule
        {
            title = 'Vehicle Deathmatch (VDM)',
            text = 'Jugador que se dedica a atropellar ya sea hiriendo ó hasta dejando inconsciente a uno ó varios jugadores. Está prohibido y conlleva una sanción.'
        },
        -- 8 Rule
        {
            title = 'Power Gaming (PG)',
            text = 'Al estar en un videojuego podemos hacer cosas que en la vida real no podrían hacerse, ya sea porque no tienen sentido ni lógica o directamente porque sería imposible. PG engloba también el forzar el rol del otro jugador sin darle la posibilidad a reaccionar tras una acción tuya. Recordamos que estamos en un servidor de rol y después de una acción, viene una reacción.'
        },
        -- 9 Rule
        {
            title = 'Valorar tu vida',
            text = ' En un conflicto donde tu vida se vea en peligro debes de tener en cuenta como reaccionarias en la vida real por temor a perderla y siempre teniendo en cuenta la historia de tu personaje y como reaccionaria en cada situación, por normativa se permite que en caso de inferioridad numérica 1 vs 3 y con igualdad o superioridad de equipamiento/armas se contraataque en respuesta a los objetivos.'
        },
         -- 10 Rule
        {
            title = 'Ver Reglamento completo',
            text = 'http://reglas.parkz.com.ar'
        },
    },

    -- Set placeholder text
    placeHolders = {
        text = "Complete el reporte con ID victima, ID de la persona a la que queres reportar, imagenes subidas a discord o imgur o video subido a cualquier plataforma.",
        title = "Titulo del reporte",
    },

    time = {
        text = "personas"
    }
}