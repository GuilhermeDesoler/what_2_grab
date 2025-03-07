import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:what_2_grab/core/failures/auth_failure.dart';
import 'package:what_2_grab/domain/entities/user.dart';

import 'package:what_2_grab/domain/repositories/auth_respository.dart';
import 'package:what_2_grab/domain/usecases/sign_up.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late SignUp signUpUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signUpUseCase = SignUp(repository: mockAuthRepository);
  });

  const tEmail = 'test@email.com';
  const tPassword = 'password123';
  const tUser = User(id: '123', email: tEmail);
  final tSignUpParams = SignUpParams(email: tEmail, password: tPassword);

  group('SignUp Use Case', () {
    test('Should return User when credentials are correct', () async {
      // Arrange
      when(() => mockAuthRepository.signUp(any(), any()))
          .thenAnswer((_) async => const Right(tUser));

      // Act
      final result = await signUpUseCase.execute(tSignUpParams);

      // Assert
      expect(result, equals(const Right(tUser)));
      verify(() => mockAuthRepository.signUp(tEmail, tPassword)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('Should return User when credentials are not correct', () async {
      // Arrange
      when(() => mockAuthRepository.signUp(any(), any())).thenAnswer(
          (_) async => const Left(AuthFailure('Credenciais inválidas')));

      // Act
      final result = await signUpUseCase.execute(tSignUpParams);

      // Assert
      expect(result, equals(Left(AuthFailure('Credenciais inválidas'))));
      verify(() => mockAuthRepository.signUp(tEmail, tPassword)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
