import 'package:flutter/material.dart';

class DialogTemplateWidget extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;

  const DialogTemplateWidget({
    Key? key,
    this.child,
    this.width = 403,
    this.height = 403,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.tertiary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Container(
          width: width - 3,
          height: height - 3,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: child,
        ),
      ],
    );
  }
}
