import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpin_mobile_application/user_profile.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'Utils/colors.dart';
import 'Utils/language_icons.dart';

class FirstAidScreen extends StatefulWidget {
  @override
  _FirstAidScreenState createState() => _FirstAidScreenState();
}

class _FirstAidScreenState extends State<FirstAidScreen> {
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return flag == 1
        ? SafeArea(
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
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            ToggleSwitch(
                              minWidth: 55.0,
                              minHeight: 40.0,
                              initialLabelIndex: 1,
                              cornerRadius: 50.0,
                              borderWidth: 3.0,
                              borderColor: [profiletxt],
                              activeFgColor: Colors.white,
                              inactiveBgColor: toggleColor,
                              inactiveFgColor: Colors.black,
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
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SvgPicture.asset(
                                    'assets/first-aid.svg',
                                    width: 200,
                                    height: 225,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 25, bottom: 10),
                                  child: Text(
                                    "ප්‍රථමාධාර",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF007770),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Container(
                                height: 300,
                                margin: EdgeInsets.all(16),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: profiletxt,
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: SingleChildScrollView(
                                  child: Text(
                                    "සන්සුන්ව සිටින්න - මතක තබා ගත යුතු කරුන නම් රෝගියා සන්සුන්ව තබා ගැනීමයි. බියෙන් තැති ගැනීම රෝගියාගෙ හෘද ස්පන්දන වේගය වැඩි කරයි, එමගින් විස ඉක්මනින් පැතිරීමට ඉඩ සලසයි.\n\nතුවාලය පිරිසිදු කරන්න - සබන් හා ගලා යන ජලය මගින් තුවාලය පිරිසිදු කරන්න. හැකි නම් තුවාලය හෘද මට්ටමට වඩා මදක් පහලින් තබා ගන්න. එමෙන්ම වෙලුම් පටි ආදිය තුවාලය අසල බැඳීමෙන් වලකින්න.\n\nතද ඇඳුම් ඉවත් කරන්න - සපා කෑමට ලක් වූ ප්‍රදශයේ රුධිර පරිවහනයට බාධා වන සේ පවතින තද ඇඳුම් ලිහිල් කරන්න.\n\nහැකි ඉක්මනින් ප්‍රතිකාර ලබා ගැනීම සඳහා ආසන්නයේම පවතින රෝහලට ඇතුලත් විය යුතුය.",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : SafeArea(
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
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
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
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SvgPicture.asset(
                                    'assets/first-aid.svg',
                                    width: 200,
                                    height: 225,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 25, bottom: 10),
                                  child: Text(
                                    "First-Aid",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF007770),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Container(
                                height: 300,
                                margin: EdgeInsets.all(16),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: profiletxt,
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: SingleChildScrollView(
                                  child: Text(
                                    "Keep Calm - The thing to remember is to keep the patient calm. Panic increases the patient's heart rate, allowing the venom to spread more quickly. \n\nClean the wound - Clean the wound with soap and running water. Keep the wound slightly below the level of the heart. Also, avoid tying bandages near the wound. \n\nRemove tight clothes - Loosen tight clothes that obstruct the blood circulation in the bitten area. \n\nYou should be admitted to the nearest hospital for treatment immediately.",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
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
}
