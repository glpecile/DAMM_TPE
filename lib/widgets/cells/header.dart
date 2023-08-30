import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{
  const Header({super.key});

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
      bottom: const TabBar(
              tabs: [
              Tab(child: Text('Postularse')),
              Tab(child: Text('Mi perfil')),
              Tab(child: Text('Novedades')),
              ],
            ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight+kTextTabBarHeight);
}