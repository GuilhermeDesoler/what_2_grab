import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:what_2_grab/core/failures/auth_failure.dart';
import 'package:what_2_grab/domain/entities/user.dart';

import 'package:what_2_grab/domain/repositories/auth_respository.dart';
import 'package:what_2_grab/domain/usecases/sign_in.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late SignIn signInUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signInUseCase = SignIn(repository: mockAuthRepository);
  });

  const tEmail = 'test@email.com';
  const tPassword = 'password123';
  const tUser = User(id: '123', email: tEmail);
  final tSignInParams = SignInParams(email: tEmail, password: tPassword);

  group('SignIn Use Case', () {
    test('Should return User when credentials are correrct', () async {
      // Arrange
      when(() => mockAuthRepository.signIn(any(), any()))
          .thenAnswer((_) async => const Right(tUser));

      // Act
      final result = await signInUseCase.execute(tSignInParams);

      // Assert
      expect(result, equals(const Right(tUser)));
      verify(() => mockAuthRepository.signIn(tEmail, tPassword)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('Should return a Failure when the credentials are not correct',
        () async {
      // Arrange
      when(() => mockAuthRepository.signIn(any(), any()))
          .thenAnswer((_) async => Left(AuthFailure('Credenciais inválidas')));

      // Act
      final result = await signInUseCase.execute(tSignInParams);

      // Assert
      expect(result, equals(Left(AuthFailure('Credenciais inválidas'))));
      verify(() => mockAuthRepository.signIn(tEmail, tPassword)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
