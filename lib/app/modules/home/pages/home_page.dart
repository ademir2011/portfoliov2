import 'package:flutter/material.dart';

import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/app/modules/home/widgets/ring_widget.dart';
import 'package:portfoliov2/shared/template_widget.dart';
import 'package:portfoliov2/shared/top_menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return TemplateWidget(
      title: 'HOME',
      topMenuEnum: TopMenuEnum.inicio,
      subtemplate: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 125),
          RingWidget(
            width: 175,
            height: 175,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'lib\\assets\\images\\eu.jpg',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 125),
          Text(
            'ADEMIR',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 75),
          const GenericDividerWidget(width: 100),
          const SizedBox(height: 20),
          Text(
            'DESENVOLVEDOR\nFLUTTER',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
