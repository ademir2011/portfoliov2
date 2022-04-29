import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  const TextFormFieldWidget(hintText: 'Senha'),
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
                        title: 'CADASTRAR',
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OutlinedButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final bool secondary;
  const OutlinedButtonWidget({
    Key? key,
    this.onPressed,
    this.title = '',
    this.secondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(
            width: 1,
            color: secondary
                ? Theme.of(context).colorScheme.primary.withOpacity(.5)
                : Theme.of(context).colorScheme.primary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: secondary
              ? Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5),
                  )
              : Theme.of(context).textTheme.bodySmall,
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;

  const TextFormFieldWidget({
    Key? key,
    this.hintText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 50,
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
          margin: const EdgeInsets.symmetric(horizontal: 1),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
