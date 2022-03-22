import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/size_config.dart';

class SharePage extends StatelessWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Share this',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(20),
        ),
      ),
    );
  }
}
