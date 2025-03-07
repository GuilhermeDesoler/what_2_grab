import 'package:either_dart/either.dart';
import 'package:what_2_grab/config/firebase/app_firebase.dart';

import 'package:what_2_grab/core/failures/auth_failure.dart';
import 'package:what_2_grab/core/utils/no_params.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_respository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.appFirebase,
  });

  final AppFirebase appFirebase;

  @override
  Future<Either<AuthFailure, User>> signIn(
    String email,
    String password,
  ) async {
    try {
      final userCredential =
          await appFirebase.firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        final userModel = UserModel(
          id: user.uid,
          email: user.email ?? '',
        );

        return Right(userModel.toUser());
      } else {
        return Left(AuthFailure("Usuário não encontrado."));
      }
    } catch (e) {
      return Left(AuthFailure("Erro ao fazer login: $e"));
    }
  }

  @override
  Future<Either<AuthFailure, User>> signUp(
      String email, String password) async {
    try {
      final userCredential =
          await appFirebase.firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user != null) {
        final userModel = UserModel(
          id: user.uid,
          email: user.email ?? '',
        );

        return Right(userModel.toUser());
      } else {
        return Left(AuthFailure("Erro ao criar conta."));
      }
    } catch (e) {
      return Left(AuthFailure("Erro ao criar conta: $e"));
    }
  }

  @override
  Future<Either<AuthFailure, void>> signOut(NoParams params) async {
    try {
      await appFirebase.firebaseAuth.signOut();
      return Right(null);
    } catch (e) {
      return Left(AuthFailure("Erro ao fazer logout: $e"));
    }
  }
}
