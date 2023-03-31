import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar:
            false, // Set this to true to extend the body behind the app bar
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(40.0), // Specify the desired height
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0), // Specify the desired margin
              child: Transform.scale(
                scale: 2.0, // Specify the desired scale factor
                child: SizedBox(
                  width: 50, // Specify the desired width
                  height: 50, // Specify the desired height
                  child: Image.asset('assets/logo.png'),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFAFEFF),
                Color(0xFFABFFDC),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/signup.svg',
                    width: 317,
                    height: 317,
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 360,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none,
                        hintText: 'Full Name',
                        prefixIcon: Icon(Icons
                            .person), // Add an icon at the start of hint text
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 360,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none,
                        hintText: 'Email',
                        prefixIcon: Icon(Icons
                            .email), // Add an icon at the start of hint text
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 360,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none,
                        hintText: 'Password',
                        prefixIcon: Icon(Icons
                            .lock_open), // Add an icon at the start of hint text
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 360,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none,
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(Icons
                            .lock_open), // Add an icon at the start of hint text
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 360,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color(0xFF007770),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center the children horizontally
                          children: const [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xFF007770),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
        ),
      ),
    );
  }
}
