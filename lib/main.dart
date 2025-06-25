import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            ElevatedButton(
              child: Text("CREATE"),
              onPressed: () async {
                final brand = FirebaseFirestore.instance;
                await brand
                    .collection("Brand")
                    .doc("Name")
                    .collection("info")
                    .doc("Details")
                    .set({"name": "Nike", "price": "Rs 1,20,000"});
              },
            ),
            ElevatedButton(
              child: Text("UPDATE"),
              onPressed: () async {
                final brand = FirebaseFirestore.instance;
                await brand
                    .collection("Brand")
                    .doc("Name")
                    .collection("info")
                    .doc("Details")
                    .update({"name": "Gucci", "price": "Rs 12,00,000"});
              },
            ),
            ElevatedButton(
              child: Text("READ"),
              onPressed: () async {
                final brand = FirebaseFirestore.instance;
                final response = await brand
                    .collection("Brand")
                    .doc("Name")
                    .collection("info")
                    .doc("Details")
                    .get();
               log(response.data().toString());
              },
            ),
            ElevatedButton(
              child: Text("DELETE"),
              onPressed: () async {
                final brand = FirebaseFirestore.instance;
                await brand
                    .collection("Brand")
                    .doc("Name")
                    .collection("info")
                    .doc("Details")
                    .delete();
              },
            ),
          ],
        ),
      ),
    );
  }
}
