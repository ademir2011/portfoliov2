import 'package:flutter/material.dart';

class VideoTemplateWidget extends StatelessWidget {
  final double width;
  final double height;

  const VideoTemplateWidget({
    Key? key,
    this.width = 300,
    this.height = 600,
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
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.tertiary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                blurRadius: 10,
              ),
              BoxShadow(
                color: Theme.of(context).colorScheme.tertiary,
                blurRadius: 5,
              ),
            ],
          ),
        ),
        Container(
          width: width - 2.5,
          height: height - 2.5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(.5),
              ),
              BoxShadow(
                color: Theme.of(context).scaffoldBackgroundColor,
                blurRadius: 10,
                spreadRadius: -2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
