import 'package:flutter/material.dart';
import 'dart:io';
import '../../utiles/global_var.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "MY INVOICES",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff601cee),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'personal').then((value) {
                setState(() {});
              });
            },
            icon: const Icon(
              Icons.perm_identity,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          g1.name != null
              ? Container(
                  height: 100,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.sizeOf(context).width * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: FileImage(
                          File("${g1.image}"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${g1.name}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xff601cee),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${g1.email}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xff601cee),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: g1.l1
                    .map((e) => Container(
                          width: MediaQuery.sizeOf(context).width * 0.90,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Name : ${e['product']}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xff601cee),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Product Price : ${e['price']}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xff601cee),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Product Quantity : ${e['qty']}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xff601cee),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Total Price : ${e['total']}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xff601cee),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        'product',
                                      ).then(
                                        (value) {
                                          setState(
                                            () {},
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff601cee),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Edit",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        g1.l1.remove(e);
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff601cee),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff601cee),
        onPressed: () {
          Navigator.pushNamed(context, 'product').then((value) {
            setState(() {});
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'bill');
              },
              child: Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width * 0.50,
                decoration: BoxDecoration(
                    color: const Color(0xff601cee),
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: const Text(
                  "Bill",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
