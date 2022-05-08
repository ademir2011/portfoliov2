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

class UpdatePortfolioDialogPage extends StatefulWidget {
  UpdatePortfolioDialogPage({
    Key? key,
    required this.portfolio,
  }) : super(key: key);

  final Portfolio portfolio;

  @override
  State<UpdatePortfolioDialogPage> createState() => _UpdatePortfolioDialogPageState();
}

class _UpdatePortfolioDialogPageState extends State<UpdatePortfolioDialogPage> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();

  final portfolioBloc = Modular.get<PortfolioBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      titleController.text = widget.portfolio.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: DialogTemplateWidget(
        child: BlocBuilder(
          bloc: portfolioBloc,
          builder: (ctx, state) {
            if (state is SuccessUpdatePortfolioState) Modular.to.pushNamedAndRemoveUntil('/portfolio/', (_) => true);

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
                        onPressed: () => Modular.to.pop(),
                        secondary: true,
                      ),
                      OutlinedButtonWidget(
                        title: 'ATUALIZAR',
                        isLoading: (state is LoadingPortfolioState),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            widget.portfolio.title = titleController.text;
                            portfolioBloc.add(
                              UpdatePortfolioEvent(
                                portfolio: widget.portfolio,
                              ),
                            );
                            Modular.to.navigate('/portfolio/');
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
