import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergtalk/ortak_widgetlar/button_widget.dart';

class Profilim extends StatefulWidget {
  @override
  _ProfilimState createState() => _ProfilimState();
}

class _ProfilimState extends State<Profilim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profilim"),
      ),
      body: Container(
        color: Colors.green.shade100,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){},
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   width: 150,
                   height: 150,
                   child: CircleAvatar(
                     backgroundImage: NetworkImage("https://www.learning.uclg.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"),
                   ),
                      ),
               ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.80,
              height: 1.0,color: Colors.orange,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adı",
                  labelText: "Kullanıcı Adı",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onSaved: (_){},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.75,
              child: Button(
                buttonText: "Değişiklikleri Kaydet",
                buttonColor: Colors.orange,
                radius: 10,
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
