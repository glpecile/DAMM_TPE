import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Voluntariado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 328,
          height: 234,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Column(
              children: [
                Image.asset(
                    '/Users/anitatarantino/Documents/DAMM/fluttertest/assets/images/voluntario.jpg',
                // height: 138,
                // width: 328,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("ACCIÓN SOCIAL",
                              style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 10,
                                  fontFamily: 'Roboto'
                              )
                          ),
                          const Text("Un Techo para mi País",
                            style: TextStyle(
                              fontSize: 16,
                            ),),
                          const SizedBox(height: 4,),
                          VacantesIcons(),
                        ],
                      ),
                      gIcons()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class gIcons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Icon(
          Icons.favorite_border,
          color: Color(0xff14903F),
          size: 24,
        ),
        Icon(
          Icons.fmd_good_rounded,
          color: Color(0xff14903F),
          size: 24,
        ),
      ],
    );
  }
}

class Vacantes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xffCAE5FB),
        ),
        child: const Row(
          children: [
            Text("Vacantes: ", style: TextStyle(fontSize: 12),),
            Icon(Icons.person_rounded,
                color: Color.fromRGBO(13, 71, 161, 1),
            size: 20,),
            Text(
              "10",
              style: TextStyle(color: Color.fromRGBO(13, 71, 161, 1),
                  fontSize: 16),
            ),
          ],
        ));
  }
}

class VacantesIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Vacantes(),
        ]);
  }

}


