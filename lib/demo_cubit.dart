import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class DemoCubit extends Cubit<int> {
  DemoCubit() : super(-1);
  int state = -1;

  void change(input) {
    state = input;
    print('new_state: $state');
    emit(state);
  }
}
