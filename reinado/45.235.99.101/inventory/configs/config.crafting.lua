Config.Crafting = true -- toggle crafting plugin | default: true
Config.CraftingBuiltIn = true -- enabled crafting locations | default: true
Config.CraftingDelay = 250 -- delay of opening crafting menu | default: 250
Config.CraftingLocations = {
  ["craft"] = {
    label = 'Armeria',
    license = 'armero', -- add license name here, esx_license required!
    jobs = false, -- set to false to disable whitelisting
    job_grades = false, -- set to false to disable grading
    blip = {id = 499, color = 1, scale = 0.7, hiddenForOthers = false},
    locations = {
      vector3(1511.8625, -2125.1262, 75.8652)
    },
    items = {
      {type = 'weapon', name = 'weapon_sniperrifle', count = 250, time = 10, ingredients = {
        {name = 'p_bocadecanon', count = 12},
        {name = 'p_canon', count = 6},
        {name = 'p_acople', count = 9},
        {name = 'p_cargador', count = 11},
        {name = 'p_culata', count = 7},
        {name = 'p_empunadura', count = 12},
        {name = 'p_mira', count = 5},
        {name = 'cocaine_cien', count = 1}
      }},
      {type = 'weapon', name = 'weapon_assaultrifle_mk2', count = 250, time = 10, ingredients = {
        {name = 'p_bocadecanon', count = 9},
        {name = 'p_canon', count = 3},
        {name = 'p_acople', count = 5},
        {name = 'p_cargador', count = 7},
        {name = 'p_culata', count = 3},
        {name = 'p_empunadura', count = 9},
        {name = 'p_mira', count = 3},
        {name = 'porro_cien', count = 1}
      }},
      {type = 'weapon', name = 'weapon_assaultrifle', count = 250, time = 10, ingredients = {
        {name = 'p_bocadecanon', count = 4},
        {name = 'p_canon', count = 1},
        {name = 'p_acople', count = 2},
        {name = 'p_cargador', count = 3},
        {name = 'p_culata', count = 1},
        {name = 'p_empunadura', count = 4},
        {name = 'p_mira', count = 1},
        {name = 'opio_cien', count = 1}
      }},
      {type = 'item', name = 'p_bocadecanon', count = 1, time = 2, ingredients = {
        {name = 'iron', count = 15},
        {name = 'copper', count = 20},
        {name = 'gold', count = 5}
      }},
      {type = 'item', name = 'p_canon', count = 1, time = 2, ingredients = {
        {name = 'iron', count = 5},
        {name = 'copper', count = 20},
        {name = 'gold', count = 15}
      }},
      {type = 'item', name = 'p_acople', count = 1, time = 2, ingredients = {
        {name = 'iron', count = 15},
        {name = 'copper', count = 20},
        {name = 'gold', count = 5}
      }},
      {type = 'item', name = 'p_cargador', count = 1, time = 2, ingredients = {
        {name = 'iron', count = 15},
        {name = 'copper', count = 20},
        {name = 'gold', count = 5}
      }},
      {type = 'item', name = 'p_culata', count = 1, time = 2, ingredients = {
        {name = 'iron', count = 15},
        {name = 'copper', count = 20},
        {name = 'gold', count = 5}
      }},
      {type = 'item', name = 'p_empunadura', count = 1, time = 2, ingredients = {
        {name = 'iron', count = 15},
        {name = 'copper', count = 20},
        {name = 'gold', count = 5}
      }},
      {type = 'item', name = 'p_mira', count = 1, time = 2, ingredients = {
        {name = 'iron', count = 5},
        {name = 'copper', count = 20},
        {name = 'gold', count = 15}
      }},
    }
  },
  ["craft2"] = {
    label = 'El Importador',
    license = false, -- add license name here, esx_license required!
    jobs = false, -- set to false to disable whitelisting
    job_grades = false, -- set to false to disable grading
    blip = {id = 499, color = 1, scale = 0.7, hiddenForOthers = false},
    locations = {
      vector3(1338.5983, 4359.6216, 43.7670)
    },
    items = {
      {type = 'item', name = 'id_card', count = 1, time = 10, ingredients = {
        {name = 'cocaine_cien', count = 5},
        {name = 'meta_cien', count = 5},
        {name = 'opio_cien', count = 5},
        {name = 'porro_cien', count = 5}
      }},
      {type = 'item', name = 'cocaine_cien', count = 1, time = 10, ingredients = {
        {name = 'cocawithout', count = 100}
      }},
      {type = 'item', name = 'meta_cien', count = 1, time = 10, ingredients = {
        {name = 'meth_pooch', count = 100}
      }},
      {type = 'item', name = 'opio_cien', count = 1, time = 10, ingredients = {
        {name = 'opium_pooch', count = 100}
      }},
      {type = 'item', name = 'porro_cien', count = 1, time = 10, ingredients = {
        {name = 'porro', count = 100}
      }},
    }
  }
}