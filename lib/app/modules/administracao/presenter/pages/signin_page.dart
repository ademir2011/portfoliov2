import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/shared/widgets/template_widget.dart';
import 'package:portfoliov2/shared/widgets/top_menu_widget.dart';
import 'package:portfoliov2/shared/widgets/outlined_button_widget.dart';
import 'package:portfoliov2/shared/widgets/textformfield_widget.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateWidget(
      topMenuEnum: TopMenuEnum.administracao,
      subtemplate: false,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 403,
            height: 403,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            width: 400,
            height: 400,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AUTENTICAR',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                const TextFormFieldWidget(hintText: 'E-mail'),
                const SizedBox(height: 25),
                const TextFormFieldWidget(
                  hintText: 'Senha',
                  isPassword: true,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButtonWidget(
                      title: 'VOLTAR',
                      onPressed: () => Modular.to.navigate('/'),
                      secondary: true,
                    ),
                    OutlinedButtonWidget(
                      title: 'ACESSAR',
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
