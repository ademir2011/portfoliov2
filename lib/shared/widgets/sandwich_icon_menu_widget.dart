import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';

class SandwichIconMenuWidget extends StatelessWidget {
  final String title;
  final void Function()? backButtonOnPress;
  const SandwichIconMenuWidget({
    Key? key,
    required this.title,
    required this.backButtonOnPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Modular.to.pushNamed('/sidemenu'),
            icon: const ImageIcon(
              AssetImage('lib\\assets\\icons\\sidemenuicon.png'),
            ),
            iconSize: 55,
            color: Theme.of(context).colorScheme.primary,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  if (backButtonOnPress != null)
                    TextButton(
                      onPressed: backButtonOnPress,
                      child: Text(
                        '<',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const GenericDividerWidget(width: 50),
            ],
          ),
        ],
      ),
    );
  }
}
