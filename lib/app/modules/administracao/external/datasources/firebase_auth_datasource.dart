import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';
import 'package:portfoliov2/app/modules/administracao/infra/datasources/auth_datasource_interface.dart';

class FirebaseAuthDatasource implements IAuthDatasource {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthDatasource({required this.firebaseAuth});

  @override
  Future<UserEntity> signin({required UserEntity userEntity}) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: userEntity.email.toString(),
      password: userEntity.password.toString(),
    );
    userEntity.id = userCredential.user!.uid;
    return userEntity;
  }

  @override
  Future<UserEntity> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
