
import 'package:SerManos/widgets/cells/cards/card.dart';
import 'package:SerManos/widgets/cells/cards/card_news.dart';
import 'package:SerManos/widgets/cells/forms/log_in.dart';
import 'package:SerManos/widgets/cells/forms/profile_data.dart';
import 'package:SerManos/widgets/cells/header.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SerManosApp());
}

class SerManosApp extends StatelessWidget {
  const SerManosApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SerManos',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: SerManosColors.secondary_10),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const SerManosHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class SerManosHomePage extends StatefulWidget {
  const SerManosHomePage({super.key, required this.title});

  final String title;

  @override
  State<SerManosHomePage> createState() => _SerManosHomePageState();
}

class _SerManosHomePageState extends State<SerManosHomePage> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                backgroundColor: SerManosColors.secondary_10,
                appBar: Header(),
                body: SerManosGrid(
                    child: TabBarView(
                  children: [
                    Column(children: [
                      Image(
                        image: AssetImage('assets/images/logo.png'),
                        width: 150,
                        height: 150,
                      ),
                      LogInForm()
                    ]),
                    ProfileDataForm(),
                    Column(
                      children: [
                        CardNews(
                          overline: "REPORTE 2820",
                          title: "Ser donante de sangre voluntario",
                          description: "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre"
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CardVolunteers()
                      ],
                    ),
                  ],
                )))));
  }
}
