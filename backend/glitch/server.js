const express = require('express'),
    app = express(),
    cors = require('cors'),
    bodyParser = require('body-parser');

const db = require('/app/db');

app.use(cors())
app.use(bodyParser.json())
app.use(express.urlencoded());
app.use(express.static("public"));


// obtener las materias desde la aplicación con una petición tipo get
// si se recibe una petición tipo get que termine con "/mostrarhomeworks" se realizará:
app.get("/mostrarhomeworks", function (req, res) {
    let sql = `SELECT class_image,name,schedule,classroom,days FROM homeworks order by name`;
    db.query(sql, function (err, data, fields) {
        if (err) throw err;
        var hws = data.rows;
        res.json(hws);
    })
});

// subir una nueva materia desde la aplicación con una petición tipo post
// si se recibe una petición tipo post que termine con "/insertclass" se realizará:
app.post("/insertclass", function (req, res) {
    let sql = `INSERT INTO homeworks (class_image,name,schedule,classroom,days) VALUES($1,$2,$3,$4,$5) RETURNING *;`;
    let values = [
        req.body.class_image,
        req.body.name,
        req.body.schedule,
        req.body.classroom,
        req.body.days
    ];
    db.query(sql, values, function (err, data, fields) {
        res.json({
            data,
            status: 200,
            message: "fruits insertado correctamente. Con el ID " + data.insertId
        })
    })
});

// listen for requests :)
const listener = app.listen(process.env.PORT, () => {
    console.log("Your app is listening on port " + listener.address().port);
});
