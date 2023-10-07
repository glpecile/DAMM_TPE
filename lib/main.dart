import 'package:SerManos/widgets/cells/cards/card_input.dart';
import 'package:SerManos/widgets/cells/cards/card_news.dart';
import 'package:SerManos/widgets/cells/header.dart';
import 'package:SerManos/widgets/cells/modal.dart';
import 'package:SerManos/widgets/cells/radio_button.dart';
import 'package:SerManos/widgets/cells/text_input.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: SerManosColors.secondary_10,
              appBar: const Header(),
              body: const SerManosGrid(
                  child: TabBarView(
                children: [
                  // CardVolunteersActual(),
                  // CardVolunteers(),
                  CardInput(text: "Información del usuario", data: GenderRadio()),
                  Modal(),
                  CardNews(),
                ],
              )),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            )));
  }
}
