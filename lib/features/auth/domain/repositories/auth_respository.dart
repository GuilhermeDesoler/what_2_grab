import 'package:either_dart/either.dart';

import '../../../../core/failures/auth_failure.dart';
import '../../../../core/utils/no_params.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, User>> signIn(String email, String password);
  Future<Either<AuthFailure, User>> signUp(String email, String password);
  Future<Either<AuthFailure, void>> signOut(NoParams params);
}
