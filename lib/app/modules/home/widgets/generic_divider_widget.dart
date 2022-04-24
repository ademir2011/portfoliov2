import 'package:flutter/material.dart';

class GenericDividerWidget extends StatelessWidget {
  final double height;
  final double width;

  const GenericDividerWidget({
    Key? key,
    this.height = 1.5,
    this.width = 100,
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
