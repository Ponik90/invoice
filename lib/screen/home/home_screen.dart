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
              Navigator.pushNamed(context, 'personal');
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
          Container(
            height: 100,
            alignment: Alignment.topCenter,
            width: MediaQuery.sizeOf(context).width,
            color: const Color(0xff601cee),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
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
                  backgroundImage: FileImage(File("${g1.image}")),
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
                )
              ]
            ),
          ),
          SizedBox(height: 30,),
          InkWell(onTap:  () {
            Navigator.pushNamed(context, 'product');
          },
            child: const CircleAvatar(
              backgroundColor: Color(0xff601cee),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
