import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpin_mobile_application/user_profile.dart';

import 'Utils/colors.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  child: Text(
                    "Help",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF007770),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 230,
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _pageController.animateToPage(0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF007770),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "About the app",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _pageController.animateToPage(1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF007770),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "How to Use?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _pageController.animateToPage(2,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF007770),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Contact Us",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                        'assets/help.svg',
                        width: 250,
                        height: 200,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    children: [
                      buildSlide(
                        "About the app",
                        "SerpIn is a mobile app for nature enthusiasts that uses image recognition to identify snakes and insects. Snap a photo with your mobile device and get detailed species information. With a vast database and user-friendly interface, it's your go-to guide for safe identification and learning on the go. Download now for an exciting adventure in the world of reptiles and bugs!",
                        Colors.green,
                      ),
                      buildSlide(
                        "How to Use?",
                        "1.)Snap a photo: Launch the app and use your mobile device's camera to capture a clear photo of the snake or insect you want to identify.\n\n2.)Tap to identify: After taking the photo, tap the Identify button within the app.\n\n3.)Get results: Our powerful image recognition technology will quickly analyze the photo and provide you with detailed information about the species, including common and scientific names, habitat, behavior, and venomous status for snakes, and classification, diet, lifespan, and unique characteristics for insects.\n\n4.)Explore and learn: Browse through the species information and learn more about the fascinating world of snakes and insects. You can also view past identifications in your app history for future reference.\n\n5.)Share and save: Share your identifications with friends or save them to your personal collection for easy access later.",
                        Colors.green,
                      ),
                      buildSlide(
                        "Contact Us",
                        "We value your feedback and are here to assist you with any questions or concerns about SerpIn Please feel free to contact us through the following channels:\n\nEmail: support@serpin.com\n\nPhone: +94 71 71 644 10\n\nWebsite: www.serpin.com/contact-usWe strive to provide excellent customer service and will do our best to address your inquiries promptly. \n\nThank you for your support of SerpIn and we look forward to assisting you!",
                        Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSlide(String title, String description, Color color) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            bottom: 290,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 17, right: 17),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: profiletxt,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  border: Border.all(color: color, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              height: 290,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color, width: 2),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: profiletxt,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
