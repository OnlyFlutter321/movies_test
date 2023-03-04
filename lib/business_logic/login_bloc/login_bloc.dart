import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/business_logic/login_bloc/login_event.dart';
import 'package:movies_test/business_logic/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // ignore: prefer_typing_uninitialized_variables
  var userRepository;

  LoginBloc({required this.userRepository}) : super(LoginState.empty()) {
    on<LoginSubmitEmailPasswordEvent>((event, emit) async {
      emit(LoginState.loading());

      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        emit(LoginState.success());
      } else {
        emit(LoginState.failure());
      }
    });
  }
}
