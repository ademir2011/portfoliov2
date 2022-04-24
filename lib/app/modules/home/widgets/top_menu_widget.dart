import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';

class TopMenuWidget extends StatelessWidget {
  const TopMenuWidget({
    Key? key,
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
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: GenericDividerWidget(width: 50),
              ),
            ],
          ),
          const SizedBox(width: 40),
          TextButton(
            onPressed: null,
            child: Text(
              'DASHBOARD',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  ),
            ),
          ),
          const SizedBox(width: 40),
          TextButton(
            onPressed: () {},
            child: Text(
              'PROJETOS',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(width: 40),
          TextButton(
            onPressed: null,
            child: Text(
              'TRAJETÓRIA',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  ),
            ),
          ),
          const SizedBox(width: 40),
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
    );
  }
}
