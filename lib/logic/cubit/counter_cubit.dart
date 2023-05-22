import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(const CounterState(valueCounter: 0));

  void increment() => emit(
      CounterState(valueCounter: state.valueCounter! + 1, wasIncrement: true));

  void decrement() => emit(
      CounterState(valueCounter: state.valueCounter! - 1, wasIncrement: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
