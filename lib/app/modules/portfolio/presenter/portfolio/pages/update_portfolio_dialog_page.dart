import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/portfolio/bloc/portfolio_event.dart';
import 'package:portfoliov2/shared/widgets/dialog_template_widget.dart';
import 'package:portfoliov2/shared/widgets/outlined_button_widget.dart';
import 'package:portfoliov2/shared/widgets/textformfield_widget.dart';

class UpdatePortfolioDialogPage extends StatelessWidget {
  const UpdatePortfolioDialogPage({
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
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EDITAR PORTFOLIO',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              TextFormFieldWidget(
                hintText: 'Nome',
                controller: titleController,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButtonWidget(
                    title: 'VOLTAR',
                    onPressed: () => Modular.to.navigate('/'),
                    secondary: true,
                  ),
                  OutlinedButtonWidget(
                    title: 'ATUALIZAR',
                    isLoading: false,
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
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
    );
  }
}
