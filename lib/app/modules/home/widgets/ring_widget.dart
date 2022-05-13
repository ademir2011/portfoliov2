import 'package:flutter/material.dart';

class RingWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  const RingWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width + 5,
          height: height + 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.tertiary,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                blurRadius: 7.5,
              ),
              BoxShadow(
                color: Theme.of(context).colorScheme.tertiary,
                blurRadius: 2.5,
              ),
            ],
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(.5),
              ),
              BoxShadow(
                color: Theme.of(context).scaffoldBackgroundColor,
                blurRadius: 4,
                spreadRadius: -3,
              ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
