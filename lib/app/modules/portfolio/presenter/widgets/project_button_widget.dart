import 'package:flutter/material.dart';

class ProjectButtonWidget extends StatelessWidget {
  final String? title;
  final void Function() onTap;
  final IconData? icon;
  const ProjectButtonWidget({
    Key? key,
    this.title,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: icon != null
                ? Icon(icon)
                : Text(
                    title ?? '',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }
}
