import 'package:flutter/material.dart';
import 'package:fluttergtalk/sayfalar/custom_bottom_navi.dart';
import 'package:fluttergtalk/sayfalar/ilan_detay_aciklama_sayfasi.dart';
import 'package:fluttergtalk/sayfalar/ilan_detay_sayfasi.dart';
import 'package:fluttergtalk/sayfalar/tab_items.dart';



class IlanBottomNavi extends StatefulWidget {

  IlanBottomNavi({Key key}) : super(key: key);

  @override
  _IlanBottomNaviState createState() => _IlanBottomNaviState();
}

class _IlanBottomNaviState extends State<IlanBottomNavi> {

  TabItem _currentTab = TabItem.IlanDetay;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.IlanDetay: GlobalKey<NavigatorState>(),
    TabItem.IlanDetayAciklama: GlobalKey<NavigatorState>(),
  };


  Map<TabItem, Widget> tumSayfalar() {
    return {
      TabItem.IlanDetay: IlanDetay(),
      TabItem.IlanDetayAciklama: IlanDetayAciklama(),
    };
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async =>
        !await navigatorKeys[_currentTab].currentState.maybePop(),
        child: MyCustomButtomNavigation(
          sayfaOlusturucu: tumSayfalar(),
          navigatorKeys: navigatorKeys,
          currentTab: _currentTab,
          onSelectedTab: (secilenTab) {
            if (secilenTab == _currentTab) {
              navigatorKeys[secilenTab]
                  .currentState
                  .popUntil((route) => route.isFirst);
            } else {
              setState(() {
                _currentTab = secilenTab;
              });
            }
          },
        ));
  }
}
/*
 */
