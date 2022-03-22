import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_timer_flutter/src/core/resources/ticker.dart';
import 'package:working_timer_flutter/src/presentation/bloc/cubit/timer_set_cubit.dart';
import 'package:working_timer_flutter/src/presentation/bloc/timer/timer_bloc.dart';
import 'package:working_timer_flutter/src/presentation/widgets/menu_button.dart';
import 'package:working_timer_flutter/src/presentation/widgets/navigation_drawer_widget.dart';
import 'package:working_timer_flutter/src/presentation/widgets/vertical_slider.dart';
import 'package:working_timer_flutter/src/presentation/widgets/progress_bar.dart';
import 'package:working_timer_flutter/src/presentation/widgets/time_set_item.dart';
import 'package:working_timer_flutter/src/presentation/widgets/timer.dart';
import 'package:working_timer_flutter/src/presentation/widgets/timer_action_button.dart';
import 'package:working_timer_flutter/src/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double timersCount = 0;

  static const int _duration = 30;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TimerBloc(ticker: const Ticker(), duration: _duration * 60),
        ),
        BlocProvider(
          create: (context) => TimerSetCubit(1),
        ),
      ],
      child: BlocListener<TimerSetCubit, int>(
        listener: (context, state) {
          context.read<TimerBloc>().add(TimerSetDuration(duration: state * _duration * 60));
        },
        child: Scaffold(
          drawer: const NavigationDrawerWidget(selectedMenuIndex: 1),
          body: Stack(
            children: [
              Container(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(101),
                    ),
                    const ProgressBar(),
                    SizedBox(
                      height: getProportionateScreenHeight(355),
                      width: double.infinity,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset('assets/Illustration1.png'),
                          BlocBuilder<TimerBloc, TimerState>(
                            builder: (context, state) {
                              if (state is TimerRunInProgress) {
                                return Container();
                              }

                              return Positioned(
                                right: getProportionateScreenWidth(29),
                                top: getProportionateScreenHeight(102 - 12),
                                child: const VerticalSlider(),
                              );
                            },
                          ),
                          Positioned(
                            bottom: getProportionateScreenWidth(40 / 2) * (-1),
                            left: 0,
                            right: 0,
                            child: Center(
                              child: SizedBox(
                                height: getProportionateScreenWidth(40),
                                child: BlocBuilder<TimerSetCubit, int>(
                                  builder: (context, state) {
                                    return TimeSetItem(itemCount: state);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(106),
                    ),
                    const Timer(),
                    SizedBox(
                      height: getProportionateScreenHeight(32),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(181),
                      height: getProportionateScreenHeight(48),
                      child: BlocBuilder<TimerBloc, TimerState>(
                        builder: (ctx, state) {
                          if (state is TimerRunInProgress) {
                            return TimerActionButton(
                              lable: 'STOP',
                              press: () => ctx.read<TimerBloc>().add(const TimerPaused()),
                            );
                          } else {
                            return TimerActionButton(
                              lable: 'FOCUS',
                              press: () => ctx.read<TimerBloc>().add(TimerStarted(duration: ctx.read<TimerSetCubit>().state * _duration * 60)),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const MenuButton(),
            ],
          ),
        ),
      ),
    );
  }
}
