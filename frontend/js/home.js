if(sessionStorage.getItem('id')){
    document.querySelector("#loga").href="profile.html";
    document.querySelector("#login").innerText="PROFILE";
}

let img=0;
let apartments=3;
let ap_img_ar=['1.png','2.jpg','3.jpg'];

let arrows=document.querySelectorAll('.arrow');
let bgi=document.querySelector('#bgi');

arrows.forEach((arrow,i) => {
    arrow.addEventListener("click", ()=>{
        img=i?(img+1)%apartments:(img?img-1:apartments-1);
        bgi.style.backgroundImage=`url('../img/apartment/${ap_img_ar[img]}')`;
    })
});

document.getElementById("apbtn").addEventListener('click',()=>{
    sessionStorage.setItem('ap_no',img);
    window.location.assign('apartment.html');
});