const form = document.querySelector('#logfrm');
form.addEventListener('submit', async (event) => {
    event.preventDefault();
    let id = document.getElementById('regid').value;
    let pass = document.getElementById('respass').value;
    document.getElementById('respass').value = "******************************************************************";
    console.log(id, pass);

    const res = await fetch("http://localhost:3000/res_login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            id:`${id}`,
            pass:pass
        }),
    });
    const result=await res.json();

    if(result['status']){
        sessionStorage.setItem("id", result['id']);
        window.location.assign("profile.html");
    }
    else{
        document.getElementById('err').innerText=result['error'];
    }
});