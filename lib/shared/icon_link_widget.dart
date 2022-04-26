import 'package:flutter/material.dart';

class IconLinkWidget extends StatelessWidget {
  final Color color;
  final String pathAssetIcon;
  final void Function() onPressed;
  const IconLinkWidget({
    Key? key,
    required this.pathAssetIcon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
          // color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: color),
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 6,
            ),
            BoxShadow(
              color: Theme.of(context).scaffoldBackgroundColor,
              blurRadius: 5,
              spreadRadius: -2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset(
            pathAssetIcon,
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}
