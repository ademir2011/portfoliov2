import 'package:flutter/material.dart';

class GenericDividerWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool vertical;

  const GenericDividerWidget({
    Key? key,
    this.height = 1.5,
    this.width = 100,
    this.vertical = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
          ],
          begin: vertical ? Alignment.topCenter : Alignment.centerLeft,
          end: vertical ? Alignment.bottomCenter : Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(.5),
            blurRadius: 10,
          )
        ],
      ),
    );
  }
}
