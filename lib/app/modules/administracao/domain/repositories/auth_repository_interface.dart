import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<UserEntity> signin({required UserEntity userEntity});
  Future<void> logout();
}
