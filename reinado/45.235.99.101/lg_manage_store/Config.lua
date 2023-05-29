-- This script was created by the Legendary Team.
-- You can find other scripts at: https://legendary-team.tebex.io/category/1735193

config = {}

-- Define here which framework you use on your server
-- ESX
-- QBCore
-- Standalone
config.framework = "ESX"

-- This is the command for the admin menu
config.command_admin = "manage"
-- Set the key that will open the Store
-- You can open a store through the client event: "lg_manage_store:OpenStoreClient"
config.key_open = 'E'
-- This is the distance the player must be from the marker to open a Store
config.radius_coord = 2.0

-- if you have images in another script or in an external link, define the URL here
-- default: "img/"
-- example: https://cfx-nui-inventory/web/dist/assets/items/
config.url_images = "https://cfx-nui-inventory/web/dist/assets/items/"

-- Disable this variable if you not use system weight on your server
config.use_weight_system = true
-- If your server use weight system, define here the max weight of your server
config.max_weight = 120000

-- If false, owners will not be able to carry out quests in their own stores.
config.own_missions = true
-- Activate this variable if you want the owner to be able to create only one mission per product
config.one_mission_product = false
-- Activate this variable if you want the player to only be able to buy a single store
config.buy_only_one = true

-- Enter the amount of products for when the store has no owner. 
-- This value remains unchanged after purchasing a product. 
-- Put zero if you want to disable.
config.amount_no_owner = 500

-- Here are the definitions of the basic stores that will be generated in-game.
-- You can change in-game names and values after stores are created
-- Only coordinates with vector3 are accepted, put the x,y,z values inside it.
basic_stores = {
    -- store name
    name = "SUPERCHINO",

    -- coordinate of marker
    coordinates = {
        vector3( 26.48082, -1347.098, 29.49702),
        vector3( 374.186, 326.0856, 103.5664),
        vector3( 2557.324, 382.5602, 108.623),
        vector3( -3038.939, 585.954, 7.908),
        vector3( -3241.927, 1001.462, 12.830),
        vector3( 547.2924, 2671.106, 42.15649),
        vector3( 1961.464, 3740.672, 32.343),
        vector3( 2679.086, 3280.735, 55.24113),
        vector3( 1729.216, 6414.131, 35.037),
        vector3( 1135.808, -982.281, 46.415),
        vector3( -1222.915, -906.983, 12.326),
        vector3( -1487.553, -379.107, 40.163),
        vector3( -2968.243, 390.910, 15.043),
        vector3( 1166.024, 2708.930, 38.157),
        vector3( 1392.562, 3604.684, 34.980),
        vector3( -1391.477, -604.8229, 30.31955),
        vector3( -1037.618, -2737.399, 20.169),
        vector3( -48.519, -1757.514, 29.421),
        vector3( 1163.373, -323.801, 69.205),
        vector3( -707.501, -914.260, 19.215),
        vector3( -1820.523, 792.518, 138.118),
        vector3( 1698.388, 4924.404, 42.063),
    },

    -- marker size
    marker_scale = 0.8,
    -- amount that the player must pay to buy this store
    price_buy = 300000000,
    -- value the player will earn when selling this store
    price_sell = 100000000,
}

