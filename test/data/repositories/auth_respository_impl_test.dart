import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:either_dart/either.dart';
import 'package:what_2_grab/core/config/firebase/app_firebase.dart';

import 'package:what_2_grab/core/failures/auth_failure.dart';
import 'package:what_2_grab/core/utils/no_params.dart';
import 'package:what_2_grab/data/repositories/auth_repository_impl.dart';
import 'package:what_2_grab/data/models/user_model.dart';

class MockAppFirebase extends Mock implements AppFirebase {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  late AuthRepositoryImpl authRepositoryImpl;
  late MockAppFirebase mockAppFirebase;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;

  setUp(() {
    mockAppFirebase = MockAppFirebase();
    mockFirebaseAuth = MockFirebaseAuth();
    authRepositoryImpl = AuthRepositoryImpl(appFirebase: mockAppFirebase);

    when(() => mockAppFirebase.firebaseAuth).thenReturn(mockFirebaseAuth);

    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
  });

  const tEmail = 'test@email.com';
  const tPassword = 'password123';
  const tUserModel = UserModel(id: '123', email: tEmail);

  test('Should return User on successful signIn', () async {
    // Arrange
    when(() => mockFirebaseAuth.signInWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
        )).thenAnswer((_) async => mockUserCredential);

    when(() => mockUserCredential.user).thenReturn(mockUser);
    when(() => mockUser.uid).thenReturn('123');
    when(() => mockUser.email).thenReturn(tEmail);

    // Act
    final result = await authRepositoryImpl.signIn(tEmail, tPassword);

    // Assert
    expect(result, equals(const Right(tUserModel)));
    verify(() => mockFirebaseAuth.signInWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
        )).called(1);
  });

  test('Should return AuthFailure on error', () async {
    // Arrange
    when(() => mockFirebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenThrow(FirebaseAuthException(code: 'user-not-found'));

    // Act
    final result = await authRepositoryImpl.signIn(tEmail, tPassword);

    // Assert
    expect(result,
        equals(Left(AuthFailure('Erro ao fazer login: user-not-found'))));
  });

  test('Should return Right(null) when signOut is successful', () async {
    // Arrange
    when(() => mockFirebaseAuth.signOut())
        .thenAnswer((_) async => Future.value());

    // Act
    final result = await authRepositoryImpl.signOut(NoParams());

    // Assert
    expect(result, equals(const Right(null)));
    verify(() => mockFirebaseAuth.signOut()).called(1);
  });

  test('Should return AuthFailure when signOut fails', () async {
    // Arrange
    when(() => mockFirebaseAuth.signOut()).thenThrow(Exception('Logout error'));

    // Act
    final result = await authRepositoryImpl.signOut(NoParams());

    // Assert
    expect(
        result,
        equals(Left(
            AuthFailure('Erro ao fazer logout: Exception: Logout error'))));
  });
}
