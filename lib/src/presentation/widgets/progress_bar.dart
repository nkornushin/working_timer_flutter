import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/presentation/bloc/cubit/timer_set_cubit.dart';
import 'package:working_timer_flutter/src/presentation/bloc/timer/timer_bloc.dart';
import 'package:working_timer_flutter/src/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = context.select((TimerBloc bloc) => bloc.state.duration) / (context.read<TimerSetCubit>().state * 30 * 60);

    return Column(
      children: [
        Text(
          'Сompleted ${((progress * 100).floor() - 100) * (-1)}%',
          style: TextStyle(
            fontSize: getProportionateScreenHeight(18),
            color: const Color(0xFFFFFFFF),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Container(
          width: getProportionateScreenWidth(254),
          height: getProportionateScreenWidth(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
            border: Border.all(
              width: 1,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              width: getProportionateScreenWidth(254 * (1 - ((progress * 100).floor()) / 100)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                border: Border.all(
                  width: 0,
                  color: Colors.transparent,
                ),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF00AF64),
                    Color(0xFFB7E8F5),
                  ],
                ),
              ),
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
      ],
    );
  }
}
