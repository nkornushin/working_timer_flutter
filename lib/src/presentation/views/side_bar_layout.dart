import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/presentation/views/home_page.dart';
import 'package:working_timer_flutter/src/presentation/views/side_bar.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          HomePage(),
          SideBar(),
        ],
      ),
    );
  }
}
