import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/presentation/bloc/cubit/timer_set_cubit.dart';
import 'package:working_timer_flutter/src/presentation/widgets/circle_thumb_shape.dart';
import 'package:working_timer_flutter/src/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerticalSlider extends StatefulWidget {
  const VerticalSlider({Key? key}) : super(key: key);

  @override
  State<VerticalSlider> createState() => _VerticalSliderState();
}

class _VerticalSliderState extends State<VerticalSlider> {
  int timersCount = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerSetCubit, int>(
      builder: (context, state) {
        return SizedBox(
          height: getProportionateScreenHeight(160 + 24),
          child: RotatedBox(
            quarterTurns: 3,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: CircleThumbShape(
                  thumbRadius: getProportionateScreenWidth(12),
                ),
                overlayShape: RoundSliderOverlayShape(overlayRadius: getProportionateScreenWidth(2)),
                activeTrackColor: const Color(0xFFFFFA85),
                inactiveTrackColor: const Color(0xFFFFFFFF).withOpacity(.4),
                thumbColor: const Color(0xFFFFFA85),
                trackHeight: getProportionateScreenHeight(7),
                inactiveTickMarkColor: Colors.transparent,
              ),
              child: Slider(
                min: 1.0,
                max: 6.0,
                value: state.toDouble(),
                onChanged: (v) {
                  context.read<TimerSetCubit>().emit(v.toInt());
                },
                divisions: 6,
              ),
            ),
          ),
        );
      },
    );
  }
}
