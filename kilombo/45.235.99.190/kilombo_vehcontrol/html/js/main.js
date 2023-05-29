'use strict';


var menuItems = [
    {
        id   : 'trunk',
        title: 'Baúl',
        icon: '#trunk'
    },
    {
        id   : 'seat',
        title: 'Asientos',
        icon: '#more',
        items: [
            {
                id: 'seat -1',
                title: 'Conductor',
                icon: '#seat'
            },
            {
                id: 'seat 0',
                title: 'Acompañante',
                icon: '#seat'
            },
            {
                id: 'seat 1',
                title: 'Atras 1',
                icon: '#seat'
            },
            {
                id: 'seat 2',
                title: 'Atras 2',
                icon: '#seat'
            },
            {
                id: 'seat 3',
                title: 'Atras 3',
                icon: '#seat'
            },
            {
                id: 'seat 4',
                title: 'Atras 4',
                icon: '#seat'
            }
        ]
    },
    {
        id   : 'engine',
        title: 'Motor',
        icon: '#drive'
    },
    {
        id   : 'hood',
        title: 'Capó',
        icon: '#hood'
    },
    {
        id   : 'window',
        title: 'Ventanas',
        icon: '#more',
        items: [
            {
                id: 'rlwindow',
                title: 'Atras IZQ',
                icon: '#windowLeft'
            },
            {
                id: 'flwindow',
                title: 'Conductor',
                icon: '#windowLeft'
            },
            {
                id: 'frwindow',
                title: 'Pasajero',
                icon: '#windowRight'
            },
            {
                id: 'rrwindow',
                title: 'Atras DER',
                icon: '#windowRight'
            }
        ]
    },
    {
        id: 'door',
        title: 'Puertas',
        icon: '#more',
        items: [
            {
                id: 'rldoor',
                title: 'Atras IZQ',
                icon: '#doorLeft'
            },
            {
                id: 'fldoor',
                title: 'Conductor',
                icon: '#doorLeft'
            },
            {
                id: 'frdoor',
                title: 'Pasajero',
                icon: '#doorRight'
            },
            {
                id: 'rrdoor',
                title: 'Atras DER',
                icon: '#doorRight'
            }
        ]
    }
];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
window.onload = function () {
    var svgMenu = new RadialMenu({
        parent      : document.body,
        size        : 400,
        closeOnClick: false,
        menuItems   : menuItems,
        onClick     : function (item) {
            //console.log('You have clicked:', item.id, item.title);
            NUIcommand(item.id);
        }
    });


    window.addEventListener('message', (event) => {
        if (event.data.type === 'open') {
            svgMenu.open();
        }
    });

};

window.addEventListener('keypress', (e) => {
    console.log(e.keyCode);
    if(e.key === '/'){
        console.log("Escape key pressed");
        e.preventDefault();
        NUIclose();
    }
});


function NUIclose() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            itemId: 'close'
        })
    }).then(resp => resp.json());
}

function NUIcommand(commandString) {
    fetch(`https://${GetParentResourceName()}/command`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            itemId: commandString
        })
    }).then(resp => resp.json());
}