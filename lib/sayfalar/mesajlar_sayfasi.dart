import 'package:flutter/material.dart';

class MesajlarSayfasi extends StatefulWidget {
  @override
  _MesajlarSayfasiState createState() => _MesajlarSayfasiState();
}

class _MesajlarSayfasiState extends State<MesajlarSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SOHBETLER"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 6, 
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("Kullanıcı Adı"),
                subtitle: Text("Gelen mesaj"),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.withAlpha(40),
                  backgroundImage: ExactAssetImage('images/user.jpg'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
