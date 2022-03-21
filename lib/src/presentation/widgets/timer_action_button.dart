import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/size_config.dart';

class TimerActionButton extends StatelessWidget {
  const TimerActionButton({Key? key, required this.lable, required this.press}) : super(key: key);

  final String lable;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(
        lable,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(14),
          color: Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFFFFCAF),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(24)),
        ),
      ),
    );
  }
}
