import 'package:activity_ring/activity_ring.dart';
import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/presentation/bloc/timer/timer_bloc.dart';
import 'package:working_timer_flutter/src/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSetItem extends StatelessWidget {
  const TimeSetItem({Key? key, required this.itemCount}) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final progress = (((context.select((TimerBloc bloc) => bloc.state.duration) / (itemCount * 30 * 60)) * 100).floor() - 100) * (-1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) {
          final int _currentProgress = ((progress - ((100 / itemCount) * index)) * 100) ~/ ((100 / itemCount));
          return _item(
            (index + 1) < itemCount,
            _currentProgress > 100 ? 100 : _currentProgress,
          );
        },
      ),
    );
  }

  Widget _item(bool addSeparator, int progress) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: getProportionateScreenWidth(40),
              height: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFFFF4E50),
                    Color(0xFFF9D423),
                    Color(0xFFF9DC78),
                  ],
                ),
              ),
            ),
            if (progress > 0)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 0,
                child: Ring(
                  percent: progress.toDouble(),
                  color: RingColorScheme(
                    ringColor: Colors.grey,
                  ),
                  radius: getProportionateScreenWidth(18),
                  width: getProportionateScreenWidth(4),
                  showBackground: false,
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Align(
                child: Container(
                  width: getProportionateScreenWidth(32),
                  height: getProportionateScreenWidth(32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: const Color(0xFF6CD09C),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '30',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12),
                        color: const Color(0xFFDDFFF1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        addSeparator ? Container(width: getProportionateScreenWidth(24)) : Container(),
      ],
    );
  }
}
