import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpin_mobile_application/animal_details_view.dart';
import 'package:serpin_mobile_application/Model/animalDetails.dart';
import 'package:serpin_mobile_application/capture_image_for_identification.dart';
import 'package:serpin_mobile_application/user_profile.dart';

import 'Utils/colors.dart';

class IdentifyList extends StatelessWidget {
  final String animalType;

  IdentifyList({Key? key, required this.animalType}) : super(key: key);

  AnimalDetails? pItem;
  int count = 0;
  int nullFlag = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    checkAnimalType();
    return nullFlag == 1
        ? Scaffold(
            //body: Center(child: Text(disease)),
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
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 100,
                          height: 35,
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
                SizedBox(height: 90),
                Container(
                  width: w,
                  height: h * 0.3,
                  decoration: BoxDecoration(
                    // Remove the image and use a transparent background color
                    color: Colors.transparent,
                  ),
                  child: SvgPicture.asset(
                    "assets/not_found.svg", // Replace with the path to your SVG file
                    semanticsLabel:
                        'Not Found', // Provide a semantics label for accessibility
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Sorry, We couldn't identify the image.\nPlease try again",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.8,
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Raleway'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                GestureDetector(
                    child: Container(
                      width: w * 0.15,
                      height: h * 0.15,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/home_id.png"),
                      )),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageUpload()))),
              ]),
            ),
          ))
        : Scaffold(
            //body: Center(child: Text(disease)),
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
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 100,
                          height: 35,
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: Text(
                      "Identified Animal Type",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF007770),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        print(pItem!.imageUrl);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 12),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color:
                                profiletxt, // Set the desired color for the card
                            child: ListTile(
                              title: Text(
                                "     " + pItem!.commonName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(pItem!.imageUrl),
                              ),
                              trailing: Icon(Icons.arrow_forward_rounded,
                                  color: Colors.white),
                              contentPadding: EdgeInsets.all(15),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AnimalDetailsScreen(pItem!)));
                              },
                            ),
                          ),
                        );
                      }),
                ),
              ]),
            ),
          ));
  }

  checkAnimalType() {
    print("Animal Type Checked");
    if (animalType == "Snake-Bungarus_Caeruleus") {
      pItem = snakeList[0];
    } else if (animalType == "Snake-Daboia_Russelii") {
      pItem = snakeList[1];
    } else if (animalType == "Snake-Echis_Carinatus") {
      pItem = snakeList[2];
    } else if (animalType == "Snake-Hypnale_Hypnale") {
      pItem = snakeList[3];
    } else if (animalType == "Snake-Naja_Naja") {
      pItem = snakeList[4];
    } else if (animalType == "Snake-Ahaetulla_Nasuta") {
      pItem = snakeList[5];
    } else if (animalType == "Snake-Boiga_Trigonata") {
      pItem = snakeList[6];
    } else if (animalType == "Snake-Amphiesma_Stolatum") {
      pItem = snakeList[7];
    } else if (animalType == "Snake-Chrysopelea_Ornata") {
      pItem = snakeList[8];
    } else if (animalType == "Snake-Lycodon_Aulicus") {
      pItem = snakeList[9];
    } else if (animalType == "Snake-Ptyas_Mucosa") {
      pItem = snakeList[10];
    } else if (animalType == "Snake-Python_Molurus") {
      pItem = snakeList[11];
    } else if (animalType == "Snake-Trimeresurus_Trigonocephalus") {
      pItem = snakeList[12];
    } else if (animalType == "BEE-Garden_Bumble_Bee") {
      pItem = beesList[0];
    } else if (animalType == "BEE-Violet_Carpenter_Bee") {
      pItem = beesList[1];
    } else if (animalType == "BEE-Pure_Green_Sweat_Bee") {
      pItem = beesList[3];
    } else if (animalType == "BEE-Western_Honey_Bee") {
      pItem = beesList[2];
    } else if (animalType == "WASP-Asian_Giant_Hornet") {
      pItem = waspList[0];
    } else if (animalType == "WASP-Blackjacket") {
      pItem = waspList[1];
    } else if (animalType == "WASP-Dark_Paper_Wasp") {
      pItem = waspList[2];
    } else if (animalType == "WASP-Yellowjacket") {
      pItem = waspList[3];
    } else {
      nullFlag = 1;
    }
  }
}
