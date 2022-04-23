import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/app_widget.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (ctx, args) => const AppWidget()),
      ];
}
