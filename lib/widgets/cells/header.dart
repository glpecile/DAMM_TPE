import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{
  const Header({super.key});

  TabBar get _tabBar => const TabBar(
    indicator: BoxDecoration(
      color: SerManosColors.secondary_200,
      border: Border(
        bottom: BorderSide(
          color: SerManosColors.neutral_0,
          width: 2.0,
        ),
      ),
    ),
    tabs: [
      Tab(child: Text('Postularse')),
      Tab(child: Text('Mi perfil')),
      Tab(child: Text('Novedades')),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const Image(
        image: AssetImage("assets/images/logo_with_text.png"),
        height: 25,
        fit: BoxFit.contain,
      ),
      backgroundColor: SerManosColors.secondary_90,
      bottom: PreferredSize(
        preferredSize: _tabBar.preferredSize,
        child: Material(
            color: SerManosColors.secondary_100,
            child:  Theme( // <-- SEE HERE
              data: ThemeData(
              ).copyWith(appBarTheme:const AppBarTheme()),
              child: _tabBar),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+kTextTabBarHeight);
}