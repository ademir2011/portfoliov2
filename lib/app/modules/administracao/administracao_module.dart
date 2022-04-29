import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/administracao/pages/signin_page.dart';

class AdministracaoModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SigninPage()),
      ];
}
