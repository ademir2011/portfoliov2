import 'package:flutter/material.dart';

class ProjectButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const ProjectButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.surfaceVariant.withOpacity(.3),
              Theme.of(context).colorScheme.tertiary.withOpacity(.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
