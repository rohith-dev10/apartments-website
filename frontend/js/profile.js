if(!sessionStorage.getItem('id')){
	window.location.assign("login.html");
}

const baseUrl = "http://localhost:3000/";
async function getInfo() {
	let regid=sessionStorage.getItem('id');
	const res = await fetch(baseUrl+"profile/"+regid, {
		method: "GET",
	})
	const data1 = await res.json();
	const data = data1.residents;

	const name = document.querySelector('#name');
	const apartmentNum = document.querySelector('#apartmentNum');
	const roomNum = document.querySelector('#roomNum');
	const date = document.querySelector('#date');

	name.innerHTML = data[0].NAME;
	apartmentNum.innerHTML = data[0].APARTMENT_ID;
	roomNum.innerHTML = data[0].ROOM_NO;
	const dateOfJoin = new Date(data[0].DOJ);
	date.innerHTML = dateOfJoin.toLocaleDateString('en-US', {
		year: 'numeric',
		month: 'long',
		day: 'numeric'
	});

	const EventColl = document.querySelector('.eventCond');

	const totalEvents = data1.events;
	totalEvents.forEach(element => {
		const eachEvent = document.createElement('div');
		const nameOfEvent = document.createElement('div');
		const dateOfEvent = document.createElement('div');
		const formatDate = new Date(element.START_DATE);

		nameOfEvent.innerHTML = element.NAME;
		dateOfEvent.innerHTML = formatDate.toLocaleDateString('en-US', {
			year: 'numeric',
			month: 'long',
			day: 'numeric'
		});

		nameOfEvent.classList.add('nameOfEvent');
		dateOfEvent.classList.add('dateOfEvent');
		eachEvent.classList.add('eachEvent');

		eachEvent.appendChild(nameOfEvent);
		eachEvent.appendChild(dateOfEvent);
		EventColl.appendChild(eachEvent);



	});




}
getInfo();