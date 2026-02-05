import 'package:bloc/bloc.dart';

part 'event.dart';
part 'state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {

    on<Increment>((event, emit) {
      emit(CounterIncremented(state.count + 1));
    });

    on<Decrement>((event, emit) {
      emit(CounterDecremented(state.count - 1));
    });

    on<Reset>((event, emit) {
      emit(const CounterReset(0));
    });
  }
}
