import 'package:portfoliov2/app/modules/administracao/domain/repositories/auth_repository_interface.dart';

abstract class ILogout {
  Future<void> logout();
}

class Logout implements ILogout {
  final IAuthRepository iAuthRepository;

  Logout({required this.iAuthRepository});

  @override
  Future<void> logout() async {
    return await iAuthRepository.logout();
  }
}
