import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpin_mobile_application/AnimalDetailsScreen.dart';
import 'package:serpin_mobile_application/Model/animalDetails.dart';
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
                      //fit: BoxFit.cover
                    )),
                  ),
                  onTap: () =>
                      Navigator.of(context).popUntil((_) => count++ >= 1),
                ),
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
    if (animalType == "Common krait 1") {
      pItem = snakeList[0];
    } else if (animalType == "Common krait") {
      pItem = snakeList[1];
    }
    //else if (disease == "Bell Pepper Leaf Spot") {
    //   pItem = chiliList[1];
    // } else if (disease == "Bollworm") {
    //   pItem = pestList[2];
    // } else if (disease == "Chilli Leaf Spot") {
    //   pItem = chiliList[0];
    // } else if (disease == "Chilli Whitefly") {
    //   pItem = pestList[6];
    // } else if (disease == "Citrus Greening") {
    //   pItem = citrusList[0];
    // } else if (disease == "Corn Gray Leaf Spot") {
    //   pItem = cornList[0];
    // } else if (disease == "Corn Northern Leaf Blight") {
    //   pItem = cornList[1];
    // } else if (disease == "Grape Black Rot") {
    //   pItem = grapeList[0];
    // } else if (disease == "Grape Healthy") {
    //   pItem = grapeList[2];
    // } else if (disease == "Grape Leaf Blight") {
    //   pItem = grapeList[1];
    // } else if (disease == "Mites") {
    //   pItem = pestList[3];
    // } else if (disease == "Pepper Bacterial Spot") {
    //   pItem = chiliList[2];
    // } else if (disease == "Potato Early Blight") {
    //   pItem = potatoList[0];
    // } else if (disease == "Potato Healthy") {
    //   pItem = potatoList[2];
    // } else if (disease == "Potato Late Blight") {
    //   pItem = potatoList[1];
    // } else if (disease == "Sawfly") {
    //   pItem = pestList[4];
    // } else if (disease == "Stem Borer") {
    //   pItem = pestList[5];
    // } else if (disease == "Strawberry Leaf Scorch") {
    //   pItem = berryList[0];
    // } else if (disease == "Tomato Bacterial Spot") {
    //   pItem = tomatoList[0];
    // } else if (disease == "Tomato Early Blight") {
    //   pItem = tomatoList[1];
    // } else if (disease == "Tomato Leaf Mold") {
    //   pItem = tomatoList[2];
    // } else if (disease == "Tomato Mosaic Virus") {
    //   pItem = tomatoList[3];
    // } else if (disease == "Tomato Septoria Leaf Spot") {
    //   pItem = tomatoList[4];
    // }
    else {
      nullFlag = 1;
    }
  }
}
