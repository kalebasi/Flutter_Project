import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tab_items.dart';

class MyCustomButtomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> sayfaOlusturucu;
  final Map<TabItem, GlobalKey> navigatorKeys;

  const MyCustomButtomNavigation(
      {Key key,
        @required this.currentTab,
        @required this.onSelectedTab,
        @required this.sayfaOlusturucu,
        @required this.navigatorKeys})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _navItemOlustur(TabItem.IlanDetay),
          _navItemOlustur(TabItem.IlanDetayAciklama),
        ],
        onTap: (index) => onSelectedTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final gosterilecekItem = TabItem.values[index];
        return CupertinoTabView(
            navigatorKey: navigatorKeys[gosterilecekItem],
            builder: (context) {
              return sayfaOlusturucu[gosterilecekItem];
            });
      },
    );
  }

  BottomNavigationBarItem _navItemOlustur(TabItem tabItem) {
    final olusturulacakTab = TabItemData.tumTablar[tabItem];

    return BottomNavigationBarItem(
        icon: Icon(olusturulacakTab.icon), title: Text(olusturulacakTab.title));
  }
}
