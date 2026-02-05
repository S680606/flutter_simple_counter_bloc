part of 'bloc.dart';

abstract class CounterState {
  final int count;
  const CounterState(this.count);
}

class CounterInitial extends CounterState {
  const CounterInitial(super.count);
}

class CounterIncremented extends CounterState {
  const CounterIncremented(super.count);
}

class CounterDecremented extends CounterState {
  const CounterDecremented(super.count);
}

class CounterReset extends CounterState {
  const CounterReset(super.count);
}
