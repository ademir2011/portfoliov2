import 'package:portfoliov2/app/modules/administracao/domain/repositories/auth_repository_interface.dart';

abstract class IIsLogged {
  bool isLogged();
}

class IsLogged implements IIsLogged {
  final IAuthRepository iAuthRepository;

  IsLogged({required this.iAuthRepository});

  @override
  bool isLogged() {
    return iAuthRepository.isLogged();
  }
}
