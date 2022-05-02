import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';
import 'package:portfoliov2/app/modules/administracao/domain/repositories/auth_repository_interface.dart';
import 'package:portfoliov2/app/modules/administracao/infra/datasources/auth_datasource_interface.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource iAuthDatasource;

  AuthRepository({required this.iAuthDatasource});

  @override
  Future<UserEntity> signin({required UserEntity userEntity}) async {
    try {
      if (userEntity.email!.isEmpty || userEntity.password!.isEmpty) throw Exception('campo vazio');
      userEntity = await iAuthDatasource.signin(userEntity: userEntity);
    } catch (e) {
      throw Exception(e);
    }

    return userEntity;
  }

  @override
  Future<void> logout() async {
    return await iAuthDatasource.logout();
  }
}
