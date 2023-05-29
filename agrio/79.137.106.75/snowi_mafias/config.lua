Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'es'
Config.EnableMoneyWash = true
Config.mafiaTables = {
  ---BALLAS
  weedshop = {
    label= "Weed Shop",
    limite = 150,
color ={r=205, g=0, b=255},
	  AuthorizedVehicles = {
     
	  },
    Armories = {
     
    
    },
    Vehicles = {
      
    },
	Helicopters = {
      
    },
    Helis = {
     
    },
    VehicleDeleters = {
   
    },
    Cloakrooms = {
    
    },
    BossActions = {
    
      
    },
  },
  BallasChowy = {
    limite = 300,
color ={r=205, g=0, b=255},
    label = 'Ballas',
	  AuthorizedVehicles = {
      { name = 'r6',  label = 'R6' },
      { name = 'gronos6x6',  label = '6x6 vlone' },
      { name = 'can',  label = 'CAN' },
      { name = 'rmodx6',  label = 'BMW X6' },
      { name = 'demonhawk',  label = 'Demon' },
      { name = 'razor',  label = 'Razor vlone' },
      { name = 'lbsihu',  label = 'lbsihu vlone' },
	  },
    Armories = {
      {x=93.547256469727, y=-1932.7252197266, z=16.575073242188, h=87.874015808105},
    
    },
    Vehicles = {
      {
        Spawner    = { x = 83.06, y = -1970.24, z = 20.23 },
        SpawnPoint =  { x = 89.08, y = -1967.46, z = 20.23},
        Heading    = 76.50,
      }
    },
	Helicopters = {
      {
        Spawner    = {x=81.13077545166, y=-2004.999511719, z=13.390844726563, h=59.52755355835},
        SpawnPoint = {x=51.591209411621, y=-2015.1308105469, z=1.813208007813, h=124.72441101074},
        Heading    = 124.0,
      }
    },
    Helis = {
      {name = 'supervolito', label = 'Supervolito'}
    },
    VehicleDeleters = {
      { x = 85.08, y = -1971.78, z = 20.54 },
    },
    Cloakrooms = {
      {x=109.234063720703, y=-1933.7681152344, z=16.608764648438, h=28.34645652771},
    },
    BossActions = {
      {x=85.134063720703, y=-1927.0681152344, z=16.608764648438, h=28.34645652771},
      
    },

  },
  ---Ragnar Carlos
  LosAngeles = {
    limite = 150,
color ={r=205, g=0, b=255},
    label = 'Hells Angels',
	  AuthorizedVehicles = {
      { name = 'r6',  label = 'R6' },
      { name = 'gronos6x6',  label = '6x6' },
      { name = 'killerhwak',  label = 'Killer' },
	  },
    Armories = {
      {x=-1881.4154052734, y=2064.2241210938, z=135.90551757813, h=85.039367675781},
    
    },
    Vehicles = {
      {
        Spawner    = {x=-1921.0681152344, y=2056.5627441406, z=140.72448730469, h=150.23622131348},
        SpawnPoint =   {x=-1909.6483154297, y=2037.2703857422, z=140.72448730469, h=201.25984191895},
        Heading    = 76.50,
      }
    },
	Helicopters = {
      {
        Spawner    =  {x=-1900.4571533203, y=2010.7252197266, z=141.41540527344, h=198.42520141602},
        SpawnPoint = {x=-1897.3978271484, y=2021.9736328125, z=140.77514648438, h=340.15747070313},
        Heading    = 340.0,
      }
    },
    Helis = {
      {name = 'supervolito', label = 'Supervolito'}
    },
    VehicleDeleters = {
      {x=-1920.4615478516, y=2043.8505859375, z=140.72448730469, h=65.196853637695},
    },
    Cloakrooms = {
      {x=-1886.9538574219, y=2071.2395019531, z=145.56042480469, h=249.44882202148},
    },
    BossActions = {
      {x=-1876.2197265625, y=2060.7956542969, z=145.56042480469, h=36.850395202637},
      
    },

  },
  ----FARIÑA
  LosCorona = {
    limite = 300,
color ={r=149, g=153, b=144},
    label = 'Fariña',
	  AuthorizedVehicles = {
      { name = 'demonhawk',  label = 'Demon' },
      { name = 'terzo',  label = 'Terzo' },
	  {name = 'PandeMraptor', label = 'Raptor '},
	  {name = 'r6', label = 'R6 '},
	  },
    Helis = {
      {name = 'supervolito', label = 'Supervolito'}
    },


    Armories = {
      { x = -93.43, y = 834.12, z = 235.78 },
    },
Helicopters = {
      {
        Spawner    = { x = -65.94, y = 884.707, z = 235.83 },
        SpawnPoint = { x = -69.38, y = 897.64, z = 235.53 },
        Heading    = 125.0,
      }
    },

    VehicleDeleters = {
      { x = -104.41, y = 824.68, z = 235.84 },
    },
    Cloakrooms = {
      {x = -82.57, y = 839.54, z = 235.71, h = 205.19},
    },
    BossActions = {
      { x = -86.34, y = 834.72, z = 235.98 },
    },
Vehicles = {
      {
        Spawner    = { x = -113.32, y = 835.14, z = 235.83 },
        SpawnPoint = { x = -106.46, y = 834.84, z = 235.83 },
        Heading    = 356.50,
      }
    },

  },
  ---THE MASACRE
  TheMasacre = {
    limite = 300,
color ={r=0, g=139, b=255},
    label = 'The Massacre',
    AuthorizedVehicles = {
      { name = 'p1gtr',  label = 'MC Laren' },
      { name = 'rmodx6',  label = 'BMW X6' },
      { name = 'demonhawk',  label = 'Demon ' },
	  },
    Armories = {
      { x = -1518.54, y = 111.82, z = 50.08 },
    },
    Helis = {
      {name = 'supervolito', label = 'Supervolito'}
    },
    Vehicles = {
      {
        Spawner    = { x = -1533.77, y = 81.64, z = 56.30 },
        SpawnPoint = { x = -1515.42, y = 84.04, z = 56.00 },
        Heading    = 280.50,
      }
    },
    Helicopters = {
      {
        Spawner    = { x = -1560.33, y = 100.807, z = 57.43 },
        SpawnPoint = { x = -1578.33, y = 88.807, z = 58.43 },
        Heading    = 143.0,
      }
    },

    VehicleDeleters = {
      { x = -1528.98, y = 80.58, z = 56.24 },
      --{ x = -2661.68, y = 1310.88, z = 146.5 },
    },
    Cloakrooms = {
      {x =-1515.51, y = 107.13, z = 52.24, h = 318.64},
    },
    BossActions = {
      { x = -1520.04, y = 122.32, z = 50.08 },
    },
  },
  
  --FAMILIES
  Families = {
    limite = 150,
color ={r=26, g=191, b=6},
    label = 'Los Cangris',
    AuthorizedVehicles = {
      { name = 'r6',  label = 'R6' },
	  { name = 'kamacho',  label = 'Kamacho' },
	  {name = 'bmx', label = 'BMX'},
	  
	  },
    Armories = {
      { x = -146.14, y = -1596.79, z = 34.88 },
    },

    Vehicles = {
      {
        Spawner    = { x = -129.77, y = -1617.64, z = 32.63 },
        SpawnPoint = { x = -143.22, y = -1640.24, z = 32.43 },
        Heading    = 141.50,
      }
    },
    Helicopters = {
      {
        Spawner    = { x = -162.15, y = -1657.6, z = 33.31 },
       SpawnPoint = { x = -271.13, y = -1658.44, z = 31.85 },
        Heading    = 280.0,
      }
    },

    VehicleDeleters = {
      { x = -143.18, y = -1646.48, z = 32.64 },
      --{ x = -2661.68, y = 1310.88, z = 146.5 },
    },
    Helis = {
      {name = 'supervolito', label = 'Supervolito'}
    },
    Cloakrooms = {
      {x = -99.35, y = -1635.15, z = 32.11, h = 147.9},
    },
    BossActions = {
      {x=-139.93846130371, y=-1598.9538574219, z=38.210205078125, h=158.74015808105}
    },
  },
  --CRIPS
  Crips = {
    limite = 300,
color ={r=255, g=128, b=0},
    label = 'Crips',
    AuthorizedVehicles = {
      { name = 'demonhawk',  label = 'Demon' },
	  },

    Armories = {
      { x = 1404.64, y = 1138.09, z = 109.48 },
    },

    Vehicles = {
      {
        Spawner    = { x = 1412.77, y = 1117.64, z = 114.83 },
        SpawnPoint = { x = 1403.42, y = 1117.84, z = 114.83 },
        Heading    = 88.50,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = 1443.33, y = 1101.807, z = 114.03 },
       SpawnPoint = { x = 1461.42, y = 1112.04, z = 116.03 },
        Heading    = 280.0,
      }
    },

    VehicleDeleters = {
      { x = 1407.98, y = 1116.58, z = 114.84 },
      --{ x = -2661.68, y = 1310.88, z = 146.5 },
    },

    BossActions = {
      { x = 1392.09, y = 1159.38, z = 114.03 }
    },
    Cloakrooms = {
      {x =1399.91, y = 1139.74, z = 114.33, h = 274.78},
    },
    Helis = {
      {name = 'supervolito', label = 'Supervolito'}
    },
  },
  --THE HIVE
  --[[TheUnion = {
    limite = 150,
color ={r=202, g=222, b=6},
    label = 'The Hive',
    AuthorizedVehicles = {
      { name = 'urus',  label = 'Urus' },
      { name = 'regera',  label = 'Regera' },
	  },

    Cloakrooms = {
      {x =-1399.91, y = 1139.74, z = 114.33, h = 274.78},
    },

    Armories = {
      { x = 1402.24, y = 1134.99, z = 114.48 },
    },

    Vehicles = {
      {
        Spawner    = { x = 1412.77, y = 1117.64, z = 114.83 },
        SpawnPoint = { x = 1403.42, y = 1117.84, z = 114.83 },
        Heading    = 88.50,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = 1443.33, y = 1101.807, z = 114.03 },
       SpawnPoint = { x = 1461.42, y = 1112.04, z = 116.03 },
        Heading    = 280.0,
      }
    },
    Helis = {
      {name = 'supervolito', label = 'Supervolito'}
    },
    VehicleDeleters = {
      { x = 1407.98, y = 1116.58, z = 114.84 },
      --{ x = -2661.68, y = 1310.88, z = 146.5 },
    },

    BossActions = {
      { x = 1403.89, y = 1150.28, z = 114.03 }
    },
  },--]]
   --LatinKingZ
  TheUnion = {
    limite = 300,
color ={r=202, g=222, b=6},
    label = 'LatinKingZ',
    AuthorizedVehicles = {
     -- { name = 'urus',  label = 'Urus' },
     -- { name = 'regera',  label = 'Regera' },
	  },

    Cloakrooms = {
      {x=-1796.3736572266, y=412.18023681641, z=116.83154296875, h=351.49606323242}
    },

    Armories = {
      {x=-1795.0153808594, y=421.06814575195, z=113.44470214844, h=175.74803161621}
    },

    Vehicles = {
      {
        Spawner    = { x = -1788.99, y = 462.34, z = 128.53 },
        SpawnPoint = { x = -1804.82, y = 456.84, z = 128.83 },
        Heading    = 88.50,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = -1791.03, y = 410.507, z = 113.03 },
       SpawnPoint = { x = -1801.52, y = 394.64, z = 112.73 },
        Heading    = 95.0,
      }
    },
    Helis = {
      {name = 'supervolito', label = 'Supervolito'}
    },
    VehicleDeleters = {
      { x = -1786.98, y = 455.58, z = 128.34 },
      --{ x = -2661.68, y = 1310.88, z = 146.5 },
    },

    BossActions = {
      { x = -1794.52, y = 450.07, z = 128.51 }
    },
  },
  --REAL SHOTERS
  GlockGang = {
    limite = 300,
color ={r=255, g=45, b=0},
    label = 'Real Shooters',
    AuthorizedVehicles = {
      { name = 'rmodp1gtr',  label = 'MC Laren' },
      { name = 'bf400',  label = 'BF 400' },
      { name = 'demonhawk',  label = 'Demon' },
	  },
    Armories = {
      { x=-1109.46, y=4945.65, z=210.96 },
      },
    
      Vehicles = {
      {
        Spawner    = { x = -1124.12, y = 4940.81, z = 219.24 },
        SpawnPoint = { x=-1103.61, y=4951.65, z=218.04 },
        Heading    = 248.78,
      }
      },
    
      Helicopters = {
      {
        Spawner    = { x = -1177.34, y = 4926.09, z = 223.37 },
        SpawnPoint = { x=-1137.27, y=4976.49, z=222.27 },
        Heading    = 204.73,
      }
      },
      Cloakrooms = {
        {x =-1149.89, y = 4940.18, z = 222.27, h = 70.89}
      },
      VehicleDeleters = {
      { x = -1123.51, y = 4925.69, z = 218.49 },
      --{ x = -2661.68, y = 1310.88, z = 146.5 },
      },
      Helis = {
        {name = 'supervolito', label = 'Supervolito'},
        {name = 'cargobob2', label = 'Cargobob2'}
      },
      BossActions = {
      { x = -1123.68, y = 4893.77, z = 218.47 },
      },
  },
   --Criminals
   TheCriminals = {
    limite = 300,
color ={r=255, g=45, b=0},
    label = 'The Criminals',
    AuthorizedVehicles = {
      { name = 'demonhawk',  label = 'Jeep' },
      { name = 'tmax',  label = 'TMax' },
      { name = 'ursa',  label = 'Ursa' },
      },
    Armories = {
      { x=328.1407, y=-2000.822, z=24.19116 },
      },

      Vehicles = {
      {
        Spawner    = { x = 332.3, y = -2043.68, z = 20.84 },
        SpawnPoint = { x=317.51, y=-2031.36, z=20.54 },
        Heading    = 248.78,
      }
      },

      Helicopters = {
      {
        Spawner    = { x = 450.9758, y = -1977.587, z = 23.18018 },
        SpawnPoint = { x = 452.4396, y = -1969.042, z = 22.92749 },
        Heading    = 204.73,
      }
      },
      Cloakrooms = {
        { x = 322.9187, y = -1996.312, z = 24.19116 },
      },
      VehicleDeleters = {
        {x=328.53625488281, y=-2028.2901611328, z=21.0908203125, h=36.850395202637},
      --{ x = -2661.68, y = 1310.88, z = 146.5 },
      },
      Helis = {
        {name = 'supervolito', label = 'Supervolito'},
      },
      BossActions = {
        { x = 338.3209, y = -1979.855, z = 24.19116 },
      },
  },
  --BLACKWATER
  TheDarks = {
    limite = 300,
color ={r=255, g=45, b=0},
    label = 'The wolves gang',
    AuthorizedVehicles = {
      { name = 'chiron17',  label = 'Chiron17' },
      { name = 'xls2',  label = 'XLS2' },
      { name = 'demonhawk',  label = 'Demon' },
	  },
    Armories = {
      { x=5010.56, y=-5758.05, z=28.86 },
      },
    
      Vehicles = {
      {
        Spawner    = { x = 4994.52, y = -5712.21, z = 19.84 },
        SpawnPoint = { x=4975.61, y=-5704.55, z=19.84 },
        Heading    = 36.48,
      },
      {
        Spawner    = {x=1233.2703857422, y=-3328.7209472656, z=5.5552978515625, h=184.25196838379},
        SpawnPoint = {x=1233.6658935547, y=-3341.4592285156, z=5.791259765625, h=274.96063232422},
        Heading    = 274.48,
      }
      },
    
      Helicopters = {
      {
        Spawner    = { x = 4904.04, y = -5741.19, z = 26.37 },
        SpawnPoint = { x=4890.27, y=-5737.29, z=26.37 },
        Heading    = 337.43,
      }
      },
      Cloakrooms = {
        {x=5014.1274414063, y=-5752.6020507813, z=28.841796875, h=147.40158081055}
      },
      VehicleDeleters = {
      { x = 4968.11, y = -5695.69, z = 19.9 },
      --{ x = -2661.68, y = 1310.88, z = 146.5 },
      },
      Helis = {
        {name = 'supervolito', label = 'Supervolito'},
        {name = 'cargobob2', label = 'Cargobob2'}
      },
      BossActions = {
      { x = 5012.68, y = -5748.67, z = 28.97 },
      },
  },

  wjob = {
    label= "wjob",
    limite = 150,
color ={r=205, g=0, b=255},
	  AuthorizedVehicles = {
     
	  },
    Armories = {
     
    
    },
    Vehicles = {
      
    },
	Helicopters = {
      
    },
    Helis = {
     
    },
    VehicleDeleters = {
   
    },
    Cloakrooms = {
    
    },
    BossActions = {
    
      
    },
  },

}