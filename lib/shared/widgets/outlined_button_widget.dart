import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final bool secondary;
  const OutlinedButtonWidget({
    Key? key,
    this.onPressed,
    this.title = '',
    this.secondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(
            width: 1,
            color: secondary
                ? Theme.of(context).colorScheme.primary.withOpacity(.5)
                : Theme.of(context).colorScheme.primary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: secondary
              ? Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5),
                  )
              : Theme.of(context).textTheme.bodySmall,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
