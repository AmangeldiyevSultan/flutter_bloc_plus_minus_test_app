import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(valueCounter: 0));

  void increment() => emit(
      CounterState(valueCounter: state.valueCounter! + 1, wasIncrement: true));

  void decrement() => emit(
      CounterState(valueCounter: state.valueCounter! - 1, wasIncrement: false));
}
