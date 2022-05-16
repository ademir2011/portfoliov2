import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/trajectory/presenter/trajectory_page.dart';

class TrajectoryModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (ctx, args) => const TrajectoryPage(),
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 1),
        ),
      ];
}
