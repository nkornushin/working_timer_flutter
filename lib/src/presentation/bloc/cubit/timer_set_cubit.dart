import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_set_state.dart';

class TimerSetCubit extends Cubit<int> {
  TimerSetCubit(this.initialTime) : super(initialTime);

  final int initialTime;
}
