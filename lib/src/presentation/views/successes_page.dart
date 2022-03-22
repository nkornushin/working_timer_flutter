import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/presentation/widgets/menu_button.dart';
import 'package:working_timer_flutter/src/presentation/widgets/navigation_drawer_widget.dart';
import 'package:working_timer_flutter/src/size_config.dart';

class SuccessesPage extends StatelessWidget {
  const SuccessesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(selectedMenuIndex: 2),
      body: Stack(
        children: [
          Container(
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
            child: Center(
              child: Text(
                'Successes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(20),
                ),
              ),
            ),
          ),
          const MenuButton(),
        ],
      ),
    );
  }
}
