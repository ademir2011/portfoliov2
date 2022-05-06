import 'package:flutter/material.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/shared/widgets/side_perfil_widget.dart';

class SubTemplateWidget extends StatelessWidget {
  const SubTemplateWidget({
    Key? key,
    required this.backButtonOnPress,
    this.addOnPressed,
    this.editOnPressed,
    this.removeOnPressed,
    required this.title,
    required this.child,
  }) : super(key: key);

  final void Function()? backButtonOnPress;
  final String title;
  final Widget child;
  final void Function()? addOnPressed;
  final void Function()? editOnPressed;
  final void Function()? removeOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SidePerfilWidget(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 63),
              Padding(
                padding: EdgeInsets.only(left: backButtonOnPress != null ? 0 : 40),
                child: Row(
                  children: [
                    if (backButtonOnPress != null)
                      SizedBox(
                        width: 40,
                        child: TextButton(
                          onPressed: backButtonOnPress,
                          child: Text(
                            '<',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(width: 25),
                    if (addOnPressed != null)
                      IconButtonWidget(
                        icon: Icons.add,
                        onPressed: addOnPressed,
                      ),
                    const SizedBox(width: 25),
                    if (editOnPressed != null)
                      IconButtonWidget(
                        icon: Icons.edit,
                        onPressed: editOnPressed,
                      ),
                    const SizedBox(width: 25),
                    if (removeOnPressed != null)
                      IconButtonWidget(
                        icon: Icons.delete,
                        onPressed: removeOnPressed,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const GenericDividerWidget(width: 250),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GenericDividerWidget(
                    width: 1.5,
                    height: 600,
                    vertical: true,
                  ),
                  Expanded(child: child),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  const IconButtonWidget({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
            Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
        ),
      ),
    );
  }
}
