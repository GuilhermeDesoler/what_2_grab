import 'package:either_dart/either.dart';
import 'package:what_2_grab/core/failures/auth_failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<AuthFailure, T>> execute(Params params);
}
