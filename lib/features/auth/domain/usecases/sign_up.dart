import 'package:either_dart/either.dart';
import 'package:what_2_grab/core/failures/auth_failure.dart';
import 'package:what_2_grab/core/usecases/usecases.dart';
import 'package:what_2_grab/features/auth/domain/repositories/auth_respository.dart';
import '../entities/user.dart';

class SignUp implements UseCase<User, SignUpParams> {
  SignUp({required this.repository});

  final AuthRepository repository;

  @override
  Future<Either<AuthFailure, User>> execute(SignUpParams params) async {
    try {
      final result = await repository.signUp(params.email, params.password);
      return result;
    } catch (e) {
      return Left(
        AuthFailure(
            "Erro ao criar conta, verifique se passou as informações corretamente!"),
      );
    }
  }
}

class SignUpParams {
  const SignUpParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
