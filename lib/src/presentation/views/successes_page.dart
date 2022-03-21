import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/size_config.dart';

class SuccessesPage extends StatelessWidget {
  const SuccessesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Successes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(20),
        ),
      ),
    );
  }
}
