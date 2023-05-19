part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int? valueCounter;
  final bool? wasIncrement;

  const CounterState({
    @required this.valueCounter,
    this.wasIncrement,
  });

  @override
  List<Object?> get props => [valueCounter, wasIncrement];
}
