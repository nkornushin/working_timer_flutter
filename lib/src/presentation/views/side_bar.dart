import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/size_config.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  final bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: isOpened ? 0 : 0,
      right: isOpened ? 0 : MediaQuery.of(context).size.width - getProportionateScreenWidth(52),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: const Color(0xFF333333).withOpacity(.7),
          child: Row(
            children: [
              Container(
                width: getProportionateScreenWidth(211),
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
              ),
              Align(
                alignment: const Alignment(0, .9),
                child: Container(
                  width: getProportionateScreenWidth(52),
                  height: getProportionateScreenHeight(79),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
