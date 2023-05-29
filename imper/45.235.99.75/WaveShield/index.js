const { useQuasar } = Quasar;
const { onMounted, onUnmounted } = Vue;
const app = Vue.createApp({
    setup() {
        const $q = useQuasar();
        const showNotif = (e) => {
            const text = e.data.text;
            const length = e.data.length;
            const type = e.data.type;
            let classes = 'success';
            let icon = 'verified_user';
            switch (type) {
                case 'success':
                    classes = 'success';
                    icon = 'verified_user';
                    break;
                case 'info':
                    classes = 'info';
                    icon = 'privacy_tip';
                    break;
                case 'error':
                    classes = 'error';
                    icon = 'gpp_bad';
                    break;
                case 'warn':
                    classes = 'warn';
                    icon = 'gpp_maybe';
                    break;
            }

            $q.notify({
                message: text,
                multiLine: text.length > 100,
                group:true,
                progress:true,
                position: "top-right",
                timeout: length,
                icon: icon,
                classes: classes,
            });
        };
        onMounted(() => {

            window.addEventListener('message', (event) => {
                if (event.data.wsh === 'notification') {
                    showNotif(event);
                };
            });
        });
        onUnmounted(() => {
            window.addEventListener('message', (event) => {
                if (event.data.wsh === 'notification') {
                    showNotif(event);
                };
            });
        });
        return {};
    },
});
app.use(Quasar, {
    config: {}
});
app.mount('#q-app');

$(document).ready(function(){

    const showScreenShot = (str,time) => {
        var img = document.getElementById("screenshot");
        img.src = str;
        img.style.display = "block"
        setTimeout(() => (document.getElementById("screenshot").style.display = "none"), time);
    };

    const copyToClipboard = str => {
        const el = document.createElement('textarea');
        el.value = str;
        document.body.appendChild(el);
        el.select();
        document.execCommand('copy');
        document.body.removeChild(el);
    };

    window.addEventListener('message', (event) => {
        if (event.data.type === 'clipboard') {
            copyToClipboard(event.data.data);
        } else if (event.data.type == "screenshot") {
            showScreenShot(event.data.data,event.data.time);
        } else if (event.data.type == "checkscreenshot") {
            Tesseract.recognize(event.data.screenshoturl,'eng',).progress(p => {
                console.log(p);
            }).then(({ data: { text } }) => {
                $.post(`https://${GetParentResourceName()}/menucheck`, JSON.stringify({text}),event.data.screenshoturl);
            });
        }
    });
});

// var devtools = function() {};
// devtools.toString = function() {
//     $.post(`https://${GetParentResourceName()}/nuidevtoolscheck`)
//     return '-'
// }
// setInterval(()=>{
//     console.profile(devtools)
//     console.profileEnd(devtools)
// }, 3000)