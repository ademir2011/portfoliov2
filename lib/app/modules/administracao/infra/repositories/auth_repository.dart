import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';
import 'package:portfoliov2/app/modules/administracao/domain/repositories/auth_repository_interface.dart';
import 'package:portfoliov2/app/modules/administracao/infra/datasources/auth_datasource_interface.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource iAuthDatasource;

  AuthRepository({required this.iAuthDatasource});

  @override
  Future<UserEntity> signin({required UserEntity userEntity}) async {
    return await iAuthDatasource.signin(userEntity: userEntity);
  }
}
