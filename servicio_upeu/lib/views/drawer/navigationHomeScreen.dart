import 'package:servicio_upeu/views/theme/appTheme.dart';
import 'package:servicio_upeu/views/drawer/drawerUserController.dart';
import 'package:servicio_upeu/views/drawer/homeDrawer.dart';
/*import 'package:resepmau_flutter/feedbackScreen.dart';
import 'package:resepmau_flutter/helpScreen.dart';
import 'package:resepmau_flutter/homeScreen.dart';
import 'package:resepmau_flutter/inviteFriendScreen.dart';*/
//import 'package:calidad_serv/views/register_act.dart';
//import 'package:calidad_serv/views/feedbackScreen.dart';
import 'package:servicio_upeu/views/lista_catcli.dart';

import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  @override
  void initState() {
    //drawerIndex = DrawerIndex.Help;
    //screenView = HelpScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyBlack,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = ListViewJsonapi();
          //screenView = RegisterActivity();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          // screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          //screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          // screenView = InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }
}
