import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/widgets/tag_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/widgets/video_template_widget.dart';
import 'package:portfoliov2/shared/icon_link_widget.dart';
import 'package:portfoliov2/shared/template_widget.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateWidget(
      title: 'PROJETOS',
      backButtonOnPress: () => Modular.to.navigate('/portfolio'),
      child: Row(
        children: [
          SizedBox(
            width: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WHALLET',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 5),
                const GenericDividerWidget(width: 75),
                const SizedBox(height: 25),
                SizedBox(
                  height: 300,
                  child: Text(
                    'Lorem Ipsum is simply dum' * 50,
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
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(right: 50),
            child: VideoTemplateWidget(
              height: 500,
              width: 275,
            ),
          ),
        ],
      ),
    );
  }
}
