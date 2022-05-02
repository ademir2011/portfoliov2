import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String title;
  final bool secondary;
  final bool isLoading;
  const OutlinedButtonWidget({
    Key? key,
    this.onPressed,
    this.title = '',
    this.secondary = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<OutlinedButtonWidget> createState() => _OutlinedButtonWidgetState();
}

class _OutlinedButtonWidgetState extends State<OutlinedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(
            width: 1,
            color: widget.secondary
                ? Theme.of(context).colorScheme.primary.withOpacity(.5)
                : Theme.of(context).colorScheme.primary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: widget.isLoading
            ? const SizedBox(height: 15, width: 15, child: CircularProgressIndicator())
            : Text(
                widget.title,
                style: widget.secondary
                    ? Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5),
                        )
                    : Theme.of(context).textTheme.bodySmall,
              ),
      ),
      onPressed: widget.onPressed,
    );
  }
}
