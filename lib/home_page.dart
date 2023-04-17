import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpin_mobile_application/capture_image_for_identification.dart';
import 'package:serpin_mobile_application/user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/serpin_logo.svg',
              width: 100,
              height: 26,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: const Icon(
                Icons.menu,
                size: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Container(
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
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 25, bottom: 15),
                      child: Text(
                        "Recent Posts",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF007770),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 270,
                    width: 350,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFABFFDC),
                          Color(0xFFD3FCF8),
                        ],
                      ),
                    ),
                    child: CarouselSlider(
                      items: [
                        _buildPostCard(
                          imageUrl: 'https://picsum.photos/200',
                          userProfileImageUrl: 'https://picsum.photos/50',
                          username: 'John Doe',
                          daysAgo: '2 days ago',
                          postDescription:
                              'This is another description of my post.',
                        ),
                        _buildPostCard(
                          imageUrl: 'https://picsum.photos/201',
                          userProfileImageUrl: 'https://picsum.photos/51',
                          username: 'Jane Smith',
                          daysAgo: '3 days ago',
                          postDescription:
                              'This is another description of my post.',
                        ),
                      ],
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 25, bottom: 15),
                      child: Text(
                        "Upload or Capture Image",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF007770),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 270,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFABFFDC), Color(0xFFD3FCF8)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 2.0,
                      ),
                    ),
                    child: image != null
                        ? ClipRRect(
                            child: Image.file(
                              image!,
                              width: 300,
                              height: 220,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ImageUpload()));
                                    },
                                    icon: const Icon(
                                        Icons.add_circle_outline_rounded),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Capture / Upload",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPostCard({
    required String imageUrl,
    required String userProfileImageUrl,
    required String username,
    required String daysAgo,
    required String postDescription,
  }) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(userProfileImageUrl),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      daysAgo,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF259287)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imageUrl,
                      width: 90,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      postDescription,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
