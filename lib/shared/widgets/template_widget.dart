import 'package:flutter/material.dart';
import 'package:portfoliov2/shared/widgets/sandwich_icon_menu_widget.dart';
import 'package:portfoliov2/shared/widgets/sub_template_widget.dart';
import 'package:portfoliov2/shared/widgets/top_menu_widget.dart';

class TemplateWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final bool subtemplate;
  final TopMenuEnum topMenuEnum;
  final void Function()? backButtonOnPress;
  final void Function()? addOnPressed;
  final void Function()? editOnPressed;
  final void Function()? removeOnPressed;
  final bool centered;
  const TemplateWidget({
    Key? key,
    required this.child,
    required this.topMenuEnum,
    this.title = '',
    this.subtemplate = true,
    this.backButtonOnPress,
    this.centered = true,
    this.addOnPressed,
    this.editOnPressed,
    this.removeOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (size.width > 1000) TopMenuWidget(topMenuEnum: topMenuEnum),
          if (subtemplate && size.width > 1000)
            SingleChildScrollView(
              child: SubTemplateWidget(
                backButtonOnPress: backButtonOnPress,
                addOnPressed: addOnPressed,
                editOnPressed: editOnPressed,
                removeOnPressed: removeOnPressed,
                title: title,
                child: child,
              ),
            ),
          if (size.width <= 1000)
            SandwichIconMenuWidget(
              title: title,
              backButtonOnPress: backButtonOnPress,
            ),
          if (!subtemplate || size.width <= 1000)
            Expanded(
              child: centered
                  ? Center(
                      child: SingleChildScrollView(child: child),
                    )
                  : SingleChildScrollView(child: child),
            ),
        ],
      ),
    );
  }
}
