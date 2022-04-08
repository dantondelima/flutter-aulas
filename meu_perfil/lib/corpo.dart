import 'package:flutter/material.dart';
 
class widget_perfil extends StatelessWidget {
  const widget_perfil({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danton de Lima"),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 41, 118, 252),
        child: Center(
          child: Text(
            "Danton de Lima, 21\n"
            "- Estudante de ADS\n"
            "- Desenvolvedor backend\n"
            "-- Projetos\n"
            "- Amatel ecommerce\n"
            "- Sicon\n"
            "- WLS\n",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),

            ),
        ),
        

      ),
    );
  }
}
