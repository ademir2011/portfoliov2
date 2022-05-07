import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_state.dart';
import 'package:portfoliov2/shared/widgets/dialog_template_widget.dart';
import 'package:portfoliov2/shared/widgets/outlined_button_widget.dart';

class RemoveProjectDialogPage extends StatefulWidget {
  final projectBloc = Modular.get<ProjectBloc>();
  final formKey = GlobalKey<FormState>();
  final Project project;

  RemoveProjectDialogPage({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<RemoveProjectDialogPage> createState() => _RemoveProjectDialogPageState();
}

class _RemoveProjectDialogPageState extends State<RemoveProjectDialogPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: DialogTemplateWidget(
        child: BlocBuilder(
          bloc: widget.projectBloc,
          builder: (ctx, state) {
            if (state is SuccessRemoveProjectState) Modular.to.pushNamedAndRemoveUntil('/portfolio/', (_) => true);

            return Form(
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TEM CERTEZA QUE DESEJA REMOVER O PROJETO ?',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                        title: 'NÂO',
                        onPressed: () => Modular.to.pop(),
                        secondary: true,
                      ),
                      OutlinedButtonWidget(
                        title: 'SIM',
                        isLoading: (state is LoadingProjectState),
                        onPressed: () {
                          if (widget.formKey.currentState!.validate()) {
                            widget.projectBloc.add(RemoveProjectEvent(project: widget.project));
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
