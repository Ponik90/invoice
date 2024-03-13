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
  TextEditingController txtdob = TextEditingController();
  TextEditingController txtnationality = TextEditingController();
  bool isenglish = false;
  bool ishindi = false;
  String isstatus = "";
  String isgender = "";

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
                                        maxRadius: 50,
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
                                        g1.image=image.path;
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
                        const Text(
                          "DOB",
                          style: TextStyle(
                            color: Color(0xff601cee),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "DD/MM/YYYY",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          controller: txtdob,
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return "this field is required";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Marital Stats",
                          style: TextStyle(
                            color: Color(0xff601cee),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RadioListTile(
                          value: "Singel",
                          groupValue: isstatus,
                          onChanged: (value) {
                            setState(
                              () {
                                isstatus = value!;
                                g1.status = value;
                              },
                            );
                          },
                          activeColor: const Color(0xff601cee),
                          title: Text("Singel",
                              style: isstatus == "Singel"
                                  ? const TextStyle(
                                      color: Color(0xff601cee),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)
                                  : const TextStyle(fontSize: 15)),
                          contentPadding: EdgeInsets.zero,
                        ),
                        RadioListTile(
                          value: "Married",
                          groupValue: isstatus,
                          onChanged: (value) {
                            setState(
                              () {
                                isstatus = value!;
                                g1.status = value;
                              },
                            );
                          },
                          activeColor: const Color(0xff601cee),
                          title: Text("Married",
                              style: isstatus == "Married"
                                  ? const TextStyle(
                                      color: Color(0xff601cee),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)
                                  : const TextStyle(fontSize: 15)),
                          contentPadding: EdgeInsets.zero,
                        ),
                        const Text(
                          "Gender",
                          style: TextStyle(
                            color: Color(0xff601cee),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RadioListTile(
                          value: "Male",
                          groupValue: isgender,
                          onChanged: (value) {
                            setState(
                              () {
                                isgender = value!;
                                g1.gender = value;
                              },
                            );
                          },
                          activeColor: const Color(0xff601cee),
                          title: Text("Male",
                              style: isgender == "Male"
                                  ? const TextStyle(
                                      color: Color(0xff601cee),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)
                                  : const TextStyle(fontSize: 15)),
                          contentPadding: EdgeInsets.zero,
                        ),
                        RadioListTile(
                          value: "Female",
                          groupValue: isgender,
                          onChanged: (value) {
                            setState(
                              () {
                                isgender = value!;
                                g1.gender = value;
                              },
                            );
                          },
                          activeColor: const Color(0xff601cee),
                          title: Text("Female",
                              style: isgender == "Female"
                                  ? const TextStyle(
                                      color: Color(0xff601cee),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)
                                  : const TextStyle(fontSize: 15)),
                          contentPadding: EdgeInsets.zero,
                        ),
                        RadioListTile(
                          value: "Other",
                          groupValue: isgender,
                          onChanged: (value) {
                            setState(
                              () {
                                isgender = value!;
                                g1.gender = value;
                              },
                            );
                          },
                          activeColor: const Color(0xff601cee),
                          title: Text("Other",
                              style: isgender == "Other"
                                  ? const TextStyle(
                                      color: Color(0xff601cee),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)
                                  : const TextStyle(fontSize: 15)),
                          contentPadding: EdgeInsets.zero,
                        ),
                        const Text(
                          "Nationality",
                          style: TextStyle(
                            color: Color(0xff601cee),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "India",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          controller: txtnationality,
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return "this field is required";
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
                                g1.dob = txtdob.text;
                                g1.nation = txtnationality.text;
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
