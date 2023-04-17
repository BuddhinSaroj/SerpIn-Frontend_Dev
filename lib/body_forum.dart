import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serpin_mobile_application/post_view.dart';
import 'package:serpin_mobile_application/user_profile.dart';

import 'Services/firestore_post.dart';
import 'Utils/utils.dart';

class ForumData extends StatefulWidget {
  const ForumData({Key? key}) : super(key: key);

  @override
  State<ForumData> createState() => _ForumDataState();
}

class _ForumDataState extends State<ForumData> {
  Uint8List? _file;
  final user = FirebaseAuth.instance.currentUser!;
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;

  void postImage(String uId, String username, String profImage) async {
    setState(() {
      _isLoading = true;
    });
    try {
      print("-----------------------------Tryinggggggggggggggggggg----111");

      String res = await FirestorePost().uploadPost(
          _descriptionController.text, _file!, uId, username, profImage);

      if (res == 'success') {
        setState(() {
          _isLoading = false;
        });
        clearImage();
        print(_file.toString());
        showSnackbar('Posted', context);
      } else {
        setState(() {
          _isLoading = false;
        });
        showSnackbar(res, context);
      }
    } catch (e) {
      showSnackbar(e.toString(), context);
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  //get details from Firebase and add posts to the model structure
  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a Post'),
            children: [
              SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Take a photo'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Uint8List file = await pickImg(ImageSource.camera);
                    setState(() {
                      _file = file;
                    });
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPost()));
                  }),
              SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Choose from Gallery'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Uint8List file = await pickImg(ImageSource.gallery);
                    setState(() {
                      _file = file;
                    });
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPost()));
                  })
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _file == null
        ? Scaffold(
            // body: PostView(),
            body: SafeArea(
            child: SingleChildScrollView(
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            width: 100,
                            height: 35,
                          ),
                          // SvgPicture.asset(
                          //   'assets/serpin_logo.svg',
                          //   width: 100,
                          //   height: 35,
                          // ),
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 130),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, bottom: 8),
                              child: Container(
                                width: 350.0,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF12A69D),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Row(
                                  children: [
                                    // Left aligned profile picture
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 25.0,
                                        backgroundImage:
                                            NetworkImage(user.photoURL!),
                                      ),
                                    ),
                                    // Right aligned box with "Start a Post" hint text and image icon
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: InkWell(
                                          onTap: () {
                                            _selectImage(context);
                                          },
                                          child: Container(
                                            width: 260.0,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Hint text
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Start a Post',
                                                    style: TextStyle(
                                                        fontSize: 13.0),
                                                  ),
                                                ),
                                                // Image icon
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(Icons.image),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('posts')
                                      .orderBy('datePublished',
                                          descending: true)
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<
                                              QuerySnapshot<
                                                  Map<String, dynamic>>>
                                          snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) => PostView(
                                        snap: snapshot.data!.docs[index].data(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: clearImage,
              ),
              title: const Text('Post to Forum'),
              centerTitle: false,
              backgroundColor: Colors.transparent,
              toolbarHeight: 70,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xFFABFFDC),
                  Color(0xFFFAFEFF),
                ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  _isLoading
                      ? const LinearProgressIndicator()
                      : const Padding(padding: EdgeInsets.only(top: 0)),
                  SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        image: DecorationImage(
                            image: MemoryImage(_file!), fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL!),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Add Question / Caption ...',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 6,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(180, 50),
                      textStyle: TextStyle(fontSize: 24, fontFamily: 'Klasik'),
                      primary: Colors.green,
                      // onPrimary: kScaffoldBackground,
                    ),
                    onPressed: () =>
                        postImage(user.uid, user.displayName!, user.photoURL!),
                  ),
                ],
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
}
