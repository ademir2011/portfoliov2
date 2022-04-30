import 'package:portfoliov2/app/modules/administracao/domain/entities/user_entity.dart';
import 'package:portfoliov2/app/modules/administracao/domain/repositories/auth_repository_interface.dart';

abstract class ISignin {
  Future<UserEntity> sigin({required UserEntity userEntity});
}

class Signin implements ISignin {
  final IAuthRepository iAuthRepository;

  Signin({required this.iAuthRepository});

  @override
  Future<UserEntity> sigin({required UserEntity userEntity}) async {
    return await iAuthRepository.signin(userEntity: userEntity);
  }
}
