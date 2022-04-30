import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';
import 'package:portfoliov2/app/modules/administracao/domain/usecases/signin.dart';
import 'package:portfoliov2/app/modules/administracao/external/datasources/firebase_auth_datasource.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

void main() {
  test('Deve autenticar com firebase', () async {
    final firebaseAuthMock = FirebaseAuthMock();
    final userCredentialMock = UserCredentialMock();
    final userMock = UserMock();
    when(
      () => firebaseAuthMock.signInWithEmailAndPassword(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => userCredentialMock);

    when(
      () => userCredentialMock.user,
    ).thenReturn(userMock);

    when(
      () => userMock.uid,
    ).thenReturn('123456');

    final userEntity = UserEntity(email: 'teste@teste.com', password: '123456');

    final firebaseAuthDatasource = FirebaseAuthDatasource(firebaseAuth: firebaseAuthMock);

    expect(await firebaseAuthDatasource.signin(userEntity: userEntity), isA<UserEntity>());
  });
}
