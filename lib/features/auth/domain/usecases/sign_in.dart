import 'package:either_dart/either.dart';
import 'package:what_2_grab/core/failures/auth_failure.dart';
import 'package:what_2_grab/core/usecases/usecases.dart';
import 'package:what_2_grab/features/auth/domain/entities/user.dart';

import '../repositories/auth_respository.dart';

class SignIn implements UseCase<User, SignInParams> {
  SignIn({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<AuthFailure, User>> execute(SignInParams params) async {
    try {
      final result = await repository.signIn(params.email, params.password);
      return result;
    } catch (e) {
      return Left(
        AuthFailure("Erro ao fazer login verifique suas credenciais!"),
      );
    }
  }
}

class SignInParams {
  const SignInParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
