import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_state.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_bloc.dart';
import 'package:portfoliov2/shared/widgets/dialog_template_widget.dart';
import 'package:portfoliov2/shared/widgets/outlined_button_widget.dart';

class RemovePortfolioDialogPage extends StatefulWidget {
  final Portfolio portfolio;

  RemovePortfolioDialogPage({
    Key? key,
    required this.portfolio,
  }) : super(key: key);

  @override
  State<RemovePortfolioDialogPage> createState() => _RemovePortfolioDialogPageState();
}

class _RemovePortfolioDialogPageState extends State<RemovePortfolioDialogPage> {
  final portfolioBloc = Modular.get<PortfolioBloc>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: DialogTemplateWidget(
        child: BlocBuilder(
          bloc: portfolioBloc,
          builder: (ctx, state) {
            if (state is SuccessRemovePortfolioState) Modular.to.pushNamedAndRemoveUntil('/portfolio/', (_) => true);

            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TEM CERTEZA QUE DESEJA REMOVER O PORTFOLIO ?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Text(
                    (state is ErrorPortfolioState) ? state.message : '',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).errorColor,
                        ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButtonWidget(
                        title: 'NÂO',
                        onPressed: () => Modular.to.pop(),
                        secondary: true,
                      ),
                      OutlinedButtonWidget(
                        title: 'SIM',
                        isLoading: (state is LoadingPortfolioState),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            portfolioBloc.add(RemovePortfolioEvent(portfolio: widget.portfolio));
                            Modular.to.pushNamedAndRemoveUntil('/portfolio/', (_) => true);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
    );
  }
}
