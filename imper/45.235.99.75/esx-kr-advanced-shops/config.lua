Config                      = {}
Config.DrawDistance         = 5.0
Config.Locale               = 'br'
Config.DeliveryTime         = 18000 -- EM RESULTADOS PADRÃO (18000) É 5 HORAS / 300 MINUTOS
Config.TimeBetweenRobberies = 300 -- Quantidade de tempo de um roubo para o outro em segundos PADRÃO (43200) É 12 HORAS / 720 MINUTOS
Config.CutOnRobbery         = 3 -- EM PORCENTAGEM DA LOJA-ALVO
Config.RequiredPolices      = 2 -- Quantidade de policiais on 
Config.SellValue            = 2 -- Este é o valor de venda das lojas dividido por 2
Config.ChangeNamePrice      = 500 -- Em $ - quanto você pode mudar o nome das lojas para
Config.OpeningHour          = 1
Config.ClosingHour          = 24

-- CONFIG ITEMS, DON'T FORGET TO ADD CORRECT NUMBER IN THE BRACKETS
Config.Items_Loja = {
  [1] = {label = "Água",               item = "water",       price = 15},
  [2] = {label = "Cocacola",           item = "cocacola",    price = 25},
  [3] = {label = "Redbull",            item = "redbull",     price = 15},
  [4] = {label = "Garrafa de leite",   item = "milk",        price = 25},
  [5] = {label = "Pão",                item = "bread",       price = 15},
  [6] = {label = "Hamburguer",         item = "sandwich",    price = 25},
  [7] = {label = "Celular",            item = "tel",         price = 300},
  [8] = {label = "Cigarro",            item = "cigarett",    price = 5},
  [9] = {label = "Esqueiro",           item = "lighter",     price = 5},
  [9] = {label = "Ração",              item = "croquettes",  price = 20},
}

Config.Items_Bar = {
  [1] = {label = "Redbull",    item = "redbull",     price = 15},
  [2] = {label = "Cachaça",    item = "tequila",     price = 15},
  [3] = {label = "Ceveja",     item = "beer",        price = 25},
  [4] = {label = "Vinho",      item = "wine",        price = 25},
  [5] = {label = "Vodka",      item = "vodka",       price = 25},
  [6] = {label = "Whisky",     item = "whisky",      price = 25},
  [7] = {label = "Cigarro",    item = "cigarett",    price = 5},
}

Config.Items_Conveniencia = {
  [1] = {label ="Polvora",                item = "polvora",         price = 15},
  [2] = {label = "Binóculos",             item = "binoculars",      price = 15},
  [3] = {label = "Carregador",            item = "clip",            price = 15},
  [4] = {label = "Lanterna",              item = "flashlight",      price = 25},
  [5] = {label = "Grip",                  item = "grip",            price = 25},
  [6] = {label = "Silenciador",           item = "silent",          price = 25},
  [7] = {label = "Mira",                  item = "scope",           price = 25},
  [8] = {label = "Colete",                item = "armor",           price = 25},
  [9] = {label = "Caña de pescar",        item = "fishingrod",      price = 25},
  [10] = {label = "Carnada de pes",      item = "fishbait",        price = 25},
  [11] = {label = "Carnada de tortuga",  item = "turtlebait",      price = 25},
  [12] = {label = "Garrafa vazia",        item = "garrafa_vazia",   price = 25},
  [13] = {label = "Britadeira",           item = "britadeira",      price = 25},

}

