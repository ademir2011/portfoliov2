import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/repositories/project_repository_interface.dart';

abstract class IRemoveAllProjectsByPortfolioId {
  Future<void> removeAllProjectsByPortfolioId({required Portfolio portfolio});
}

class RemoveAllProjectByPortfolioId extends IRemoveAllProjectsByPortfolioId {
  final IProjectRepository iProjectRepository;

  RemoveAllProjectByPortfolioId({required this.iProjectRepository});

  @override
  Future<void> removeAllProjectsByPortfolioId({required Portfolio portfolio}) async {
    return await iProjectRepository.removeAllProjectsByPortfolioId(portfolio: portfolio);
  }
}
