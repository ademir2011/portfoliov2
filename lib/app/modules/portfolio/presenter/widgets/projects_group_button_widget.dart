import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_state.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      projectBloc.add(GetProjectsByPortfolioEvent(portfolio: widget.portfolio));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      bloc: projectBloc,
      builder: (ctx, state) {
        if (state is LoadingProjectState) {
          return const Center(child: CircularProgressIndicator());
        }

        return Row(
          children: [
            ProjectButtonWidget(
              title: 'WHALLET',
              onTap: () => Modular.to.navigate('/portfolio/project'),
            ),
          ],
        );
      },
    );
  }
}
