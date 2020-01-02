import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("Álcool ou Gasolina")),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.ev_station, size: 40, color: Colors.deepOrange),
                Text(
                  "MyCombustível",
                  style: TextStyle(fontSize: 35, color: Colors.blueGrey),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Preço álcool, ex: 1.59",
                  labelStyle: TextStyle(color: Colors.deepOrange)),
              style: TextStyle(fontSize: 20),
              onSubmitted: (String texto) {
                print("Valor digitado:" + texto);
              },
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Preço gasolina, ex: 3.29",
                  labelStyle: TextStyle(color: Colors.deepOrange)),
              style: TextStyle(fontSize: 20),
              onSubmitted: (String texto) {
                print("Valor digitado:" + texto);
              },
              controller: _controllerGasolina,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                onPressed: () {
                  print(_textEditingController.text);
                },
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepOrange,
                padding: EdgeInsets.fromLTRB(100, 0, 100, 0))
          ],
        ),
      ),
    );
  }
}
