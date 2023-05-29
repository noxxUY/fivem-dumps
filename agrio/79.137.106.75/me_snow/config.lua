-- ## 3dme : shared config file

Config = {
    language = 'en',
    visual = {
        color = { r = 230, g = 0, b = 0, a = 255 }, -- Text color
        color1 = { r = 0, g = 0, b = 255, a = 255 }, -- Text color
        font = 0, -- Text font
        time = 5000, -- Duration to display the text (in ms)
        scale = 0.5, -- Text scale
        dist = 20, -- Min. distance to draw 
    },
}

Languages = {
    ['en'] = {
        commandName = 'me',
        commandDescription = 'Display an action above your head.',
        commandSuggestion = {{ name = 'action', help = '"scratch his nose" for example.'}},
        prefix = 'ME ',
        prefix1 = 'DO '
    },
    ['fr'] = {
        commandName = 'me',
        commandDescription = 'Affiche une action au dessus de votre tête.',
        commandSuggestion = {{ name = 'action', help = '"se gratte le nez" par exemple.'}},
        prefix = 'l\'individu '
    },
}
