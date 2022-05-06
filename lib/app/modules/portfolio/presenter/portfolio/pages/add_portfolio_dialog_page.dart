import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_state.dart';
import 'package:portfoliov2/shared/widgets/dialog_template_widget.dart';
import 'package:portfoliov2/shared/widgets/outlined_button_widget.dart';
import 'package:portfoliov2/shared/widgets/textformfield_widget.dart';

class AddPortfolioDialogPage extends StatelessWidget {
  const AddPortfolioDialogPage({
    Key? key,
    required this.formKey,
    required this.titleController,
    required this.portfolioBloc,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final PortfolioBloc portfolioBloc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: DialogTemplateWidget(
        child: BlocBuilder(
          bloc: portfolioBloc,
          builder: (ctx, state) {
            if (state is SuccessSavePortfolioState) Modular.to.pushNamedAndRemoveUntil('/portfolio/', (_) => true);

            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CADASTRAR PORTFOLIO',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  TextFormFieldWidget(
                    hintText: 'Nome',
                    controller: titleController,
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
                        title: 'VOLTAR',
                        onPressed: () => Modular.to.pushNamedAndRemoveUntil('/portfolio/', (_) => true),
                        secondary: true,
                      ),
                      OutlinedButtonWidget(
                        title: 'CADASTRAR',
                        isLoading: (state is LoadingPortfolioState),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            portfolioBloc.add(
                              SavePortfolioEvent(
                                portfolio: Portfolio(title: titleController.text),
                              ),
                            );
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
