import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/app/modules/home/widgets/ring_widget.dart';
import 'package:portfoliov2/shared/widgets/top_menu_widget.dart';
import 'package:portfoliov2/shared/widgets/icon_link_widget.dart';

class TemplateWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final bool subtemplate;
  final TopMenuEnum topMenuEnum;
  final void Function()? backButtonOnPress;
  final bool centered;
  const TemplateWidget({
    Key? key,
    required this.child,
    required this.topMenuEnum,
    this.title = '',
    this.subtemplate = true,
    this.backButtonOnPress,
    this.centered = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          if (size.width > 1000) TopMenuWidget(topMenuEnum: topMenuEnum),
          if (subtemplate && size.width > 1000)
            SingleChildScrollView(
              child: SubTemplateWidget(
                backButtonOnPress: backButtonOnPress,
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

class SandwichIconMenuWidget extends StatelessWidget {
  final String title;
  final void Function()? backButtonOnPress;
  const SandwichIconMenuWidget({
    Key? key,
    required this.title,
    required this.backButtonOnPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Modular.to.pushNamed('/sidemenu'),
            icon: const ImageIcon(
              AssetImage('lib\\assets\\icons\\sidemenuicon.png'),
            ),
            iconSize: 55,
            color: Theme.of(context).colorScheme.primary,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  if (backButtonOnPress != null)
                    TextButton(
                      onPressed: backButtonOnPress,
                      child: Text(
                        '<',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const GenericDividerWidget(width: 50),
            ],
          ),
        ],
      ),
    );
  }
}

class SubTemplateWidget extends StatelessWidget {
  const SubTemplateWidget({
    Key? key,
    required this.backButtonOnPress,
    required this.title,
    required this.child,
  }) : super(key: key);

  final void Function()? backButtonOnPress;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SidePerfilWidget(),
        const Padding(
          padding: EdgeInsets.only(top: 100),
          child: GenericDividerWidget(
            width: 1.5,
            height: 600,
            vertical: true,
          ),
        ),
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
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const GenericDividerWidget(width: 300),
              child,
            ],
          ),
        ),
      ],
    );
  }
}

class SidePerfilWidget extends StatelessWidget {
  const SidePerfilWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          const SizedBox(height: 50),
          RingWidget(
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'lib\\assets\\images\\eu.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 150),
          Text(
            'ADEMIR',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 15),
          const GenericDividerWidget(width: 100),
          const SizedBox(height: 15),
          Text(
            'DESENVOLVEDOR\nFLUTTER',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconLinkWidget(
                onPressed: () {},
                color: const Color(0xffE95950),
                pathAssetIcon: 'lib\\assets\\icons\\instagram.png',
              ),
              IconLinkWidget(
                onPressed: () {},
                color: const Color(0xff0981CC),
                pathAssetIcon: 'lib\\assets\\icons\\linkedin.png',
              ),
              IconLinkWidget(
                onPressed: () {},
                color: const Color(0xffE5E5E5),
                pathAssetIcon: 'lib\\assets\\icons\\github.png',
              ),
            ],
          )
        ],
      ),
    );
  }
}
