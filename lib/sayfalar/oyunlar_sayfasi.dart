import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergtalk/sayfalar/ana_sayfa.dart';

class Oyunlar extends StatefulWidget {
  @override
  _OyunlarState createState() => _OyunlarState();
}

class _OyunlarState extends State<Oyunlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oyunlar"),
      ),
      body: Container(
       color: Colors.grey.shade100,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AnaSayfa())),
                    child: Container(
                      color:Colors.grey.shade100,
                      width: MediaQuery.of(context).size.width * 0.47,
                      height: 100,
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color:Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0,5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 65,
                                  height: 65,
                                  child: FittedBox(
                                    child: CircleAvatar(
                                      backgroundImage:
                                          ExactAssetImage('images/coc.jpg'),
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text("Clash Of Clans"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AnaSayfa())),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.47,
                      height: 100,
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color:Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0,5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 65,
                                  height: 65,
                                  child: FittedBox(
                                    child: CircleAvatar(
                                      backgroundImage:
                                      ExactAssetImage('images/lm.jpg'),
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text("Lords Mobile"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
