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
                      padding: EdgeInsets.fromLTRB(16, 16, 8, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text("Te estas por postular a", style: SerManosTypography.subtitle_01(color: SerManosColors.neutral_100),),
                          const SizedBox(height: 5),
                          const Text('Un Techo para mi País', style: SerManosTypography.headline_02(color: SerManosColors.neutral_100)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:[
                                ButtonCTA(color: SerManosColors.primary_100, text: 'Cancelar', onPressed: () { Navigator.pop(context); }),
                                ButtonCTA(color: SerManosColors.primary_100, text: 'Confirmar', onPressed: () {  },)

                                // TextButton(
                                //   onPressed: () {
                                //     Navigator.pop(context);
                                //   },
                                //   child: const Text('Cancelar',
                                //     style: TextStyle(
                                //         color: SerManosColors.primary_100
                                //     ),),
                                // ),
                                //
                                // TextButton(
                                //   onPressed: () {},
                                //   child: const Text('Confirmar',
                                //     style: TextStyle(
                                //         color: SerManosColors.primary_100
                                //     ),),
                                // ),
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
