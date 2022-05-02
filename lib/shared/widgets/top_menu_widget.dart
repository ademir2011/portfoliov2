import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_bloc.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_event.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_state.dart';
import 'package:portfoliov2/app/modules/home/widgets/generic_divider_widget.dart';

enum TopMenuEnum { inicio, dashboard, projetos, trajetoria, certificacoes, administracao }

class TopMenuWidget extends StatefulWidget {
  final TopMenuEnum topMenuEnum;
  const TopMenuWidget({
    Key? key,
    required this.topMenuEnum,
  }) : super(key: key);

  @override
  State<TopMenuWidget> createState() => _TopMenuWidgetState();
}

class _TopMenuWidgetState extends State<TopMenuWidget> {
  final authBloc = Modular.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (authBloc.isLogged())
            Row(
              children: [
                Text(
                  'Você está logado.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 40),
                BlocBuilder<AuthBloc, AuthState>(
                  bloc: authBloc,
                  builder: (ctx, state) {
                    if (state is SuccessLogoutAuthState) {
                      Modular.to.pushNamed('/');
                    }

                    if (state is LoadingAuthState) {
                      return const CircularProgressIndicator();
                    }

                    return IconButton(
                      onPressed: () {
                        authBloc.add(LogoutAuthEvent());
                      },
                      icon: const Icon(
                        Icons.exit_to_app,
                      ),
                    );
                  },
                ),
              ],
            ),
          Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => Modular.to.navigate('/'),
                    child: Text(
                      'INÍCIO',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  if (widget.topMenuEnum == TopMenuEnum.inicio)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: GenericDividerWidget(width: 50),
                    ),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                children: [
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'DASHBOARD',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => Modular.to.navigate('/portfolio/'),
                    child: Text(
                      'PROJETOS',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  if (widget.topMenuEnum == TopMenuEnum.projetos)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: GenericDividerWidget(width: 75),
                    ),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                children: [
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'TRAJETÓRIA',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                children: [
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'CERTIFICAÇÕES',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => Modular.to.navigate('/administracao/'),
                    child: Text(
                      'ADMINISTRAÇÃO',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  if (widget.topMenuEnum == TopMenuEnum.administracao)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: GenericDividerWidget(width: 75),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
