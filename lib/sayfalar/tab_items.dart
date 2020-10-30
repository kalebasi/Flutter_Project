import 'package:flutter/material.dart';

enum TabItem{IlanDetay,IlanDetayAciklama}


class TabItemData{

  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  static Map<TabItem,TabItemData> tumTablar ={
    TabItem.IlanDetay:TabItemData("İlan Detayı",Icons.info),
    TabItem.IlanDetayAciklama:TabItemData("Açıklama",Icons.list),
  };

}




