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
  TextEditingController txtqty = TextEditingController();
  TextEditingController txttax = TextEditingController();
  TextEditingController txtdisc = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  double total = 0;
  double price = 0;
  double qty = 0;
  double tax = 0;
  double disc = 0;
  double? p;
  double? t;
  double? d;

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
                    const Row(
                      children: [
                        Text(
                          "Seller Name : ",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
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
                          style: TextStyle(color: Colors.grey, fontSize: 18),
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
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        const Spacer(),
                        Text(
                          "${g1.email}",
                          overflow: TextOverflow.ellipsis,
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
                    Column(
                      children: [
                        const Text(
                          "Product : ",
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
                            if (value == null || value.isEmpty) {
                              return "This field is require";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Price : ",
                                    style: TextStyle(
                                      color: Color(0xff601cee),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      hintText: "Price",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: txtprice,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is require";
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Quantity : ",
                                    style: TextStyle(
                                      color: Color(0xff601cee),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      hintText: "quantity",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: txtqty,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is require";
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Tax : ",
                                    style: TextStyle(
                                      color: Color(0xff601cee),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      hintText: "Tax",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: txttax,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is require";
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Discount: ",
                                    style: TextStyle(
                                      color: Color(0xff601cee),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextFormField(
                                    onChanged:
                                    (value) {
                                      disc=double.parse(txtdisc.text);
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: "Discount",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: txtdisc,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Total Price : ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            const Spacer(),
                            InkWell(onTap: () {
                                setState(() {
                                  total;
                                });
                              },
                              child: Text(
                                "${total}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (formkey.currentState!.validate()) {
                            Map info = {
                              'product': txtproduct.text,
                              'price': txtprice.text,
                              'qty': txtqty.text,
                              'total':total.toDouble(),
                            };
                            g1.l1.add(info);

                            price = double.parse(txtprice.text);
                            qty=double.parse(txtqty.text);
                            tax=double.parse(txttax.text);

                            p=price*qty;
                            t=(p!*tax)/100;
                            p=p!+t!;

                            d=(p!*disc)/100;
                            total=p!-d!;
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
