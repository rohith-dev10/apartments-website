if(sessionStorage.getItem('id')){
    document.querySelector("#loga").href="profile.html";
    document.querySelector("#login").innerText="PROFILE";
}
if(!sessionStorage.getItem('ap_no')) window.location.assign("home.html");

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


async function get_ap_det(){
    let id=sessionStorage.getItem('ap_no');
    const res=await fetch(`http://localhost:3000/getApDet/${id}`,{
        method:"GET",
    });
    const response=await res.json();
    let r={};
    r['apartment_name']=response['apt']["NAME"];
    r['owner_name']=response['apt']["OWNER_NAME"];
    r['owner_contact']=response['apt']["OWNER_CONTACT"];
    r['avail_2']=response['rooms'][0]["AVAILABLE_ROOMS"];
    r['avail_3']=response['rooms'][1]["AVAILABLE_ROOMS"];
    r['avail_4']=response['rooms'][2]["AVAILABLE_ROOMS"];
    for(result in r){
        document.querySelector(`#${result}`).innerHTML=r[result];
    }
}
get_ap_det();