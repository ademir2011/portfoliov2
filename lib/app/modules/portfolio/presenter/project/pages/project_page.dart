import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_bloc.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_state.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/pages/remove_project_dialog_page.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/pages/update_project_dialog_page.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/widgets/video_template_widget.dart';
import 'package:portfoliov2/shared/widgets/icon_link_widget.dart';
import 'package:portfoliov2/shared/widgets/template_widget.dart';
import 'package:portfoliov2/shared/widgets/top_menu_widget.dart';
import 'dart:html' as html;

class ProjectPage extends StatefulWidget {
  final String projectId;
  const ProjectPage({
    Key? key,
    required this.projectId,
  }) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final projectBloc = Modular.get<ProjectBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      projectBloc.add(GetProjectByIdEvent(id: widget.projectId));
    });
  }

  void _removeProjectDialog({required Project project}) {
    showDialog(
      context: context,
      builder: (context) {
        return RemoveProjectDialogPage(
          project: project,
        );
      },
    );
  }

  void _updateProjectDialog({required Project project}) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateProjectDialogPage(
          project: project,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userLogged = Modular.get<AuthBloc>().isLogged();

    return BlocBuilder<ProjectBloc, ProjectState>(
      bloc: projectBloc,
      builder: (ctx, state) {
        if (state is LoadingProjectState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SuccessGetProjectByIdState) {
          return TemplateWidget(
            title: 'PROJETOS',
            topMenuEnum: TopMenuEnum.projetos,
            removeOnPressed: userLogged ? () => _removeProjectDialog(project: state.project) : null,
            editOnPressed: userLogged ? () => _updateProjectDialog(project: state.project) : null,
            backButtonOnPress: () => Modular.to.navigate('/portfolio/'),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: size.width > 1000
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 500,
                            child: ContentWidget(
                              project: state.project,
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
                        VideoTemplateWidget(height: 500, width: 350, urlVideo: state.project.urlVideo),
                      ],
                    )
                  : Column(
                      children: [
                        ContentWidget(project: state.project),
                        const SizedBox(height: 25),
                        VideoTemplateWidget(height: 500, width: 350, urlVideo: state.project.urlVideo),
                        const SizedBox(height: 25),
                      ],
                    ),
            ),
          );
        }

        return Container();
      },
    );
  }
}

class ContentWidget extends StatelessWidget {
  final Project project;
  const ContentWidget({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.name.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        const GenericDividerWidget(width: 75),
        const SizedBox(height: 25),
        SizedBox(
          height: 285,
          width: 700,
          child: Text(
            project.description.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 50),
        // const TagWidget(
        //   title: 'BLOC',
        // ),
        const SizedBox(height: 30),
        ...project.socialNetwoksUrl!.map(
          (url) {
            if (url.contains('github') || url.contains('figma') || url.contains('playstore')) {
              return IconLinkWidget(
                onPressed: () {
                  html.window.open(url, "_blank");
                },
                color: Theme.of(context).colorScheme.primary,
                pathAssetIcon: url.contains('playstore')
                    ? 'lib\\assets\\icons\\play-store.png'
                    : url.contains('github')
                        ? 'lib\\assets\\icons\\github.png'
                        : 'lib\\assets\\icons\\figma.png',
              );
            }

            return Container();
          },
        ).toList(),
      ],
    );
  }
}
