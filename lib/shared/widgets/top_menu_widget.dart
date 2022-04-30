import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';

enum TopMenuEnum { inicio, dashboard, projetos, trajetoria, certificacoes, administracao }

class TopMenuWidget extends StatelessWidget {
  final TopMenuEnum topMenuEnum;
  const TopMenuWidget({
    Key? key,
    required this.topMenuEnum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => Modular.to.navigate('/'),
                child: Text(
                  'INÍCIO',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (topMenuEnum == TopMenuEnum.inicio)
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: GenericDividerWidget(width: 50),
                ),
            ],
          ),
          const SizedBox(width: 40),
          Column(
            children: [
              TextButton(
                onPressed: null,
                child: Text(
                  'DASHBOARD',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => Modular.to.navigate('/portfolio/'),
                child: Text(
                  'PROJETOS',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (topMenuEnum == TopMenuEnum.projetos)
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: GenericDividerWidget(width: 75),
                ),
            ],
          ),
          const SizedBox(width: 40),
          Column(
            children: [
              TextButton(
                onPressed: null,
                child: Text(
                  'TRAJETÓRIA',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 40),
          Column(
            children: [
              TextButton(
                onPressed: null,
                child: Text(
                  'CERTIFICAÇÕES',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => Modular.to.navigate('/administracao/'),
                child: Text(
                  'ADMINISTRAÇÃO',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (topMenuEnum == TopMenuEnum.administracao)
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: GenericDividerWidget(width: 75),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
