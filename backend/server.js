const express = require('express');
const cors = require('cors');
var mysql = require('mysql');


const app = express();
app.use(cors());


app.use(express.json());

const bodyParser = require('body-parser'); //
app.use(bodyParser.urlencoded({limit: '5000mb', extended: true, parameterLimit: 100000000000})); //

app.use(express.static("./src/css"));//
app.set('views', './src/views'); //
app.set("view engine","ejs"); //

var database='sms_final';

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'user',
	password: 'MySQL@123',
	database: database
});

connection.connect(function (err) {
	if (err) {
		console.error(err);
		return;
	}
	console.log('connected as id ' + connection.threadId);

	

	app.post("/res_login",(req,res)=>{
		let {id,pass}=req.body;
		connection.query(`SELECT PASSWORD FROM RESIDENTS WHERE REGISTRATION_ID= ? ;`,[id], (error, regid, fields) => {
			if(error){
				console.log(error);
				res.status(404).send("<h1>Error</h1>");
			}
			if(regid.length!=0){
				if(regid[0]['PASSWORD']==pass) res.json({status:true,id:id});
				else res.json({status:false,error:"*Incorrect Password."});
			}
			else res.json({status:false,error:"*No such User exists."});
		});
	});
	app.get('/profile/:id', (req, res) => {
		let {id}=req.params;
		connection.query(`SELECT * FROM RESIDENTS, RESIDENTS_DOJ WHERE RESIDENTS.REGISTRATION_ID = ? AND RESIDENTS_DOJ.ROOM_NO = RESIDENTS.ROOM_NO AND RESIDENTS_DOJ.APARTMENT_ID = RESIDENTS.APARTMENT_ID;`,[id],function (error, result, fields) {
			if(error){
				console.log(error);
				res.status(404).send("<h1>Error</h1>");
			}
			connection.query(`SELECT NAME, START_DATE FROM EVENTS, resident_conducts WHERE resident_conducts.REGISTRATION_ID = ? AND resident_conducts.EVENT_ID = EVENTS.EVENT_ID;`,[id],function (error, results, fields) {
				if(error){
					console.log(error);
					res.status(404).send("<h1>Error</h1>");
				}
				res.status(200).json({ residents: result, events: results });
			});
		});
	});
	app.get('/getApDet/:id',(req,res)=>{
		let {id}=req.params;
		let r={};
		connection.query(`SELECT NAME,OWNER_NAME,APARTMENT_ID,APARTMENT.OWNER_CONTACT FROM APARTMENT,APARTMENT_OWNER WHERE APARTMENT.OWNER_CONTACT=APARTMENT_OWNER.OWNER_CONTACT`,function (error, result, fields) {
			if(error){
				console.log(error);
				res.status(404).send("<h1>Error</h1>");
			}
			connection.query(`SELECT BHK,AVAILABLE_ROOMS FROM AVAILABLE_ROOMS WHERE APARTMENT_ID='${result[id]["APARTMENT_ID"]}';`,(error, results, fields) => {
				if(error){
					console.log(error);
					return res.status(404).send("<h1>Error</h1>");
				}
				res.status(200).json({ apt: result[id], rooms: results });
			});
		});
	});
	

	app.get('/event',(req,res)=>{
		connection.query(`SELECT * FROM EVENTS;`, function(err, result, fields) {
			if(err){
				console.log(err);
				res.status(404).send("<h1>Error</h1>");
			}
			console.log(result);
			res.status(200).json(result)
		});
	})

	app.get("/login_admin",(req,res)=>{
		res.render("login_admin.ejs");
	});
	app.post("/adminlogin",(req,res)=>{
		const {id,pass}=req.body;
		if(id=="Rohith" && pass=="asdf"){
			res.redirect('/admin');
		}
		else{
			res.send("bye");
		}
	});
	app.get("/admin",(req,res)=>{
		connection.query("SHOW TABLES;", (error, results, fields) => {
			if(error){
				console.log(error);
				res.status(404).send("<h1>Error</h1>");
			}
			let tables=[];
			results.forEach(table => {
				tables.push(table[`Tables_in_${database}`]);
			});
			// res.send(tables);
			res.render("admin.ejs",{tables});
		});
	});
	app.post("/admin/:table",(req,res)=>{
		let {table}=req.params;
		let {query}=req.body;
		let col=[];
		connection.query(`SHOW COLUMNS FROM ${table}`,(error, results, fields) => {
			if(error){
				console.log(error);
				return res.status(404).send("<h1>Error</h1>");
			}
			results.forEach(r=>{
				col.push(r["Field"]);
			})
		});
		connection.query(query?`SELECT COUNT(*) FROM ${table} WHERE ${query} `:`SELECT COUNT(*) FROM ${table} `, (error, results, fields) => {
			if(error){
				console.log(error);
				res.status(404).send("<h1>Error</h1>");
			}
			// if(query) res.send(results);
			res.render("table.ejs",{table,results:results[0]['COUNT(*)'],query,col});
		});
	});
	app.post("/admin/:table/:id/change",(req,res)=>{
		let {table,id}=req.params;
		let {query}=req.body;
		connection.query(query?`SELECT * FROM ${table} WHERE ${query}`:`SELECT * FROM ${table};`, (err, results, field) => {
			if(err){
				console.log(err);
				res.status(404).send("<h1>Error</h1>");
			}
			res.render("table_change.ejs",{table,id,result:results[id-1]});
		});
	});
	app.post("/admin/:table/update",(req,res)=>{
		let {table}=req.params;
		let result=JSON.parse(req.body['result']);
		for(let r in result){
			let v=req.body[`${r}`];
			if(v!=result[`${r}`]){
				connection.query(`SHOW INDEX FROM ${table} WHERE Key_name = 'PRIMARY';`,(error, prim, fields) => {
					if(error){
						console.log(error);
						return res.status(404).send("<h1>Error</h1>");
					}
					let query="";
					prim.forEach((k,i)=>{
						let key=k['Column_name'];
						query+=key;
						query+=prim.length-1!=i?`="${result[key]}" AND `:`="${result[key]}"`;
					});
					query+=";";
					connection.query(`UPDATE ${table} SET ${r}= ? WHERE ${query}`,[v],(error, results, fields) => {
						if(error){
							console.log(error);
							return res.status(404).send("<h1>Error</h1>");
						}
					});
				});
			}
		}
		res.redirect(307,`/admin/${table}`);
	});
	app.get("/admin/:table/add",(req,res)=>{
		let {table}=req.params;
		let col=[];
		connection.query(`SHOW COLUMNS FROM ${table}`,(error, results, fields) => {
			if(error){
				console.log(error);
				return res.status(404).send("<h1>Error</h1>");
			}
			results.forEach(r=>{
				col.push(r["Field"]);
			})
			res.render("table_add.ejs",{col,table});
		});
	});
	app.post("/admin/:table/add",(req,res)=>{
		let {table}=req.params;
		let col=JSON.parse(req.body['result']);
		let query=`INSERT INTO ${table} (`;
		for(var i=0;i<col.length ;i++){
			query+=col[i];
			query+=i!=col.length-1?", ":") ";
		}
		query+="values (";
		for(var i=0;i<col.length ;i++){
			query+=`"${req.body[col[i]]}"`;
			query+=i!=col.length-1?", ":") ;";
		}
		let f=0;
		connection.query(query,(error, results, fields) => {
			if(error){
				console.log(error);
				f=1;
				return res.status(404).send("<h1>Error</h1>");
			}
		});
		if(!f){
			res.redirect(307,`/admin/${table}`);
		}
		else res.status(404).send("<h1>Error</h1>");
	});
	app.post("/admin/:table/delete",(req,res)=>{
		let {table}=req.params;
		let result=JSON.parse(req.body['result']);
		let f=0;
		let err;
		connection.query(`SHOW INDEX FROM ${table} WHERE Key_name = 'PRIMARY';`,(error, prim, fields) => {
			if(error){
				console.log(error);
				f=1
				err=error;
				return;
			}
			let query="";
			prim.forEach((k,i)=>{
				let key=k['Column_name'];
				query+=key;
				query+=prim.length-1!=i?`="${result[key]}" AND `:`="${result[key]}"`;
			});
			query+=";";
			connection.query(`DELETE FROM ${table} WHERE ${query}`,(error, results, fields) => {
				if(error){
					console.log(error);
					err=error;
					f=1;
					return;
				}
			});
		});
		if(f) res.status(404).send(`<h1>Error</h1><p>${err}</p>`);
		else res.redirect(307,`/admin/${table}`);
	});
	app.post("/admin/:table/filter",(req,res)=>{
		let {table}=req.params;
		let col=JSON.parse(req.body['col']);
		let queryarr=[];
		col.forEach((c)=>{
			if(req.body[c]){
				queryarr.push(`${c}='${req.body[c]}'`);
			}
		});
		let query="";
		queryarr.forEach((q,i)=>{
			query+=q;
			query+=i!=queryarr.length-1?" AND ":";";
		});

		res.send(
			`<form id="redir" method="post" action="/admin/${table}">` +
         		`<input type="hidden" name="query" value="${query}">` +
         	'</form>' +
         	'<script>document.getElementById("redir").submit()</script>'
		);
	});

	app.listen(3000, function () {
		console.log('Express app running on port ' + (process.env.PORT || 3000));
	});
});