import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'global.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  XFile? image;
  File? photo;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Global.contact.add({
                  'fName': Global.fName,
                  'lName': Global.lName,
                  'phone': Global.phone,
                  'email': Global.email
                });
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
                setState(() {});
              },
              icon: const Icon(Icons.done))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(alignment: Alignment.bottomRight, children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.grey.shade400.withOpacity(0.5),
                  backgroundImage: (photo == null) ? null : FileImage(photo!),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text("pick image"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () async {
                                    image = await _picker.pickImage(
                                        source: ImageSource.camera);
                                    setState(() {
                                      photo = File(image!.path);
                                      Global.pic = 'photo';
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: const Icon(Icons.camera_alt)),
                              ElevatedButton(
                                  onPressed: () async {
                                    image = await _picker.pickImage(
                                        source: ImageSource.gallery);
                                    setState(() {
                                      photo = File(image!.path);
                                      Global.pic = 'photo';
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: const Icon(Icons.photo))
                            ],
                          );
                        });
                  },
                  mini: true,
                  child: const Icon(Icons.add),
                )
              ]),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("First Name"),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        Global.fName = val;
                      });
                    },
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey))),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Last Name"),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        Global.lName = val;
                      });
                    },
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey))),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Phone Number"),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        Global.phone = val;
                      });
                    },
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey))),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email"),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        Global.email = val;
                      });
                    },
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
