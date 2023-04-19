import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:serpin_mobile_application/user_profile.dart';

import 'Utils/colors.dart';
import 'identified_list.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _image;
  var pred;
  var decoded;
  var animalType;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return _image == null
        ? SafeArea(
            child: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFABFFDC), Color(0xFFFAFEFF)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Center(
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
                      Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: GestureDetector(
                          onTap: () => pickImageFile(ImageSource.camera),
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: h * 0.1,
                            width: w * 0.75,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF12A69D),
                                    blurRadius: 2,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: Offset(-4, -4),
                                  ),
                                ]),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(
                                      left: 25,
                                    ),
                                    height: 30,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/cam.png'),
                                            fit: BoxFit.contain))),
                                SizedBox(width: 20),
                                Text(
                                  "Capture via Camera",
                                  style: TextStyle(
                                    color: Color(0xFF575E67),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () => pickImageFile(ImageSource.gallery),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: h * 0.1,
                          width: w * 0.75,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF12A69D),
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: Offset(-4, -4),
                                ),
                              ]),
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(
                                    left: 25,
                                  ),
                                  height: 40,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/gallery.png'),
                                          fit: BoxFit.contain))),
                              SizedBox(width: 15),
                              Text(
                                "Select via Gallery",
                                style: TextStyle(
                                  color: Color(0xFF575E67),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                      SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: dashBorder(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.5,
                            //margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                //color: Colors.red,
                                image:
                                    DecorationImage(image: FileImage(_image!))),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ImageUpload()),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                //minimumSize: const Size(360.0, 55.0),
                                side: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              child: const Text(
                                'Close',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(width: 40),
                            ElevatedButton(
                              onPressed: () async {
                                pred = await uploadImage(_image!);
                                decoded = jsonDecode(pred);
                                animalType = decoded['prediction'];
                                await loadListPage();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: profiletxt,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                //minimumSize: const Size(360.0, 55.0),
                                side: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              child: const Text(
                                'Process',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text("$disease", style: TextStyle(fontSize: 20, color: Colors.white,),)
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget dashBorder({required Widget child}) => DottedBorder(
        color: Colors.grey[400]!,
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        dashPattern: [8, 4],
        child: child,
      );

  void clearImage() {
    setState(() {
      _image = null;
    });
  }

  Future pickImageFile(ImageSource source) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);

      if (_image == null) return;

      final tempImage = File(_image.path);
      setState(() => this._image = tempImage);
    } on PlatformException catch (e) {
      print("Image pick failed: $e");
    }
  }

  // Future<String> uploadImage() async {

  //   final response = await http.MultipartRequest("POST",Uri.parse("http://127.0.0.1:4000/predict")); // Create a MultipartRequest with POST method and URL
  //   final headers = {"Content-Type": "multipart/form-data"}; // Set headers
  //
  //   response.files.add(http.MultipartFile('file', _image!.readAsBytes().asStream(), _image!.lengthSync(),filename: _image!.path.split("/").last)); // Add the image file to the request
  //   response.headers.addAll(headers); // Add headers to the request
  //   final reqResponse = await response.send(); // Send the request and get the response
  //   http.Response res = await http.Response.fromStream(reqResponse); // Convert the response to http.Response
  //   setState(() {}); // Update the state, if needed
  //
  //   return res.body; // Return the response body as a string
  // }

  Future<String?> uploadImage(File imageFile) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:4000/predict'));

    // Add the image file to the request
    request.files
        .add(await http.MultipartFile.fromPath('file', imageFile.path));
    print(request);
    var response = await request.send();

    if (response.statusCode == 200) {
      // Decode the response body from bytes to string
      print("Status 200");
      String responseBody = await response.stream.bytesToString();
      print('Response: $responseBody');
      return responseBody;
    } else {
      print('Failed to upload image');
      return null;
    }
  }

  loadListPage() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => IdentifyList(animalType: animalType)));
  }
}
