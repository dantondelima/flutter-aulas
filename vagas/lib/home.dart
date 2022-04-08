import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Anúncios"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }
 
  _corpo() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: ListView(
        children: <Widget>[
          _vaga(
            'Desenvolvedor backend',
            'Salário: R\$3000,00 \n Vaga legal \n Contato: (13) 12391-2321'        
          ),
          _vaga(
            'Engenheiro de dados',
            'Salário: R\$3000,00 \n Dados \n Contato: (13) 12391-2321'        
          ),
          _vaga(
            'Desenvolvedor frontend',
            'Salário: R\$2000,00 \n Vagas vagas \n Contato: (13) 12391-2321'        
          ),
        ],
      ),
    );
  }

  _vaga(titulo, descricao1) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Container(
        color: Color.fromARGB(255, 233, 233, 233),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _texto(titulo),
            _texto(descricao1),
          ],
        ),
      ),
    );
  }
 
  _texto(texto) {
    return Text(
      texto,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

}