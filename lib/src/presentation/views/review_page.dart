import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/size_config.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Review',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(20),
        ),
      ),
    );
  }
}
