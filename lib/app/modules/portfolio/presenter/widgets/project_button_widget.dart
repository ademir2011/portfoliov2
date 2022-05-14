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
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.tertiary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
        width: isHoved ? 330 : 300,
        height: isHoved ? 205 : 175,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 325),
              curve: Curves.linear,
              width: isHoved ? 324 : 299,
              height: isHoved ? 199 : 174,
              decoration: widget.urlThumbnail == null
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )
                  : null,
              child: widget.urlThumbnail != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        widget.urlThumbnail!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
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
                  ? Align(alignment: Alignment.center, child: Icon(widget.icon))
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
