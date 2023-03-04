import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/business_logic/register_bloc/register_event.dart';
import 'package:movies_test/business_logic/register_bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  var userRepository;

  // RegisterBloc(super.initialState);

  // final UserRepository userRepository;

  RegisterBloc({required this.userRepository}) : super(RegisterState.empty()) {
    on<Submitted>((event, emit) async {
      emit(RegisterState.loading());

      if (event.email.isNotEmpty &&
          event.password.isNotEmpty &&
          event.confirmPassword.isNotEmpty &&
          event.displayName.isNotEmpty) {
        emit(RegisterState.success());
      }
    });
  }
}
