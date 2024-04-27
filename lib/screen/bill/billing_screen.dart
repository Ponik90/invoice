import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invoice/utiles/pdf_save.dart';

import '../../utiles/global_var.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: const Text(
          "Your Bill",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff601cee),
        actions: [
          InkWell(
            onTap: () {
              pdf();
            },
            child: const Icon(
              Icons.save,
              color: Colors.white,
              size: 30,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "About Shop : ",
                style: TextStyle(
                    color: Color(0xff601cee),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Shop Owner Name : Robbert Tall ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                "E-mail : Dmart@.gmail.com ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                "Address Name :  ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                "Singanpur,Surat,Gujarat ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Divider(
                thickness: 2,
                height: 20,
                color: Color(0xff601cee),
              ),
              const Divider(
                thickness: 2,
                height: 3,
                color: Color(0xff601cee),
              ),
              const Text(
                "Customer Details : ",
                style: TextStyle(
                    color: Color(0xff601cee),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ClipOval(
                  child: g1.image != null
                      ? SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.file(
                              File(
                                "${g1.image}",
                              ),
                              fit: BoxFit.fill),
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey.shade400,
                        ),
                ),
              ),
              Text(
                "Customer Name : ${g1.name} ",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "E-mail : ${g1.email} ",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Phone Number : ${g1.phone}  ",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Divider(
                thickness: 2,
                height: 20,
                color: Color(0xff601cee),
              ),
              const Divider(
                thickness: 2,
                height: 3,
                color: Color(0xff601cee),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Name ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Qty ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Price ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                height: 20,
                color: Color(0xff601cee),
              ),
              const Divider(
                thickness: 2,
                height: 3,
                color: Color(0xff601cee),
              ),
              Column(
                children: g1.l1
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${e['product']}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${e['qty']} ",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${e['total']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
