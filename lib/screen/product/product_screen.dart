import 'package:flutter/material.dart';

import '../../utiles/global_var.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController txtproduct = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MY Product",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff601cee),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              color: const Color(0xff601cee),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.90,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Smaller Name : ",
                          style:
                              TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "Robbert Tall ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Purchaser Name : ",
                          style:
                              TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        const Spacer(),
                        Text(
                          "${g1.name}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "E-mail : ",
                          style:
                              TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        const Spacer(),
                        Text(
                          "${g1.email}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Product",
                      style: TextStyle(
                        color: Color(0xff601cee),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Product name",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      controller: txtproduct,
                      validator: (value) {
                        if (value == null || value!.isEmpty) {
                          return "This field is requir";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Price : ",
                      style: TextStyle(
                        color: Color(0xff601cee),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Price",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      controller: txtprice,
                      validator: (value) {
                        if (value == null || value!.isEmpty) {
                          return "This field is requir";
                        }
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "quntity : ",
                      style: TextStyle(
                        color: Color(0xff601cee),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              i--;
                            });
                          },
                          child: const Text(
                            "-",
                            style: TextStyle(
                                color: Color(0xff601cee), fontSize: 25),
                          ),
                        ),
                        const SizedBox(
                           width: 10,
                        ),
                        Text(
                          "$i",
                          style: const TextStyle(
                              color: Color(0xff601cee), fontSize: 25),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              i++;
                            });
                          },
                          child: const Text(
                            "+",
                            style: TextStyle(
                                color: Color(0xff601cee), fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Total Price : ",
                          style:
                          TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "Robbert Tall ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),


                    Center(
                      child: InkWell(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (formkey.currentState!.validate()) {
                            g1.product = txtproduct.text;
                            g1.price = txtprice.text;
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
            )
          ],
        ),
      ),
    );
  }
}
