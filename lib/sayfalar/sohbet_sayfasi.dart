

import 'package:flutter/material.dart';

class SohbetSayfasi extends StatefulWidget {
  @override
  _SohbetSayfasiState createState() => _SohbetSayfasiState();

}

class _SohbetSayfasiState extends State<SohbetSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Adı"),
        leading: CircleAvatar(
          backgroundImage: ExactAssetImage('images/user.jpg'),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _buildMesajListesi(),
            _buildYeniMesajGir(),
          ],
        ),
      ),
    );
  }

  Widget _buildMesajListesi() {
    return Container(
      child:Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("SA"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("AS"),
            ],
          ),
        ],
      ),

    );
  }

  Widget _buildYeniMesajGir() {
  //  final _chatModel = Provider.of<ChatViewModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.only(bottom: 8, left: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
             // controller: _mesajController,
              cursorColor: Colors.blueGrey,
              style: new TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Mesajınızı Yazın",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.navigation,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () async {
             /*   if (_mesajController.text.trim().length > 0) {
                  Mesaj _kaydedilecekMesaj = Mesaj(
                    kimden: _chatModel.currentUser.userID,
                    kime: _chatModel.sohbetEdilenUser.userID,
                    bendenMi: true,
                    konusmaSahibi: _chatModel.currentUser.userID,
                    mesaj: _mesajController.text,
                  );
                  var sonuc = await _chatModel.saveMessage(_kaydedilecekMesaj,_chatModel.currentUser);
                  if (sonuc) {
                    _mesajController.clear();
                    _scrollController.animateTo(0,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 100));
                  }
                } */
              },
            ),
          ),
        ],
      ),
    );
  }


}
