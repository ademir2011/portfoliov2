import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String title;
  const TagWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
