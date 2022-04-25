import 'package:flutter/material.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/app/modules/home/widgets/ring_widget.dart';
import 'package:portfoliov2/app/modules/home/widgets/top_menu_widget.dart';

class TemplateWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const TemplateWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopMenuWidget(
            topMenuEnum: TopMenuEnum.projetos,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    RingWidget(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'lib\\assets\\images\\eu.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 150),
                    Text(
                      'ADEMIR',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 15),
                    const GenericDividerWidget(width: 100),
                    const SizedBox(height: 15),
                    Text(
                      'DESENVOLVEDOR\nFLUTTER',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: GenericDividerWidget(
                  width: 1.5,
                  height: 600,
                  vertical: true,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 63),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const GenericDividerWidget(
                    width: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 50),
                    child: child,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
