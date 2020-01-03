import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "Resultado";

  void _calcular() {
    double precoGasolina = double.tryParse(_controllerGasolina.text);
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    precoGasolina == null || precoAlcool == null
        ? setState(() {
            _textoResultado = "Valores inválidos";
          })
        : precoAlcool / precoGasolina >= .7
            ? setState(() => _textoResultado = "Melhor abastecer com gasolina")
            : setState(() => _textoResultado = "Melhor abastecer com álcool");
    this.limpaValores();
  }

  void limpaValores() {
    this._controllerAlcool.text = "";
    this._controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("Álcool ou Gasolina")),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.ev_station, size: 40, color: Colors.deepOrange),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "iCombustível",
                  style: TextStyle(fontSize: 35, color: Colors.blueGrey),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Saiba qual a melhor opção para abastecimento do seu carro",
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
              controller: _controllerGasolina,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () => _calcular(),
              child: Text(
                "Calcular",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepOrange,
              padding: EdgeInsets.all(15),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  _textoResultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ))
          ],
        ),
      )),
    );
  }
}
