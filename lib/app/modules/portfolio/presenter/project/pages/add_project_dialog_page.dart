import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_state.dart';
import 'package:portfoliov2/shared/widgets/dialog_template_widget.dart';
import 'package:portfoliov2/shared/widgets/outlined_button_widget.dart';
import 'package:portfoliov2/shared/widgets/textformfield_widget.dart';

class AddProjectDialogPage extends StatefulWidget {
  final projectBloc = Modular.get<ProjectBloc>();
  final formKey = GlobalKey<FormState>();
  final Portfolio portfolio;

  AddProjectDialogPage({
    Key? key,
    required this.portfolio,
  }) : super(key: key);

  @override
  State<AddProjectDialogPage> createState() => _AddProjectDialogPageState();
}

class _AddProjectDialogPageState extends State<AddProjectDialogPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final githubController = TextEditingController();
  final playstoreController = TextEditingController();
  final figmaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: DialogTemplateWidget(
        height: 700,
        child: BlocBuilder(
          bloc: widget.projectBloc,
          builder: (ctx, state) {
            if (state is SuccessSaveProjectState) Modular.to.pushNamedAndRemoveUntil('/portfolio/', (_) => true);

            return Form(
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CADASTRAR PROJETO',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  TextFormFieldWidget(
                    enabled: false,
                    hintText: widget.portfolio.title,
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    hintText: 'Nome do projeto',
                    controller: titleController,
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    hintText: 'Descrição do projeto',
                    controller: descriptionController,
                    textArea: true,
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    hintText: 'Github',
                    controller: githubController,
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    hintText: 'Playstore',
                    controller: playstoreController,
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    hintText: 'Figma',
                    controller: figmaController,
                  ),
                  const Spacer(),
                  Text(
                    (state is ErrorProjectState) ? state.message : '',
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
                        isLoading: (state is LoadingProjectState),
                        onPressed: () {
                          if (widget.formKey.currentState!.validate()) {
                            widget.projectBloc.add(
                              SaveProjectEvent(
                                project: Project(
                                  portfolioId: widget.portfolio.id,
                                  name: titleController.text,
                                  description: descriptionController.text,
                                  socialNetwoksUrl: <String>[
                                    githubController.text,
                                    playstoreController.text,
                                    figmaController.text,
                                  ],
                                ),
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
