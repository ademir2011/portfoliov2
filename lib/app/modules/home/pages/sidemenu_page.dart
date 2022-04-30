import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/shared/widgets/top_menu_widget.dart';

class SidemenuPage extends StatefulWidget {
  final TopMenuEnum topMenuEnum;
  const SidemenuPage({
    Key? key,
    required this.topMenuEnum,
  }) : super(key: key);

  @override
  State<SidemenuPage> createState() => _SidemenuPageState();
}

class _SidemenuPageState extends State<SidemenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 60, top: 40),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => Modular.to.pop(),
                icon: const ImageIcon(
                  AssetImage('lib\\assets\\icons\\exiticon.png'),
                ),
                iconSize: 65,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Modular.to.navigate('/'),
                  child: Text(
                    'INÍCIO',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (widget.topMenuEnum == TopMenuEnum.inicio) const GenericDividerWidget(width: 50),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'DASHBOARD',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                        ),
                  ),
                ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: () => Modular.to.navigate('/portfolio/'),
                  child: Text(
                    'PROJETOS',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (widget.topMenuEnum == TopMenuEnum.projetos) const GenericDividerWidget(width: 75),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'TRAJETÓRIA',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                        ),
                  ),
                ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'CERTIFICAÇÕES',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
