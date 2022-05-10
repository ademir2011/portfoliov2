import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool enabled;
  final TextEditingController? controller;
  final bool textArea;

  const TextFormFieldWidget({
    Key? key,
    this.hintText = '',
    this.isPassword = false,
    this.controller,
    this.enabled = true,
    this.textArea = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: isPassword
              ? TextFormField(
                  controller: controller,
                  enabled: enabled,
                  style: Theme.of(context).textTheme.bodyMedium,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    hintText: hintText,
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                )
              : TextFormField(
                  controller: controller,
                  enabled: enabled,
                  maxLines: textArea ? 15 : null,
                  style: Theme.of(context).textTheme.bodyMedium,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    hintText: hintText,
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
