import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  final GoRouterState state;
  final Widget child;

  const AppScaffold({
    super.key,
    required this.state,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 120,
        leading: _Logo(),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.topRoute?.name != 'home') _SearchButton(),
                _FavoritesButton(),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: child,
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SvgPicture.asset(
        'assets/icons/logo.svg',
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icons/search.svg',
      ),
    );
  }
}

class _FavoritesButton extends StatelessWidget {
  const _FavoritesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icons/heart.svg',
      ),
    );
  }
}
