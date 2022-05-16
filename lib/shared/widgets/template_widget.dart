import 'package:flutter/material.dart';
import 'package:portfoliov2/shared/widgets/background_widget.dart';
import 'package:portfoliov2/shared/widgets/icon_link_widget.dart';
import 'package:portfoliov2/shared/widgets/sandwich_icon_menu_widget.dart';
import 'package:portfoliov2/shared/widgets/sub_template_widget.dart';
import 'package:portfoliov2/shared/widgets/top_menu_widget.dart';
import 'dart:html' as html;

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
      body: Stack(
        children: [
          const BackgroundWidget(),
          Column(
            children: [
              if (size.width > 1000) TopMenuWidget(topMenuEnum: topMenuEnum),
              if (subtemplate && size.width > 1000)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: SubTemplateWidget(
                      backButtonOnPress: backButtonOnPress,
                      addOnPressed: addOnPressed,
                      editOnPressed: editOnPressed,
                      removeOnPressed: removeOnPressed,
                      title: title,
                      child: child,
                    ),
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
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconLinkWidget(
                    onPressed: () => html.window.open('https://www.instagram.com/ademir.bezerra/', "_blank"),
                    color: const Color(0xffE95950),
                    pathAssetIcon: 'lib\\assets\\icons\\instagram.png',
                  ),
                  const SizedBox(height: 35),
                  IconLinkWidget(
                    onPressed: () => html.window.open('https://www.linkedin.com/in/ademir-bezerra/', "_blank"),
                    color: const Color(0xff0981CC),
                    pathAssetIcon: 'lib\\assets\\icons\\linkedin.png',
                  ),
                  const SizedBox(height: 35),
                  IconLinkWidget(
                    onPressed: () => html.window.open('https://github.com/ademir2011/', "_blank"),
                    color: const Color(0xffE5E5E5),
                    pathAssetIcon: 'lib\\assets\\icons\\github.png',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
