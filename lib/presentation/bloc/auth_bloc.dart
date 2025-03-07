import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_2_grab/core/utils/no_params.dart';

import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_out.dart';
import '../../domain/usecases/sign_up.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;
  final SignUp signUp;
  final SignOut signOut;

  AuthBloc({
    required this.signIn,
    required this.signUp,
    required this.signOut,
  }) : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      final params = SignInParams(email: event.email, password: event.password);

      emit(AuthLoading());
      final result = await signIn.execute(params);

      result.fold(
        (failure) => emit(AuthFailureState(failure)),
        (user) => emit(AuthSuccess(user)),
      );
    });

    on<SignUpEvent>((event, emit) async {
      final params = SignUpParams(email: event.email, password: event.password);

      emit(AuthLoading());
      final result = await signUp.execute(params);

      result.fold(
        (failure) => emit(AuthFailureState(failure)),
        (user) => emit(AuthSuccess(user)),
      );
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await signOut.execute((NoParams()));

      result.fold(
        (failure) => emit(AuthFailureState(failure)),
        (_) => emit(AuthInitial()),
      );
    });
  }
}
