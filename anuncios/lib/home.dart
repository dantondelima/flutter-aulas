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
      child: PageView(
        children: <Widget>[
          _anuncio(
            'https://conteudo.imguol.com.br/c/noticias/c6/2020/05/14/denuncia-online-redes-sociais-megafone-trombone-celular-smartphone-discussao-debate-bate-boca-barraco-redes-sociais-live-streaming-propaganda-anuncio-1589494596431_v2_1x1.jpg',
            'Compre',
            'aobaa'          
          ),
          _anuncio(
            'https://res.cloudinary.com/dte7upwcr/image/upload/f_auto,w_1500/blog/blog2/compras-online/compras-online-img_header.jpg',
            'Vambora',
            'compre agora'          
          ),
          _anuncio(
            'https://coodesh.com/blog/wp-content/uploads/2021/10/mobile-flutter-1-1152x648.jpg',
            'Curso de Flutter',
            'bonzao'          
          ),
        ],
      ),
    );
  }

  _anuncio(imagem, descricao1, descricao2) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromARGB(255, 233, 233, 233),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _foto(imagem),
            _texto(descricao1),
            _texto(descricao2),
          ],
        ),
      ),
    );
  }
 
 _foto(url) {
    return Center(
      child: Image.network(
        url,
        height: 200,
        width: 200,
        fit: BoxFit.cover,
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