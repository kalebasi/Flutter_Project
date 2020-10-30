import 'package:flutter/material.dart';

class IlanDetayAciklama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Detaylı Bilgi")),
      ),
      body: Container(
        color: Colors.grey.shade400,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Text("SAASDADASDASDAASDASDASDADADSADASDSADSADSADSADASDSADASDASDAASDSASADASDASDS")),
      ),
    );
  }
}
