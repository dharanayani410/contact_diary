import 'dart:io';

import 'package:contact/add.dart';
import 'package:contact/contact.dart';
import 'package:contact/splash.dart';
import 'package:flutter/material.dart';

import 'global.dart';

void main() {
  runApp(
    const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        '/': (context) => Scaffold(
              appBar: AppBar(
                title: const Text("Contacts"),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.circle)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert))
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('add');
                },
                child: const Icon(Icons.add),
              ),
              body: (Global.contact.isNotEmpty)
                  ? ListView(
                      children: Global.contact
                          .map((e) => ListTile(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('contact', arguments: e);
                                },
                                leading:const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: ,
                                ),
                                title: Text("${e['fName']} ${e['lName']}"),
                                subtitle: Text("${e['phone']}"),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.call)),
                              ))
                          .toList())
                  : Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'asset/image/box.png',
                            height: 150,
                          ),
                          Text(
                            "You have no contacts yet",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                    ),
            ),
        'add': (context) => const Add(),
        'splash': (context) => const Splash(),
        'contact': (context) => const Contact(),
      },
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.blueGrey, secondary: Colors.blueGrey),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black12,
                fontSizeDelta: 10,
                fontSizeFactor: 2,
                displayColor: Colors.white,
              ),
          appBarTheme: const AppBarTheme(
              color: Colors.white12,
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.white))),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
    );
  }
}
