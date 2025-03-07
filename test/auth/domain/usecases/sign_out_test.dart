import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:what_2_grab/core/failures/auth_failure.dart';
import 'package:what_2_grab/core/utils/no_params.dart';

import 'package:what_2_grab/features/auth/domain/repositories/auth_respository.dart';
import 'package:what_2_grab/features/auth/domain/usecases/sign_out.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late SignOut signOutUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signOutUseCase = SignOut(repository: mockAuthRepository);
  });

  final tSignOutParams = NoParams();

  group('SignOut Use Case', () {
    test('Should return null when executed', () async {
      // Arrange
      when(() => mockAuthRepository.signOut(tSignOutParams))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await signOutUseCase.execute(tSignOutParams);

      // Assert
      expect(result, equals(const Right(null)));
      verify(() => mockAuthRepository.signOut(tSignOutParams)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('Should return error when there is any internal error', () async {
      // Arrange
      when(() => mockAuthRepository.signOut(tSignOutParams))
          .thenThrow(Exception('Erro interno'));

      // Act
      final result = await signOutUseCase.execute(tSignOutParams);

      // Assert
      expect(result, equals(Left(AuthFailure('Erro ao desconectar a conta!'))));
      verify(() => mockAuthRepository.signOut(tSignOutParams)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
