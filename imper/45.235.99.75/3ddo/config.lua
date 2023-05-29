-- @desc Shared config file
-- @author Elio
-- @version 2.0

-- Global configuration
Config = {
    language = 'en',
    color = { r = 125, g = 113, b = 230, a = 241 }, -- Text color
    font = 10, -- Text font
    time = 5000, -- Duration to display the text (in ms)
    scale = 0.9, -- Text scale
    dist = 250, -- Min. distance to draw 
} 

-- Languages available
Languages = {
    ['en'] = {
        commandName = 'do',
        commandDescription = 'Display an action above your head.',
        commandSuggestion = {{ name = 'action', help = '"scratch his nose" for example.'}},
        prefix = ' '
    },
    ['fr'] = {
        commandName = 'me',
        commandDescription = 'Affiche une action au dessus de votre tête.',
        commandSuggestion = {{ name = 'action', help = '"se gratte le nez" par exemple.'}},
        prefix = 'l\'individu '
    },
}
