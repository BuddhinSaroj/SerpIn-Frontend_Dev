import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:serpin_mobile_application/user_profile.dart';

import 'Utils/colors.dart';
import 'capture_image_for_identification.dart';
import 'first-aid.dart';

class HomePage extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser!;

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFABFFDC),
                Color(0xFFFAFEFF),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 80,
                        height: 30,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile()));
                            },
                            icon: const Icon(
                              Icons.menu,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 15),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Hello ${user?.displayName ?? 'User'}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          getGreeting(),
                          style: TextStyle(
                              fontSize: 18,
                              color: hometxt,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: profiletxt,
                                width:
                                    2.0), // set desired border color and width
                          ),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(user?.photoURL ?? ''),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: Container(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 370,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/home_image_${index + 1}.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 165,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(5,
                          5), // changes the shadow direction, in this case, it's down by 3 pixels
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFABFFDC), Color(0xFFFAFEFF)],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Upload or Capture Image",
                      style: TextStyle(
                          fontSize: 24,
                          color: profiletxt,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color(0xFF007770),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ImageUpload()),
                              );
                            },
                            icon: Padding(
                              padding:
                                  EdgeInsets.all(0.0), // set desired padding
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 32.0, // set desired icon size
                                color: Colors.white, // set desired icon color
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstAidScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Color(0xFF007770),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 90),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset("assets/first_aid.png"),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "First-Aid",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
