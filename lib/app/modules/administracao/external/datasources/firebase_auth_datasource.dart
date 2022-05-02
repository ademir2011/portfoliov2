import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';
import 'package:portfoliov2/app/modules/administracao/infra/datasources/auth_datasource_interface.dart';

class FirebaseAuthDatasource implements IAuthDatasource {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthDatasource({required this.firebaseAuth});

  @override
  Future<UserEntity> signin({required UserEntity userEntity}) async {
    late UserCredential userCredential;
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: userEntity.email.toString(),
        password: userEntity.password.toString(),
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw Exception('email inválido!');
        case 'user-disabled':
          throw Exception('Este usuário está desabilitado!');
        case 'user-not-found':
          throw Exception('Usuário não encontrado!');
        case 'wrong-password':
          throw Exception('Senha incorreta!');
      }
    }
    userEntity.id = userCredential.user!.uid;
    return userEntity;
  }

  @override
  Future<void> logout() async {
    if (firebaseAuth.currentUser != null) {
      await firebaseAuth.signOut();
    }
  }

  @override
  bool isLogged() {
    return firebaseAuth.currentUser != null;
  }
}
