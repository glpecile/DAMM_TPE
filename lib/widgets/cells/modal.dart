import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../molecules/button_CTA.dart';
import '../tokens/colors.dart';
import '../tokens/typography.dart';

class Modal extends StatelessWidget{
  const Modal({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: ElevatedButton(
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
                          const Padding(
                              padding: EdgeInsets.only(left:0, bottom: 8, right: 0, top:0),
                              child: Text('Un Techo para mi País', style: SerManosTypography.headline_02(color: SerManosColors.neutral_100))),
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
        )
    );
  }
}
