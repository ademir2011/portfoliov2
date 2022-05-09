import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_state.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/pages/add_project_dialog_page.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/widgets/project_button_widget.dart';

class ProjectsGroupButtonWidget extends StatefulWidget {
  final Portfolio portfolio;
  const ProjectsGroupButtonWidget({
    Key? key,
    required this.portfolio,
  }) : super(key: key);

  @override
  State<ProjectsGroupButtonWidget> createState() => _ProjectsGroupButtonWidgetState();
}

class _ProjectsGroupButtonWidgetState extends State<ProjectsGroupButtonWidget> {
  final projectBloc = Modular.get<ProjectBloc>();
  final authBloc = Modular.get<AuthBloc>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      projectBloc.add(GetProjectsByPortfolioEvent(portfolio: widget.portfolio));
    });
  }

  void _addProjectDialog({required Portfolio portfolio}) {
    showDialog(
      context: context,
      builder: (context) {
        return AddProjectDialogPage(
          portfolio: portfolio,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      bloc: projectBloc,
      builder: (ctx, state) {
        if (state is LoadingProjectState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SuccessProjectState) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...state.projects.map((project) {
                  return Row(
                    children: [
                      ProjectButtonWidget(
                        title: project.name.toString(),
                        onTap: () => Modular.to.navigate('/portfolio/project/${project.id}'),
                      ),
                      const SizedBox(width: 20),
                    ],
                  );
                }).toList(),
                if (state.projects.isEmpty)
                  ProjectButtonWidget(
                    title: 'Não há projetos cadastrados nessa categoria.',
                    onTap: () {},
                  ),
                if (state.projects.isEmpty) const SizedBox(width: 25),
                if (authBloc.isLogged())
                  ProjectButtonWidget(
                    icon: Icons.add,
                    onTap: () => _addProjectDialog(portfolio: widget.portfolio),
                  ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
