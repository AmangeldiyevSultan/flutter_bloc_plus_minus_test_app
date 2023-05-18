part of 'counter_cubit.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int? valueCounter;
  bool? wasIncrement;

  CounterState({
    @required this.valueCounter,
    this.wasIncrement,
  });

  @override
  List<Object?> get props => [valueCounter, wasIncrement];
}
