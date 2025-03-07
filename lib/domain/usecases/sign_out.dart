import 'package:either_dart/either.dart';

import '../../core/failures/auth_failure.dart';
import '../../core/usecases/usecases.dart';
import '../../core/utils/no_params.dart';
import '../repositories/auth_respository.dart';

class SignOut implements UseCase<void, NoParams> {
  SignOut({required this.repository});

  final AuthRepository repository;

  @override
  Future<Either<AuthFailure, void>> execute(NoParams params) async {
    try {
      await repository.signOut(params);
      return Right(null);
    } catch (e) {
      return Left(AuthFailure("Erro ao desconectar a conta!"));
    }
  }
}
