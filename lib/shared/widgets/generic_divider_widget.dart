import 'package:flutter/material.dart';

class GenericDividerWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool vertical;
  final bool inverse;

  const GenericDividerWidget({
    Key? key,
    this.height = 1.5,
    this.width = 100,
    this.vertical = false,
    this.inverse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            inverse ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.secondary,
            inverse ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.tertiary,
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
