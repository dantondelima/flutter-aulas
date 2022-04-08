import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  int pessoas = 0;
 
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
      title: Text("Contador de pessoas"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }
 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 80.0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _texto(pessoas),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _botao("+", Colors.green, _adicionar),
              _botao("-", Colors.red, _remover)
            ]
          )
        ],
      ),
    );
  }
 
  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.green)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
      controller: objController,
    );
  }
 
  _botao(label, color, onpress) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: RaisedButton(
          color: color,
          onPressed: onpress,
          child: Text(
            label,
            style: TextStyle(fontSize: 30)
          )
      ),
    );
  }
 
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    );
  }

  _adicionar() {
    setState(() {
      pessoas++;
    });
  }

  _remover() {
    setState(() {
      if(pessoas > 0)
        pessoas--;
    });
  }
}
