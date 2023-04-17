import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Widget/progress.dart';

//final usersRef = FirebaseFirestore.instance.collection('users');
final usersRef = FirebaseFirestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users = [];

  @override
  void initState() {
    createUser();
    //getUsers();
    //getUserById();
    //updateUser();
    //deleteUser();
    super.initState();
  }

  getUsers() async {
    // userRef.get().then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((DocumentSnapshot doc) {
    //     print(doc.get("username"));
    //   });
    // });

    // final QuerySnapshot snapshot = await userRef
    //     .where("postCount", isLessThan: 4)
    //     .where("username", isEqualTo: "Saroj")
    //     .get();

    // final QuerySnapshot snapshot =
    //     await userRef.orderBy("postCount", descending: false).get();
    //
    // snapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
    //   print(documentSnapshot.data());
    //   print(documentSnapshot.exists);
    //   print(documentSnapshot.id);
    // });

    final QuerySnapshot snapshot = await usersRef.get();

    setState(() {
      users = snapshot.docs;
    });
  }

  getUserById() async {
    final String id = "dy7MamT2eU1NTHJbHwfO";
    final DocumentSnapshot documentSnapshot = await usersRef.doc(id).get();

    // print(documentSnapshot.data());
    // print(documentSnapshot.exists);
    // print(documentSnapshot.id);
  }

  createUser() async {
    await usersRef
        .doc("asdfasfd")
        .set({"username": "Test", "postCount": 0, "isAdmin": false});
  }

  updateUser() async {
    final document = await usersRef
        // .doc("asdfasfd")
        // .update({"username": "Test@", "postCount": 1, "isAdmin": false});
        .doc("asdfasfd")
        .get();
    if (document.exists) {
      document.reference
          .update({"username": "Test3", "postCount": 2, "isAdmin": false});
    }
  }

  deleteUser() async {
    final DocumentSnapshot document = await usersRef.doc("asdfasfd").get();
    if (document.exists) {
      document.reference.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Image.asset(
            'assets/logo.png',
            width: 100,
            height: 26,
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: usersRef.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgress();
              }
              final List<Text> children = snapshot.data!.docs
                  .map((doc) => Text(doc['username']))
                  .toList();
              return Container(
                child: ListView(
                  children: children,
                ),
              );
            }));
  }
}