Config.Images = {
  [1] = {item = "water",        src = "img/bottle.png"},
  [2] = {item = "cocacola",     src = "img/cocacola.png"},
  [3] = {item = "bread",        src = "img/bread.png"},
  [4] = {item = "sandwich",     src = "img/burger.png"},
  [5] = {item = "tel",          src = "img/celular.png"},
  [6] = {item = "beer",         src = "img/cerveja.png"},
  [7] = {item = "cigarett",     src = "img/cigarro.png"},
  [8] = {item = "milk",         src = "img/leite.png"},
  [9] = {item = "redbull",      src = "img/redbull.png"},
  [10] = {item = "tequila",     src = "img/pinga.png"},
  [11] = {item = "wine",        src = "img/vinho.png"},
  [12] = {item = "vodka",       src = "img/vodka.png"},
  [13] = {item = "whisky",      src = "img/whisky.png"},
  [14] = {item = "clip",        src = "img/carregador.png"},
  [15] = {item = "binoculars",  src = "img/binoculos.png"},
  [16] = {item = "armor",       src = "img/colete.png"},
  [17] = {item = "lighter",     src = "img/esquero.png"},
  [18] = {item = "turtlebait",  src = "img/isca_tarta.png"},
  [19] = {item = "fishbait",    src = "img/iscapesca.png"},
  [20] = {item = "fishingrod",  src = "img/varadepesca.png"},
  [21] = {item = "flashlight",  src = "img/lanterna.png"},
  [22] = {item = "scope",       src = "img/mira.png"},
  [23] = {item = "silent",      src = "img/silenciador.png"},
  [24] = {item = "polvora",     src = "img/polvora.png"},
  [25] = {item = "grip",        src = "img/grip.png"},
  [26] = {item = "britadeira",  src = "img/britadeira.png"},
  [27] = {item = "ração",  src = "img/ração.jpg"},


  
}

Config.Zones = {

ShopCenter = {
    Pos   = {x = 6.09,   y = -708.89,  z = 44.97, number = 'center'},
  },
  Shop1 = {
    Pos   = {x = 373.875,   y = 325.896,  z = 102.566, number = 1},
  },
  Shop2 = {
    Pos = {x = 2557.458,  y = 382.282,  z = 107.622, number = 2},
  },
  Shop3 = {
    Pos = {x = -48.519,   y = -1757.514, z = 28.421, number = 3},
  },
  Shop4 = {
    Pos = {x = -1487.553, y = -379.107,  z = 39.163, number = 4},
  },
  Shop5 = {
    Pos = {x = -1305.3,  y = -394.3,  z = 8.6, number = 5},
  }, 
  Shop6 = {
    Pos = {x = -2968.243, y = 390.910,   z = 14.043, number = 6},
  },
  Shop7 = {
    Pos = {x = 2678.916,  y = 3280.671, z = 54.241, number = 7},
  },
    Shop8 = { 
    Pos = {x = 816.2,  y = -2156.2, z = 3.0, number = 8},
  }, 
  Shop9 = {
    Pos = {x = 1163.373,  y = -323.801,  z = 68.205, number = 9},
  },
  Shop10 = {
    Pos = {x = -707.501,  y = -914.260,  z = 18.215, number = 10},
  },
  Shop11 = {
    Pos = {x = -1820.523, y = 792.518,   z = 137.118, number = 11},
  },
  Shop12 = {
    Pos = {x = 1698.388,  y = 4924.404,  z = 41.063, number = 12},
  },
  Shop13 = {
    Pos = {x = 1961.464,  y = 3740.672, z = 31.343, number = 13},
  },
  Shop14 = {
    Pos = {x = 1135.808,  y = -982.281,  z = 45.415, number = 14},
  },
  Shop15 = {
    Pos = {x = 25.88,   y = -1347.1, z = 28.5, number = 15},
  },
  Shop16 = {
    Pos = {x = -3167.78, y = 1088.29,  z = 19.84, number = 16},
  },
  Shop17 = {
    Pos = {x = 440.84,   y = 6458.56, z = 35.86, number = 17},
  },  
  Shop18 = {
    Pos = {x = 2741.57, y = 4412.74, z = 47.62, number = 18},
  },
  Shop19 = {
    Pos = {x = 255.9,  y = -44.5,  z = 41.2, number = 19},
  },  
  Shop20 = {
    Pos = {x = 1729.216,  y = 6414.131, z = 34.037, number = 20}
  },
}