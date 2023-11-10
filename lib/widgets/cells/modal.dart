import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/molecules/buttons/floating_button.dart';
import 'package:SerManos/widgets/molecules/buttons/short_button.dart';
import 'package:flutter/material.dart';
import '../molecules/buttons/button_cta.dart';
import '../tokens/colors.dart';
import '../tokens/typography.dart';

class Modal extends StatelessWidget{
  const Modal({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingButton(onPressed: (){}, foregroundColor: SerManosColors.neutral_75.withOpacity(0.1), backgroundColor: SerManosColors.primary_10, icon: SerManosIcons.nearMe, iconColor: SerManosColors.primary_100,),
              ShortButton(btnColor: SerManosColors.neutral_0, text: "Completar", onPressed: (){}, foregroundColor: SerManosColors.neutral_10, backgroundColor: SerManosColors.primary_100, size: Size.medium, icon: SerManosIcons.add),
              ElevatedButton(
                  child: const Text('showModalBottomSheet'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16,8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text("Te estas por postular a", style: SerManosTypography.subtitle_01(color: SerManosColors.neutral_100),),
                                const SizedBox(height: 5),
                                Padding(
                                    padding: const EdgeInsets.only(left:0, bottom: 8, right: 0, top:0),
                                    child: Text(title!, style: const SerManosTypography.headline_02(color: SerManosColors.neutral_100))),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:[
                                      ButtonCTA(btnColor: SerManosColors.primary_100, text: 'Cancelar', onPressed: () { Navigator.pop(context); }, foregroundColor: SerManosColors.neutral_75,),
                                      ButtonCTA(btnColor: SerManosColors.primary_100, text: 'Confirmar', onPressed: () {  }, foregroundColor: SerManosColors.neutral_75,)
                                    ]
                                )
                              ],
                            ),
                          ),
                        )
                    );
                  }
              ),
            ]
        )
    );
  }
}
