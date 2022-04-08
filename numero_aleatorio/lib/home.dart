import 'package:flutter/material.dart';
import 'dart:math';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController numeroController = TextEditingController();
 
  String infoResultado = "Informe o número";
  int random = new Random().nextInt(11);

  void _calcularImc() {
    setState(() {
      int numero = int.parse(numeroController.text);
      String resultado = "";

      if(numero == random){
        resultado = "Acertou!!";
      }
      else{
        resultado = "Tente novamente :(";
      }
 
      infoResultado = '$resultado';
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
        "Jogo do número aleatório",
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
          _foto("https://midias.correiobraziliense.com.br/_midias/jpg/2022/03/14/675x450/1_rata_alada-7588986.jpg"),
          _campo("Pense em 1 nº de 0 a 10", numeroController),
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
              labelStyle: TextStyle(color: Colors.red),
              border: OutlineInputBorder()),
              
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red, fontSize: 25.0),
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