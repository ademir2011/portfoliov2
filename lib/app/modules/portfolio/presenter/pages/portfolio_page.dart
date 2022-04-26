import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/widgets/project_button_widget.dart';
import 'package:portfoliov2/shared/template_widget.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateWidget(
      title: 'PROJETOS',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MOBILE',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const GenericDividerWidget(
            width: 60,
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              ProjectButtonWidget(
                title: 'WHALLET',
                onTap: () => Modular.to.navigate('/portfolio/project'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
