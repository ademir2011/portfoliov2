import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_bloc.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_event.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_state.dart';
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
  final authBloc = Modular.get<AuthBloc>();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            child: Form(
              key: formKey,
              child: BlocBuilder<AuthBloc, AuthState>(
                bloc: authBloc,
                builder: (ctx, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AUTENTICAR',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                      TextFormFieldWidget(
                        hintText: 'E-mail',
                        controller: emailController,
                      ),
                      const SizedBox(height: 25),
                      TextFormFieldWidget(
                        hintText: 'Senha',
                        isPassword: true,
                        controller: passwordController,
                      ),
                      const Spacer(),
                      Text(
                        (state is ErrorAuthState) ? state.message : '',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).errorColor,
                            ),
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
                            isLoading: (state is LoadingAuthState),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                authBloc.add(
                                  SigninAuthEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
