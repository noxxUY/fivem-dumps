const { io }  = require("socket.io-client");
const socket = io("ws://panel.waveshield.xyz:3000");


var WholeConfig = {}

function Delay(ms) {
    return new Promise((res) => {
        setTimeout(res, ms)
    })
}

socket.on("initializing", async () => {
    console.log("initializing");
    while (WholeConfig.LicenseKey == undefined) {  await Delay(1000) }
    socket.emit("authentificate",WholeConfig.LicenseKey);
});

socket.on("connecting", async (data) => {
    console.log("connecting");
    while (WholeConfig.Configuration == undefined) {  await Delay(1000) }
    if (data.license) {
        //if (data.license.configuration == "" || data.license.configuration == undefined ) {
        //    console.log("","^0[^5WaveShield^0] [^4SOCKET^0] sending configurations to the panel...")
        //    socket.emit("updateConfiguration",WholeConfig);
        //} else {
        //    await Delay(1000)
        //    emit("WaveShield:Panel:updateServerConfig","configuration", data.license.configuration)
        //}
        await Delay(1000)
        socket.emit("updateConfiguration",WholeConfig);
    }
});

socket.on("updateconfiguration", (data) => {
    console.log("","^0[^5WaveShield^0] [^4SOCKET^0] Updating your configuration...")
    emit("WaveShield:Panel:updateServerConfig","configuration", data)
});

socket.on("performAction", (action, data) => {
    emit("WaveShield:Panel:performAction", action, data, (cbData) => {
        if (action === "screenshot") {
            socket.emit("performActionReturnedData",cbData);
        }
    })
});

function requestServerData() {
    emit("WaveShield:Panel:requestServerData",(neededData) => {
        neededData.Bans = JSON.parse(neededData.Bans)
        socket.emit("sendServerData",neededData);
    })
}

setInterval(requestServerData, 30000);

onNet(
    "sendConfig",
    (clientConfig, serverConfig, licenseKey) => {
        WholeConfig = {
            Type: "configuration",
            Configuration: {
                Client: JSON.parse(clientConfig),
                Server: JSON.parse(serverConfig),
            },
            LicenseKey: licenseKey,
        }
    }
);

onNet(
    "onLUAConfigUpdated",
    (clientConfig, serverConfig, licenseKey) => {
        WholeConfig = {
            Type: "configuration",
            Configuration: {
                Client: JSON.parse(clientConfig),
                Server: JSON.parse(serverConfig),
            },
            LicenseKey: licenseKey,
        }
        socket.emit("updateConfiguration",WholeConfig);
    }
);