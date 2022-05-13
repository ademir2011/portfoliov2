import 'package:flutter/material.dart';

class ProjectButtonWidget extends StatefulWidget {
  final String? title;
  final void Function() onTap;
  final IconData? icon;
  final String? urlThumbnail;
  const ProjectButtonWidget({
    Key? key,
    this.title,
    required this.onTap,
    this.urlThumbnail,
    this.icon,
  }) : super(key: key);

  @override
  State<ProjectButtonWidget> createState() => _ProjectButtonWidgetState();
}

class _ProjectButtonWidgetState extends State<ProjectButtonWidget> {
  var isHoved = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hoved) {
        setState(() {
          isHoved = hoved;
        });
      },
      borderRadius: BorderRadius.circular(25),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 325),
        curve: Curves.linear,
        decoration: isHoved
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(.20),
                    blurRadius: 7.5,
                    spreadRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                  BoxShadow(
                    color: Theme.of(context).colorScheme.tertiary.withOpacity(.20),
                    blurRadius: 3.5,
                    spreadRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
        width: isHoved ? 325 : 300,
        height: isHoved ? 200 : 175,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 325),
              curve: Curves.linear,
              width: isHoved ? 324 : 299,
              height: isHoved ? 199 : 174,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  'https://cdn.dribbble.com/users/7073797/screenshots/15509388/a00b9c20-b6b1-4fb9-9bb8-d69764322182_4x.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 325),
              curve: Curves.linear,
              width: isHoved ? 325 : 300,
              height: isHoved ? 200 : 175,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(.3),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: widget.icon != null
                  ? Icon(widget.icon)
                  : Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        widget.title ?? '',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
