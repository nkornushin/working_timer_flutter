import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/presentation/bloc/timer/timer_bloc.dart';
import 'package:working_timer_flutter/src/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    print('duration = ' + duration.toString());
    //final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final minutesStr = ((duration / 60)).floor().toString().padLeft(2, '0');
    print('minutesStr = ' + minutesStr.toString());
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: TextStyle(
        fontSize: getProportionateScreenWidth(60),
        height: getProportionateScreenHeight(73 / 60),
        color: const Color(0xFFFFFFFF),
      ),
    );
  }
}
