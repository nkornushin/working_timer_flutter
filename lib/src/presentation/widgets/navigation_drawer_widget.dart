import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/presentation/views/home_page.dart';
import 'package:working_timer_flutter/src/presentation/views/settings_page.dart';
import 'package:working_timer_flutter/src/presentation/views/successes_page.dart';
import 'package:working_timer_flutter/src/presentation/widgets/navigation_drawer_item.dart';
import 'package:working_timer_flutter/src/size_config.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key, this.selectedMenuIndex}) : super(key: key);

  final int? selectedMenuIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(211),
      child: DrawerTheme(
        data: const DrawerThemeData(
          scrimColor: Colors.transparent,
          elevation: 0.0,
        ),
        child: Drawer(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF76D89B),
                    Color(0xFF3FAC9C),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(78),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getProportionateScreenWidth(24)),
                      child: Text(
                        'INSTRUMENTS',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          decoration: TextDecoration.underline,
                          color: const Color(0xFF1F553E),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(21),
                    ),
                    NavigationDrawerItem(
                      title: 'Home',
                      icon: Icons.home,
                      selected: selectedMenuIndex == 1,
                      onPressed: () => onItemPressed(context, index: 1),
                    ),
                    NavigationDrawerItem(
                      title: 'Successes',
                      icon: Icons.wifi,
                      selected: selectedMenuIndex == 2,
                      onPressed: () => onItemPressed(context, index: 2),
                    ),
                    NavigationDrawerItem(
                      title: 'Settings',
                      icon: Icons.settings,
                      selected: selectedMenuIndex == 3,
                      onPressed: () => onItemPressed(context, index: 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;

      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessesPage()));
        break;

      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
        break;
    }
  }
}
