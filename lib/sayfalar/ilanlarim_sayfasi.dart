import 'package:flutter/material.dart';
import 'package:fluttergtalk/sayfalar/ana_sayfa.dart';

class Ilanlarim extends StatefulWidget {
  @override
  _IlanlarimState createState() => _IlanlarimState();
}

class _IlanlarimState extends State<Ilanlarim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İlanlarım"),
      ),
      body: Container(
        color: Colors.red.shade100,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 50,
                      child: FittedBox(child: Icon(Icons.assignment)),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Expanded(
                        child: Container(
                          width: 300,
                          height: 50,
                          child: Center(
                            child: Text(
                              "560M KUDRETLİ LORDS MOBİLE HESABI",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                   /* Container(
                      width: 145,
                    ),*/
                    GestureDetector(
                        onTap: (){},
                        child: Center(child: Icon(Icons.create))),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
