part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int? valueCounter;
  final bool? wasIncrement;

  const CounterState({
    @required this.valueCounter,
    this.wasIncrement,
  });

  Map<String, dynamic> toMap() {
    return {'valueCounter': valueCounter, 'wasIncrement': wasIncrement};
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
        valueCounter: map['valueCounter'], wasIncrement: map['wasIncrement']);
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));

  @override
  List<Object?> get props => [valueCounter, wasIncrement];

  @override
  bool get stringify => true;
}
