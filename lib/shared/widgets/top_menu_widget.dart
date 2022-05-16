import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_bloc.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_event.dart';
import 'package:portfoliov2/app/modules/administracao/presenter/bloc/auth_state.dart';
import 'package:portfoliov2/shared/widgets/generic_divider_widget.dart';
import 'package:portfoliov2/app/modules/home/widgets/ring_widget.dart';

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
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.topMenuEnum != TopMenuEnum.inicio) const SizedBox(width: 40),
          if (widget.topMenuEnum != TopMenuEnum.inicio)
            RingWidget(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'lib\\assets\\images\\eu.jpg',
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (widget.topMenuEnum != TopMenuEnum.inicio) const SizedBox(width: 40),
          if (widget.topMenuEnum != TopMenuEnum.inicio)
            const GenericDividerWidget(height: 50, width: 1.5, vertical: true),
          if (widget.topMenuEnum != TopMenuEnum.inicio) const SizedBox(width: 40),
          if (widget.topMenuEnum != TopMenuEnum.inicio)
            Text(
              'ADEMIR',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          const Spacer(),
          MenuItemWidget(
            title: 'INÍCIO',
            onPressed: () => Modular.to.navigate('/'),
            selected: widget.topMenuEnum == TopMenuEnum.inicio,
          ),
          const SizedBox(width: 20),
          const MenuItemWidget(
            title: 'DASHBOARD',
            onPressed: null,
          ),
          const SizedBox(width: 20),
          MenuItemWidget(
            title: 'PROJETOS',
            selected: widget.topMenuEnum == TopMenuEnum.projetos,
            onPressed: () => Modular.to.navigate('/portfolio/'),
          ),
          const SizedBox(width: 20),
          MenuItemWidget(
            title: 'TRAJETÓRIA',
            selected: widget.topMenuEnum == TopMenuEnum.trajetoria,
            onPressed: () => Modular.to.navigate('/trajectory/'),
          ),
          const SizedBox(width: 20),
          const MenuItemWidget(
            title: 'CERTIFICAÇÕES',
            onPressed: null,
          ),
          const SizedBox(width: 20),
          MenuItemWidget(
            title: 'ADMINISTRAÇÃO',
            selected: widget.topMenuEnum == TopMenuEnum.administracao,
            onPressed: () => Modular.to.navigate('/administracao/'),
          ),
          if (authBloc.isLogged())
            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  width: 1,
                  height: 15,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 20),
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
                      onPressed: () => authBloc.add(LogoutAuthEvent()),
                      icon: const Icon(Icons.exit_to_app),
                    );
                  },
                ),
              ],
            ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final bool selected;

  const MenuItemWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: onPressed == null
                ? Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                      fontSize: size.width < 1400
                          ? (size.width / 100) - 1
                          : Theme.of(context).textTheme.titleMedium!.fontSize,
                    )
                : Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: size.width < 1400
                          ? (size.width / 100) - 1
                          : Theme.of(context).textTheme.titleMedium!.fontSize,
                    ),
          ),
        ),
        if (selected)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GenericDividerWidget(width: size.width < 1400 ? 25 : 50),
          ),
      ],
    );
  }
}
