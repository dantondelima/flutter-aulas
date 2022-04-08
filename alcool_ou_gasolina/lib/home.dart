import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
 
  String infoResultado = "Informe os valores!";
 
  void _calcularResultado() {
    setState(() {
      double alcool = double.parse(alcoolController.text);
      double gasolina = double.parse(gasolinaController.text);
 
      double resultado = alcool / gasolina;
      String vale = "";

      if(resultado < 0.7){
        vale = "Álcool é melhor";
      }
      else{
        vale = "Gasolina é melhor";
      }
      
      infoResultado = 'Resultado: $vale';
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
        "Álcool ou gasolina",
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
          _foto("http://4.bp.blogspot.com/-hOgX8GWWL_8/UyIdyUNsT3I/AAAAAAAABFA/dFG68hOVcYQ/s1600/Posto+de+gasolina.jpg"),
          _campo("Preço do Alcool", alcoolController),
          _campo("Preço da gasolina", gasolinaController),
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
          onPressed: _calcularResultado,
          child: Text("Verificar",
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
          color: Colors.green,
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
