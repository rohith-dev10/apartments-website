if(sessionStorage.getItem('id')){
    document.querySelector("#loga").href="profile.html";
    document.querySelector("#login").innerText="PROFILE";
}

let select=0;
let ame_img_ar=['workfh.jpg','pool.jpg','gym.jpg','rooftop.jpg'];
let circles=document.querySelectorAll('.circ');
let carimg=document.querySelector('#carimg');

circles.forEach((circle,i) => {
    circle.addEventListener("click", ()=>{
        circles[select].style.backgroundColor='transparent';
        select=i;
        circle.style.backgroundColor='white';
        carimg.src=`../img/amenities/${ame_img_ar[select]}`;
    });
});