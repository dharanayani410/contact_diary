import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> detail =
        ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.circle)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(
                flex: 9,
              ),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey.shade400,
              ),
              const Spacer(
                flex: 1,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text("${detail['fName']} ${detail['lName']}"),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("+91 ${detail['phone']}"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.green.shade600,
                child: const Icon(Icons.call),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.yellow.shade900,
                child: const Icon(Icons.message),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.lightBlue,
                child: const Icon(Icons.email),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.orange,
                child: const Icon(Icons.share),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          const Spacer(
            flex: 2,
          ),
        ]),
      ),
    );
  }
}
