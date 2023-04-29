import 'package:flutter/material.dart';
import 'package:serpin_mobile_application/Model/animalDetails.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'Utils/colors.dart';
import 'Utils/language_icons.dart';
import 'capture_image_for_identification.dart';

class AnimalDetailsScreen extends StatefulWidget {
  final AnimalDetails animalDetails;

  AnimalDetailsScreen(this.animalDetails);

  @override
  State<AnimalDetailsScreen> createState() => _AnimalDetailsScreenState();
}

class _AnimalDetailsScreenState extends State<AnimalDetailsScreen> {
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return flag == 1
        ? Scaffold(
            body: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: size.height,
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
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ImageUpload()));
                                },
                                child: Icon(Icons.arrow_back_ios_new,
                                    size: 36, color: Colors.black)),
                            ToggleSwitch(
                              minWidth: 55.0,
                              minHeight: 40.0,
                              initialLabelIndex: 1,
                              cornerRadius: 50.0,
                              borderWidth: 3.0,
                              borderColor: [profiletxt],
                              activeFgColor: Colors.black,
                              inactiveBgColor: toggleColor,
                              inactiveFgColor: Colors.white,
                              totalSwitches: 2,
                              icons: [
                                LanguageIcons.engIcon,
                                LanguageIcons.sinIcon,
                              ],
                              iconSize: 55.0,
                              activeBgColors: [
                                [kPrimaryColor, kSecondaryColor],
                                [kSecondaryColor, kPrimaryColor]
                              ],
                              animate: true,
                              curve: Curves.easeIn,
                              onToggle: (indexToggle) {
                                print('switched to: $indexToggle');
                                if (indexToggle == 1) {
                                  setState(() {
                                    flag = 1;
                                  });
                                } else {
                                  setState(() {
                                    flag = 0;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            (widget.animalDetails.imageUrl),
                            height: 200,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          child: Column(children: [
                            Text(
                              'සාමාන්‍ය නාමය',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: profiletxt,
                              ),
                            ),
                            Text(
                              widget.animalDetails.sinhalaCommonName,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.55),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        50), // Specify the desired top left border radius value
                    topRight: Radius.circular(
                        50), // Specify the desired top right border radius value
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          child: Container(
                            width: 250,
                            height: 7,
                            decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "විද්‍යාත්මක නාමය: " +
                              widget.animalDetails.sinhalaScientificName,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "විෂ තත්වය: " +
                              widget.animalDetails.sinhalaVenomousLevel,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),
                        //විස්තරය
                        Text(
                          "විස්තර",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.animalDetails.sinhalaDescription,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.7,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),

                        //බාහිර පෙනුම
                        Text(
                          "බාහිර පෙනුම",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.animalDetails.sinhalaAppearance,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.7,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),
                        //භූ ගෝලීය ව්‍යාප්තිය
                        Text(
                          "භූ ගෝලීය ව්‍යාප්තිය",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.animalDetails.sinhalaGeographicLocation,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.7,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),

                        //පුරුදු සහ ජීවන රටාව
                        Text(
                          "පුරුදු සහ ජීවන රටාව",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.animalDetails.sinhalaLifeAndHabits,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.7,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),

                        Text(
                          "තවත් ඡායාරූප",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              widget.animalDetails.imageUrl1),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              widget.animalDetails.imageUrl2),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              widget.animalDetails.imageUrl),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ))
        //English View
        : Scaffold(
            body: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: size.height,
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
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ImageUpload()));
                                  },
                                  child: Icon(Icons.arrow_back_ios_new,
                                      size: 36, color: Colors.black)),
                              ToggleSwitch(
                                minWidth: 55.0,
                                minHeight: 40.0,
                                initialLabelIndex: 0,
                                cornerRadius: 50.0,
                                borderWidth: 3.0,
                                borderColor: [profiletxt],
                                activeFgColor: Colors.white,
                                inactiveBgColor: toggleColor,
                                inactiveFgColor: Colors.white,
                                totalSwitches: 2,
                                icons: [
                                  LanguageIcons.engIcon,
                                  LanguageIcons.sinIcon,
                                ],
                                iconSize: 55.0,
                                activeBgColors: [
                                  [kPrimaryColor, kSecondaryColor],
                                  [kSecondaryColor, kPrimaryColor]
                                ],
                                animate: true,
                                curve: Curves.easeIn,
                                onToggle: (indexToggle) {
                                  print('switched to: $indexToggle');
                                  if (indexToggle == 1) {
                                    setState(() {
                                      flag = 1;
                                    });
                                  } else {
                                    setState(() {
                                      flag = 0;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 230,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              (widget.animalDetails.imageUrl),
                              height: 200,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            child: Column(children: [
                              Text(
                                'Identification',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: profiletxt,
                                ),
                              ),
                              Text(
                                widget.animalDetails.commonName,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.55),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        50), // Specify the desired top left border radius value
                    topRight: Radius.circular(
                        50), // Specify the desired top right border radius value
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          child: Container(
                            width: 250,
                            height: 7,
                            decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Scientific Name: " +
                              widget.animalDetails.scientificName,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Venomous Level: " +
                              widget.animalDetails.venomousLevel,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),
                        //Description
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.animalDetails.description,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.7,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),

                        //Appearance
                        Text(
                          "Appearance",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.animalDetails.appearance,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.7,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),

                        //Geographic Range
                        Text(
                          "Geographic Range",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.animalDetails.geographicLocation,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.7,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),

                        //Habits & Life Style
                        Text(
                          "Habits & Life Style",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.animalDetails.lifeAndHabits,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.7,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                          color: Colors.blueGrey[100],
                          indent: 30,
                          endIndent: 30,
                        ),

                        Text(
                          "More Images",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              widget.animalDetails.imageUrl1),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              widget.animalDetails.imageUrl2),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              widget.animalDetails.imageUrl),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ));
  }
}
