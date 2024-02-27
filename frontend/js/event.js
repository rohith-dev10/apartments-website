// import { Script } from "vm";
if(sessionStorage.getItem('id')){
    document.querySelector("#loga").href="profile.html";
    document.querySelector("#login").innerText="PROFILE";
}

const baseUrl = "http://localhost:3000/";
const events = [];
async function getInfo(e) {

    const res = await fetch(baseUrl+"event", {
        method: 'GET'
    })
    const data = await res.json();
    events.push(...data);

    const collection = document.querySelector('.collection');

    events.forEach((e) => {
        const box = document.createElement('div');
        const eachBox = document.createElement('div');
        const text = document.createElement('div');
        box.classList.add('box')
        text.classList.add('nameFest');
        eachBox.classList.add('eachBox');

        box.appendChild(eachBox)
        const cover = `../img/events/${e.EVENT_ID}.jpg`;
        eachBox.style.backgroundImage = "url('" + cover + "')"
        text.innerText = e.NAME;
        collection.appendChild(box);
        box.appendChild(eachBox)
        box.appendChild(text);
        let open = false;
        
        box.addEventListener('click', () => {
                // const childWindow = window.open("../html/eventdet.html", "childWindow");

                // const childWindow = window.open("../html/eventdet.html", "childWindow");
                // childWindow.postMessage(e, "*");
                // console.log(e)
                const childWindow = window.open("../html/eventdet.html", "childWindow");
                childWindow.addEventListener("load", () => {
                  childWindow.postMessage(e, "http://127.0.0.1:5500/SEM-4cs262/project_sms/frontend/html/eventdet.html");
                });
                



                // const childWindow = window.open("../html/eventdet.html", "childWindow");
                // console.log('Sending message:', e);
                // const ext={
                //     name:"hello",
                //     date:"56"
                // }
                // childWindow.postMessage(e, "http://127.0.0.1:5500/SEM-4cs262/project_sms/frontend/html/eventdet.html");

                // childWindow.addEventListener("load", () => {
                //     console.log("hii")
                //     childWindow.postMessage(e, "*");
                //     open = true;
                // });
    
            // }
    
        })
        
    })
}
getInfo();
