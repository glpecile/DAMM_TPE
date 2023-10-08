import 'package:SerManos/models/login.dart';
import 'package:SerManos/widgets/cells/cards/card_input.dart';
import 'package:SerManos/widgets/cells/forms/log_in.dart';
import 'package:SerManos/widgets/cells/header.dart';
import 'package:SerManos/widgets/cells/modal.dart';
import 'package:SerManos/widgets/cells/forms/radio_button.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';

void main() {
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
  final LogInData logInData = LogInData();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                        width: 200,
                        height: 200,
                      ),
                      LogInForm()
                    ]),
                    CardInput(
                        text: "Información del usuario", data: GenderRadio()),
                    Modal()
                  ],
                )))));
  }
}