-- Here you can translate all messages and graphical interface.
-- Remember to save your settings whenever you update the Script.
translate = {
    TR_NEWTYPE = "Nuevo Tipo",
    TR_ENTER_NAME_TYPE = "Ingrese el nombre del tipo de Tienda",
    TR_WHAT_TEMPLATE_TYPE = "CUÁL SERÁ LA PLANTILLA DE LA TIENDA?",
    TR_WHAT_TYPE_COLORS = "COLORES",
    TR_TITLE_COLOR = "Color Titulo",
    TR_TEXT_COLOR = "Color Titulo",
    TR_SUBTEXT_COLOR = "Este es el titulo de la parte superior",
    TR_TITLE_COLOR2 = "Color Principal",
    TR_TEXT_COLOR2 = "Color Principal",
    TR_SUBTEXT_COLOR2 = "Este es el color de los botones y el menú de navegación",
    TR_TITLE_COLOR3 = "Color Texto",
    TR_TEXT_COLOR3 = "Cambia Color",
    TR_SUBTEXT_COLOR3 = "este es el color de los textos de los botones y menú de navegación",
    TR_TITLE_COLOR4 = "fondo de productos",
    TR_TEXT_COLOR4 = "Cambiar Color",
    TR_SUBTEXT_COLOR4 = "this is the background color of each product",
    TR_TITLE_COLOR5 = "product text",
    TR_TEXT_COLOR5 = "Change the Text Color of Products",
    TR_SUBTEXT_COLOR5 = "this is the color of the text on each product",
    TR_TITLE_COLOR6 = "border of products",
    TR_TEXT_COLOR6 = "Change Product Border Color",
    TR_SUBTEXT_COLOR6 = "this is the border color of each product",
    TR_TITLE_COLOR7 = "Navigation Border",
    TR_TEXT_COLOR7 = "Change Navigation Border Color",
    TR_SUBTEXT_COLOR7 = "this is the Navigation Menu Border Color",
    TR_TITLE_COLOR8 = "Nav Selected Border",
    TR_TEXT_COLOR8 = "Change Selected Navigation Border",
    TR_SUBTEXT_COLOR8 = "this is the selected navigation menu border color",
    TR_TITLE_COLOR9 = "Nav Selected Shadow",
    TR_TEXT_COLOR9 = "Change Selected Navigation Shadow",
    TR_SUBTEXT_COLOR9 = "this is the selected navigation menu border shadow",
    TR_ALL_ITEMS = "TODOS LOS ARTÍCULOS DEL SERVIDOR",
    TR_SEARCH_PRODUCT = "BUSCAR PRODUCTO",
    TR_PRODUCTS_TYPE = "LOS PRODUCTOS DE ESTE TIPO TENDRAN",
    TR_ITEM_MISSION = "ARTÍCULOS DE LA MISIÓN",
    TR_COPY_STORE = "COPIAR PRODUCTOS DE OTRA TIENDA",
    TR_TYPE_SUPPLY_TEXT = "AHORA HAY QUE DEFINIR CÓMO FUNCIONARÁ EL SUMINISTRO DE ESTE TIPO DE TIENDA. PARA ESTO DEFINE QUE ARTÍCULOS DEBE TENER EL JUGADOR PARA SUMINISTRAR UN PRODUCTO ÚNICO DE LA TIENDA.",
    TR_TYPE_SUPPLY_TEXT2 = "PARA CADA PRODUCTO DE LA TIENDA, DEFINE UNO O VARIOS ARTÍCULOS DE LA MISIÓN. EL JUGADOR DEBE ENTREGAR ESTE ARTÍCULO A LA TIENDA PARA COMPLETAR LA MISIÓN, ESTE ARTÍCULO DEBE ESTAR EN SU INVENTARIO.",
    TR_COPY_MISSION = "COPIAR MISIONES DE OTRA TIENDA",
    TR_MISSION_TEXT = "PARA CADA PRODUCTO EN LA TIENDA, DEFINE CUANTO LE COSTARÁ POR UNIDAD AL DUEÑO DE LA TIENDA SOLICITAR UNA NUEVA MISIÓN. EL NÚMERO MÁXIMO DE UNIDADES POR MISIÓN. Y LA CANTIDAD QUE RECIBIRÁ EL JUGADOR NORMAL POR UNIDAD EN LA MISIÓN",
    TR_MISSION_TEXT2 = "Precio Solicitado: Importe que se cobrará al propietario de la tienda por unidad solicitada",
    TR_MISSION_TEXT3 = "Solicitud máxima: la cantidad máxima de unidades que el propietario de la tienda puede solicitar en una sola misión",
    TR_MISSION_TEXT4 = "Recompensa de misión: cantidad que ganará el jugador normal al completar la misión",
    TR_MISSION_REQUEST = "SOLICITUD DE MISIÓN",
    TR_REQUEST_PRICE = "Precio Solicitado:",
    TR_MAX_REQUEST = "Solicitud máxima:",
    TR_QUEST_REWARD = "recompensa de misión:",
    TR_UNITY = "unidades",
    TR_PRODUCT_TEXT = "PARA CADA PRODUCTO EN LA TIENDA, DEFINE LA CANTIDAD INICIAL, SU PRECIO INICIAL Y EL PRECIO MÁXIMO QUE EL PROPIETARIO PUEDE PONER AL PRODUCTO",
    TR_PRODUCT_TEXT2 = "Cantidad: Importe inicial que tendrá este producto en la tienda una vez creado",
    TR_PRODUCT_TEXT3 = "Precio: El valor inicial que tendrá este producto en la tienda una vez creado",
    TR_PRODUCT_TEXT4 = "Precio máximo: monto máximo que el propietario puede cobrar por este producto",
    TR_AMOUNT = "Cantidad:",
    TR_PRICE = "Precio:",
    TR_MAX_PRICE = "Precio Maximo:",
    TR_CAN_MONEYBOX_STOLEN = "ESTE TIPO DE TIENDA PUEDE TENER LA CAJA DE DINERO ROBADA?",
    TR_CAN_COFFRE_STOLEN = "ESTE TIPO DE TIENDA PUEDE TENER LA CAJA FUERTE ROBADA?",
    TR_CAN_WORKERS_STOLEN = "Puede este tipo de tienda robar a las trabajadores?",
    TR_CAN_HAVE_WORKERS = "ESTE TIPO DE TIENDA PUEDE TENER TRABAJADORES?",
    TR_CAN_BLACKMONEY = "SE UTILIZARÁ ESTA TIENDA CON DINERO NEGRO?",
    TR_CAN_JOB = "ES ESTE TIPO DE TIENDA PARA UN TRABAJO EN ESPECIFICO?",
    TR_CAN_JOB_PLACEHOLDER = "INGRESE EL NOMBRE DEL TRABAJO AQUÍ",
    TR_CAN_ALL_JOBS = "ABIERTO A TODOS LOS EMPLEOS",
    TR_YES = "SI",
    TR_NO = "NO",
    TR_WHAT_BLIP = "WHAT IS THE BLIP OF THIS TYPE OF STORE?",
    TR_NOT_BLIP = "DO NOT USE BLIP",
    TR_WHAT_COLOR_BLIP = "WHAT IS THE COLOR OF THE STORE BLIP?",
    TR_WHAT_BLIP_SCALE = "WHAT IS THE SIZE OF THE STORE BLIP? (SCALE)",
    TR_BLIP_SCALE_PLACEHOLDER = "ENTER THE BLIP SCALE HERE: 0.5",
    TR_WHAT_MARKER = "WHAT IS THE STORE MARKER?",
    TR_WHAT_MARKERCOLOR = "WHAT COLOR IS THE MARKER?",
    TR_MARKERCOLOR = "COLOR OF MARKER",
    TR_NOT_MARKER = "DO NOT USE MARKER",
    TR_SKIP = "SKIP",
    TR_NEWSTORE = "NUEVA TIENDA",
    TR_NAMESTORE = "INGRESA NOMBRE",
    TR_TYPE_HERE = "escribe...",
    TR_WHAT_TYPE = "QUE TIPO DE TIENDA SERÁ",
    TR_COORDS_TEXT = "AHORA TENDRÁS QUE DEFINIR EN QUÉ COORDENADAS ABRE LA TIENDA. PARA ESO PUEDES INGRESAR LAS COORDENADAS O OCULTAR EL NUI E IR A LA POSICIÓN EXACTA Y PRESIONAR F5 PARA OBTENER LA COORDENADA.",
    TR_COORDS = "Elija coordenadas",
    TR_HIDE_NUI = "OCULTAR NUI Y ELEGIR MANUALMENTE",
    TR_MONEYBOX_TEXT = "ESTA TIENDA TIENE POSIBILIDAD DE SER ROBADA. DEFINE QUÉ OBJETO REPRESENTA LA CAJA DE DINERO APUNTANDO Y PRESIONANDO F5 SOBRE EL OBJETO",
    TR_MONEYBOX = "DEFINE LA CAJA DE DINERO",
    TR_SAFE_TEXT = "ESTA TIENDA TIENE POSIBILIDAD DE SER ROBADA. DEFINE QUÉ OBJETO REPRESENTA LA CAJA FUERTE APUNTANDO Y PRESIONANDO F5 SOBRE EL OBJETO",
    TR_SAFE = "DEFINE LA CAJA FUERTE",
    TR_COST_STORE = "Cuánto costará esta tienda?",
    TR_GET_SELL = "Cuando el dueño decide vender esta tienda, ¿cuánto obtendrá por venderla??",
    TR_USE_SCROLL = "Use el desplazamiento del mouse para subir o bajar",
    TR_USE_ARROW = "Use la flecha izquierda y derecha para cambiar la escala",
    TR_CONFIRM_SELECTION = "Presione F5 para confirmar la selección",
    TR_USE_AIM = "Apunta a un objeto para seleccionarlo",
    TR_USE_WEAPON = "Usa un arma para que sea más fácil apuntar.",
    TR_SIMBOL_MONEY = "$",
    TR_SIMBOL_WEIGHT = "kg",
    TR_PER_UNITY = "por unidad",
    TR_ADD_CART = "Agregar",
    TR_SOLD_OFF = "No Disponible",
    TR_PRODUCTS = "PRODUCTOS",
    TR_CART = "CARRITO",
    TR_MISSIONS = "MISIONES",
    TR_MANAGE = "GESTIONAR",
    TR_BUY = "COMPRAR",
    TR_BUY_TEXT = "Podrás gestionar todos los productos y el dinero de esta tienda",
    TR_BUY_CONFIRM = "Estás segura de que quieres comprar en esta tienda?",
    TR_BALANCE = "BALANCE",
    TR_TYPE_VALUE = "Escriba Valor",
    TR_DEPOSIT = "Depositar",
    TR_WITHDRAW = "Retirar",
    TR_MONEY_AVAILABLE = "Dinero Disponible",
    TR_BACK = "Volver",
    TR_STOCK = "STOCK",
    TR_STOCK_STORE = "STOCK DE TIENDA",
    TR_PUT_SALE = "Poner a la venta",
    TR_CREATE_MISSION = "Crear Misión",
    TR_PRODUCTS_STORE = "PPRODUCTOS EN TIENDA",
    TR_REMOVE = "Eliminar",
    TR_CHANGE_PRICE = "Cambiar Precio",
    TR_CHANGE_NAME = "Cambiar Nombre",
    TR_CHANGE_COLORS = "Cambiar Colores",
    TR_WORKERS = "EMPLEADOS",
    TR_OPTION_TEXT = "Agregar o Retirar dinero",
    TR_OPTION_TEXT2 = "Administrar productos",
    TR_OPTION_TEXT3 = "Administrar empleados",
    TR_OPTION_TEXT4 = "Cambiar el nombre de su tienda",
    TR_OPTION_TEXT5 = "Cambia el estilo de tu tienda",
    TR_OPTION_TEXT6 = "Vende tu Tienda",
    TR_OPTION_SUBTEXT = "este es el dinero que tiene tu tienda",
    TR_OPTION_SUBTEXT2 = "productos en stock o en venta y misiones",
    TR_OPTION_SUBTEXT3 = "contratar o despedir NPC",
    TR_OPTION_SUBTEXT4 = "este es el nombre principal que aparece en la parte superior de la tienda",
    TR_OPTION_SUBTEXT5 = "colores de botones y bordes",
    TR_OPTION_SUBTEXT6 = "you will lose access to your store",
    TR_NAME_STORE = "Nombre Tienda",
    TR_NAME_TEXT = "Elija un nuevo nombre",
    TR_SELL = "Vender",
    TR_SELL_TEXT = "esta es la cantidad que ganarás vendiendo la tienda",
    TR_SELL_CONFIRM = "¿Estás seguro de que quieres vender tu tienda? Después de eso, ya no podrás administrarla..",
    TR_SELECT = "Seleccionar",
    TR_REMOVE_AMOUNT = "cuanto quieres retirar?",
    TR_WAIT = "Espera un momento...",
    TR_NOT_AMOUNT = "no tiene esa cantidad.",
    TR_NEW_PRICE = "Cual es el precio del nuevo producto?",
    TR_PUT_SALE_AMOUNT = "Cuantos quieres poner a la venta?",
    TR_REQUEST_MISSION_AMOUNT = "Cuantos quieres pedir?",
    TR_REQUIRED_ITEM = "Elemento requerido",
    TR_CURRENT = "Actual",
    TR_WIN_UNITY = "Ganas por unidad",
    TR_WIN_TOTAL = "Ganarás en total",
    TR_AMOUNT_AVAILABLE = "La cantidad máxima disponible",
    TR_DELIVER_MISSION = "Entregar misión",
    TR_WALLET = "EFECTIVO",
    TR_BANK = "BANCO",
    TR_BLACKMONEY = "Dinero Negro",
    TR_TOTAL = "TOTAL",
    TR_EDITTYPE = "Editar Tipo",
    TR_EDITTYPE_TEXT = "ATENCIÓN! CUANDO EDITES, TODAS LAS TIENDAS QUE TENGAN ESTE TIPO SE CAMBIARÁN AUTOMÁTICAMENTE! ESTO NO SE PUEDE REVERTIR. LOS PRODUCTOS QUE SE RETIREN SERÁ RETIRO DE TODAS LAS TIENDAS PERTENECIENTES A ESE TIPO. LOS COLORES Y PRECIOS DE CADA TIENDA NO SERÁN MODIFICADOS.",
    TR_SELECT_TYPE = "SELECCIONE EL TIPO",
    TR_SELECT_WANT = "SELECCIONA LO QUE QUIERAS",
    TR_CREATE_STORE = "Crear Tienda",
    TR_CREATE_STORE2 = "CREAR UNA NUEVA TIENDA",
    TR_CREATE_TYPE = "CREAR UN NUEVO TIPO",
    TR_CREATE_EDIT = "EDITAR UN TIPO DE TIENDA",
    TR_LIST_STORES = "LISTA DE TIENDAS",
    TR_SELECT_WICH_TYPE = "SELECCIONA TIPO",
    TR_SELECT_WICH_STORE = "SELECCIONA TIENDA",
    TR_MONEY = "DINERO",
    TR_PRICE_BUY = "PRECIO COMPRA",
    TR_PRICE_SELL = "PRECIO VENTA",
    TR_TELEPORT_TO = "IR",
    TR_MANAGE_STORE = "GESTIONAR TIENDA",
    TR_CHANGE_PRICE_BUY = "CAMBIAR PRECIO COMPRA",
    TR_CHANGE_PRICE_SELL = "CAMBIAR PRECIO VENTA",
    TR_DELETE = "ELIMINAR TIENDA",
    TR_CONFIRM_DELETE = "CONFIRMAR ELIMINACIÓN",
    TR_REMOVE_OWNER = "ELIMINAR PROPIETARIO",
    TR_CONFIRM_REMOVE = "CONFIRMAR ELIMINAR",
    TR_ADMIN_TEXT = "Bienvenido a Administrar tiendas. Aquí puede agregar, eliminar o editar cualquier tienda. Tenga cuidado ya que cualquier cambio podría afectar a la tienda de forma permanente.",
    TR_SEE_STORES = "Ver Tiendas",
    TR_BASIC_STORE = "Tiendas Básicas",
    TR_GENERATE = "Generar",
    TR_CONFIRM = "CONFIRMAR",
    TR_CANCEL = "CANCELAR",
    TR_SAVE = "GUARDAR",
    TR_NOT_MONEY = "No tienes suficiente dinero",
    TR_STORE_NOT_MONEY = "Tu tienda no tiene suficiente dinero",
    TR_STORE_NOT_AMOUNT = "La tienda no tiene esta cantidad.",
    TR_INVENTORY_FULL = "Tu inventario está demasiado lleno..",
    TR_INVALID_MISSION = "Misión inválida",
    TR_NOT_AMOUNT2 = "No tienes la cantidad requerida.",
    TR_BASIC_FAIL = "Cancelado Las tiendas básicas ya se han creado antes.",
    TR_HIGH_PRICE = "Este precio es superior al permitido para este producto",
    TR_NOT_ALLOWED = "No puedes abrir esa tienda.",
    TR_HAS_OWNER = "Esta tienda ya tiene dueño.",
    TR_NOT_MISSION_OWNER = "No puedes enviar misiones a tu tienda",
    TR_ONE_MISSION = "Ya existe una misión para este producto",
    TR_ALREADY_OWN = "Ya tienes una tienda",
}