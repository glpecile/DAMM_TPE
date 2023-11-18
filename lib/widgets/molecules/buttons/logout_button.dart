import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutButton extends StatelessWidget {
  final Function() onLogout;

  const LogoutButton({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 308,
      child: ButtonCTA(
        btnColor: SerManosColors.error_100,
        foregroundColor: SerManosColors.neutral_25,
        backgroundColor: Colors.transparent,
        text: "Cerrar sesión",
        onPressed: () => {
          showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                              padding: EdgeInsets.only(
                                  left: 0, bottom: 8, right: 0, top: 0),
                              child: Text(
                                  "¿Estás seguro que quieres cerrar sesión?",
                                  style: SerManosTypography.headline_02(
                                      color: SerManosColors.neutral_100))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonCTA(
                                btnColor: SerManosColors.primary_100,
                                text: 'Cancelar',
                                onPressed: () {
                                  context.pop();
                                },
                                foregroundColor: SerManosColors.neutral_75,
                              ),
                              ButtonCTA(
                                btnColor: SerManosColors.error_100,
                                text: 'Cerrar sesión',
                                onPressed: () => onLogout(),
                                foregroundColor: SerManosColors.neutral_75,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
        },
      ),
    );
  }
}
