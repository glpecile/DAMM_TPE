import 'package:SerManos/widgets/cells/forms/log_in.dart';
import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SerManosColors.neutral_0,
      body: SerManosGrid(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150,),
              Image.asset('assets/images/logo.png',
                width: 150,
                height: 150,),
              SizedBox(height: 40,),
              const LogInForm(),
              const SizedBox(height: 190,),
              Row(
                  children: [
                Expanded(
                    child: ButtonCTA(
                        btnColor: SerManosColors.neutral_0,
                        text: "Iniciar Sesión", 
                        onPressed: (){},
                        foregroundColor: SerManosColors.neutral_25,
                        backgroundColor: SerManosColors.primary_100,
                        )
                ),
              ]
              ),
              Row(
                children: [
                Expanded(child: ButtonCTA(
                        btnColor: SerManosColors.primary_100,
                        text: "No tengo cuenta",
                        onPressed: () => context.go('/start/register'),
                        foregroundColor: SerManosColors.neutral_25,
                        backgroundColor: Colors.transparent,
                        ))
              ],)
            ]
        ),
      ),


    );
  }
}
