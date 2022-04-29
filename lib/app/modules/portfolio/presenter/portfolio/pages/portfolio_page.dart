import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_state.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/widgets/projects_group_button_widget.dart';
import 'package:portfoliov2/shared/template_widget.dart';
import 'package:portfoliov2/shared/top_menu_widget.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final portfolioBloc = Modular.get<PortfolioBloc>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      portfolioBloc.add(FetchPortfolioEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return TemplateWidget(
      topMenuEnum: TopMenuEnum.projetos,
      title: 'PROJETOS',
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
        child: BlocBuilder<PortfolioBloc, PortfolioState>(
          bloc: portfolioBloc,
          builder: (ctx, state) {
            if (state is LoadingPortfolioState) {
              return const CircularProgressIndicator();
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
