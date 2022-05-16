import 'package:flutter/material.dart';
import 'package:portfoliov2/shared/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/shared/widgets/template_widget.dart';
import 'package:portfoliov2/shared/widgets/top_menu_widget.dart';

class TrajectoryPage extends StatefulWidget {
  const TrajectoryPage({Key? key}) : super(key: key);

  @override
  State<TrajectoryPage> createState() => _TrajectoryPageState();
}

class _TrajectoryPageState extends State<TrajectoryPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TemplateWidget(
      topMenuEnum: TopMenuEnum.trajetoria,
      title: 'Trajetória',
      child: Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              SizedBox(
                height: 300,
                child: Row(
                  children: [
                    const SizedBox(width: 100),
                    TrajectoryItemWidget(),
                    const SizedBox(width: 200),
                    TrajectoryItemWidget(),
                    const SizedBox(width: 200),
                    TrajectoryItemWidget(),
                    const SizedBox(width: 200),
                    TrajectoryItemWidget(),
                  ],
                ),
              ),
              GenericDividerWidget(
                width: 2500,
              ),
              SizedBox(
                height: 300,
                child: Row(
                  children: [
                    const SizedBox(width: 400),
                    TrajectoryItemWidget(bottom: true),
                    const SizedBox(width: 200),
                    TrajectoryItemWidget(bottom: true),
                    const SizedBox(width: 200),
                    TrajectoryItemWidget(bottom: true),
                    const SizedBox(width: 200),
                    TrajectoryItemWidget(bottom: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrajectoryItemWidget extends StatelessWidget {
  final bool bottom;

  const TrajectoryItemWidget({
    Key? key,
    this.bottom = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (bottom)
                const GenericDividerWidget(
                  vertical: true,
                  inverse: true,
                  width: 1,
                  height: 50,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 5),
                child: Text(
                  'asdas',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const GenericDividerWidget(width: 150),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GenericDividerWidget(
                  vertical: true,
                  width: 1,
                  height: 280,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 35, bottom: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 400,
                        child: Text(
                          'xads das da 2d2' * 20,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Text(
                        'asdas',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
