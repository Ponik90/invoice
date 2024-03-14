import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../utiles/global_var.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtadd = TextEditingController();
  String path = "";

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          backgroundColor: const Color(0xff601cee),
        ),
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Container(
              height: 100,
              alignment: Alignment.topCenter,
              width: MediaQuery.sizeOf(context).width,
              color: const Color(0xff601cee),
              child: const Text(
                "Enter Your Profile ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.90,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                path.isEmpty
                                    ? const CircleAvatar(
                                        backgroundColor: Colors.black26,
                                        maxRadius: 50,
                                        child: Text("Add"),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.black26,
                                        maxRadius: 30,
                                        backgroundImage:
                                            FileImage(File("${path}")),
                                      ),
                                InkWell(
                                  onTap: () async {
                                    ImagePicker picker = ImagePicker();

                                    XFile? image = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    setState(
                                      () {
                                        path = image!.path;
                                        g1.image = image.path;
                                      },
                                    );
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.blueAccent,
                                    maxRadius: 15,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "Enter Your Image",
                              style: TextStyle(
                                color: Color(0xff601cee),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "About you",
                          style: TextStyle(
                            color: Color(0xff601cee),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value!.isEmpty) {
                              return "name is required";
                            }
                          },
                          controller: txtname,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Phone",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.grey,
                            ),
                          ),
                          controller: txtphone,
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return "phone number is required";
                            } else if (value.length != 10) {
                              return "Enter the 10 digit";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "E-mail",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                          ),
                          controller: txtemail,
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return "enter the email";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return "enter the valid email";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Address",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                          ),
                          controller: txtadd,
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return "enter the address";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (formkey.currentState!.validate()) {
                                g1.name = txtname.text;
                                g1.email = txtemail.text;
                                g1.phone = txtphone.text;
                                g1.add = txtadd.text;

                                formkey.currentState!.reset();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Saves"),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 80,
                              color: const Color(0xff601cee),
                              alignment: Alignment.center,
                              child: const Text(
                                "SAVE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
