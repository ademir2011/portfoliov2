import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/pages/remove_project_dialog_page.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/widgets/tag_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/widgets/video_template_widget.dart';
import 'package:portfoliov2/shared/widgets/icon_link_widget.dart';
import 'package:portfoliov2/shared/widgets/template_widget.dart';
import 'package:portfoliov2/shared/widgets/top_menu_widget.dart';

class ProjectPage extends StatefulWidget {
  final Project project;
  const ProjectPage({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  void _removeProjectDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return RemoveProjectDialogPage(
          project: widget.project,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TemplateWidget(
      title: 'PROJETOS',
      topMenuEnum: TopMenuEnum.projetos,
      removeOnPressed: _removeProjectDialog,
      backButtonOnPress: () => Modular.to.navigate('/portfolio/'),
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: size.width > 1000
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ContentWidget(
                      project: widget.project,
                    ),
                  ),
                  const SizedBox(width: 25),
                  const VideoTemplateWidget(height: 500, width: 275),
                ],
              )
            : Column(
                children: [
                  ContentWidget(project: widget.project),
                  const SizedBox(height: 25),
                  const VideoTemplateWidget(height: 500, width: 275),
                  const SizedBox(height: 25),
                ],
              ),
      ),
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
          height: 300,
          width: 700,
          child: Text(
            project.description.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 50),
        const TagWidget(
          title: 'BLOC',
        ),
        const SizedBox(height: 30),
        IconLinkWidget(
          onPressed: () {},
          color: Theme.of(context).colorScheme.surfaceVariant,
          pathAssetIcon: 'lib\\assets\\icons\\play-store.png',
        ),
      ],
    );
  }
}
