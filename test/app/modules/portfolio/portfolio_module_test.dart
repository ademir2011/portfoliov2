import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:portfoliov2/app/modules/portfolio/portfolio_module.dart';

void main() {
  setUp(() {
    initModule(PortfolioModule());
  });
}
