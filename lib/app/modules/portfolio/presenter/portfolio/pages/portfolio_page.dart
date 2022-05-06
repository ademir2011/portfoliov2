import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_bloc.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_state.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/pages/add_portfolio_dialog_page.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_state.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/pages/add_project_dialog_page.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/widgets/projects_group_button_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/pages/update_portfolio_dialog_page.dart';
import 'package:portfoliov2/shared/widgets/template_widget.dart';
import 'package:portfoliov2/shared/widgets/top_menu_widget.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final portfolioBloc = Modular.get<PortfolioBloc>();
  final authBloc = Modular.get<AuthBloc>();
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      portfolioBloc.add(FetchPortfolioEvent());
    });
  }

  void _updatePortfolioDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return UpdatePortfolioDialogPage(
          formKey: formKey,
          titleController: titleController,
          portfolioBloc: portfolioBloc,
        );
      },
    );
  }

  void _removePortfolioDialog() {
    showDialog(
      context: context,
      builder: (context) {
        // return RemovePortfolioDialogPage(
        //   formKey: formKey,
        //   titleController: titleController,
        //   portfolioBloc: portfolioBloc,
        // );
        return Container();
      },
    );
  }

  void _addPortfolioDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AddPortfolioDialogPage(
          formKey: formKey,
          titleController: titleController,
          portfolioBloc: portfolioBloc,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userLogged = authBloc.isLogged();
    return TemplateWidget(
      topMenuEnum: TopMenuEnum.projetos,
      title: 'PROJETOS',
      addOnPressed: userLogged ? () => _addPortfolioDialog() : null,
      editOnPressed: userLogged ? () => _updatePortfolioDialog() : null,
      removeOnPressed: userLogged ? () => _removePortfolioDialog() : null,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: BlocBuilder<PortfolioBloc, PortfolioState>(
          bloc: portfolioBloc,
          builder: (ctx, state) {
            if (state is LoadingPortfolioState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is SuccessPortfolioState) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.portfolios.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.portfolios[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 5),
                      const GenericDividerWidget(
                        width: 60,
                      ),
                      const SizedBox(height: 25),
                      ProjectsGroupButtonWidget(
                        portfolio: state.portfolios[index],
                      ),
                      const SizedBox(height: 25),
                    ],
                  );
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
