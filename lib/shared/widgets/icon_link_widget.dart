import 'package:flutter/material.dart';

class IconLinkWidget extends StatefulWidget {
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
  State<IconLinkWidget> createState() => _IconLinkWidgetState();
}

class _IconLinkWidgetState extends State<IconLinkWidget> {
  var isHoved = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (hover) {
        setState(() {
          isHoved = hover;
        });
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: widget.color),
          boxShadow: [
            BoxShadow(
              color: widget.color,
              blurRadius: isHoved ? 15 : 6,
            ),
            BoxShadow(
              color: Theme.of(context).scaffoldBackgroundColor,
              blurRadius: 5,
              spreadRadius: -2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: Image.asset(
            widget.pathAssetIcon,
            height: 40,
            width: 40,
          ),
        ),
      ),
    );
  }
}
