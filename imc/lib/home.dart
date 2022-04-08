import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
 
  String infoResultado = "Informe os dados!";
 
  void _calcularImc() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
 
      double imc = peso / (altura * altura);
      String resultado = "";
      if(imc < 18.5) {
        resultado = "Abaixo do peso";
      }
      else if(imc >= 18.5 && imc < 25) {
        resultado = "Peso normal";
      }
      else if(imc >= 25 && imc < 30) {
        resultado = "Sobrepeso";
      }
      else if(imc >= 30 && imc < 35) {
        resultado = "Obesidade grau 1";
      }
      else if(imc >= 35 && imc < 40) {
        resultado = "Obesidade grau 2";
      }
      else if(imc >= 40) {
        resultado = "Obesidade grau 3 ou mórbida";
      }
 
      infoResultado = 'Classificação: $resultado';
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text(
        "Cálculo do IMC",
        style: TextStyle(color: Color.fromARGB(255, 255, 127, 41))
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }
 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto("https://guiadafarmacia.com.br/wp-content/uploads/2021/02/corpo-imc.jpg"),
          _campo("Peso", pesoController),
          _campo("Altura", alturaController),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }
 
  _campo(labelTitulo, objController) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: labelTitulo, 
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder()),
              
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 25.0),
          controller: objController,
        )
    );
  }
 
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularImc,
          child: Text("Verificar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.blue,
        ),
      ),
    );
  }
 
  _texto(textoParaExibir) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 30.0), 
      child: Text(
        textoParaExibir,
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromARGB(255, 255, 18, 18), fontSize: 25.0),
      ),
    );
  }

  _foto(url) {
    return Center(
      child: Image.network(
        url,
        height: 200,
        width: 200),
    );
  }
}