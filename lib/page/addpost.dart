import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travelbuddy/colors.dart';
import 'package:travelbuddy/modal/addpost_modal.dart';
import 'package:travelbuddy/page/bottomsheet.dart';
import 'package:travelbuddy/widget/login_info.dart';
import 'package:uuid/uuid.dart';

class Addpost extends StatefulWidget {
  const Addpost({super.key});

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  String? _selectedCountry;

  final List<String> _countries = [
    'United States',
    'Canada',
    'Mexico',
    'United Kingdom',
    'India',
    'Germany',
    'France',
    'Japan',
  ];

  bool isLoading = false;
  String? _imagePath;
  var uuid = Uuid().v1();
  String? name;
  String? userImage;

  @override
  void initState() {
    super.initState();
    requestGalleryAndCameraPermissions();
    getname();
    getimag();
  }

  Future getname() async {
    LocalDataSaver.getName().then((value) {
      if (this.mounted) {
        setState(() {
          name = value;
        });
      }
    });
  }
  Future getimag() async {
    LocalDataSaver.getImg().then((value) {
      if (this.mounted) {
        setState(() {
          userImage = value;
        });
      }
    });
  }

  void checkValue() {
    String title = titleController.text.trim();
    String description = desController.text.trim();

    if (titleController == "" || desController == "") {
      print("Please fill all fields");
    } else {
      uploaddata();
    }
  }

  Future<void> uploaddata() async {
    String posttitle = titleController.text.trim();
    String des = desController.text.trim();

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    postmodel newUser = postmodel(
      uid: uuid,
      titel: posttitle,
      description: des,
      userName: name,
      userProfile: userImage,
      photourl: imageUrl,
      Country : _selectedCountry,
    );

    if (titleController.text.isEmpty) {
    } else if (desController.text.isEmpty) {
    } else {
      // await firestore
      //     .collection('posts')
      //     .doc(FirebaseAuth.instance.currentUser!.uid)
      //     .collection("posts")
      //     .doc(uuid)
      //     .set(newUser.toMap()
      //         "id": uuid,
      //         "postimg": imageUrl,
      //         "posttitle": titleController.text,
      //         "postdes": desController.text
      //         )
      //     .then(
      //       (value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //           backgroundColor: Colors.green,
      //           content: Text("Post is upload"))),
      //     );
      await firestore
          .collection('posts')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("posts")
          .doc(uuid)
          .set(newUser.toMap())
          .then((onValue) async {
        FirebaseFirestore firestoreUser =
            FirebaseFirestore.instance;
        await firestoreUser
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          "currentUserUid": FirebaseAuth.instance.currentUser!.uid
        }).then((onValue) {
          firestoreUser
              .collection('allPost')
              .doc(uuid)
              .set(newUser.toMap()).then((value) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Post is uploaded"),
                ),
              );
            }
          });
        });
        print('Post added successfully!');
      });
    }
  }

  Future<void> requestGalleryAndCameraPermissions() async {
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      cameraStatus = await Permission.camera.request();
      if (cameraStatus.isGranted) {
        print('Camera permission granted');
      } else if (cameraStatus.isDenied) {
        print('Camera permission denied');
      } else if (cameraStatus.isPermanentlyDenied) {
        print('Camera permission permanently denied');
        openAppSettings();
      }
    }
  }

  final ImagePicker _imagePicker = ImagePicker();
  String? imageUrl;
  File? image;
  // bool isLoading = false;
  Future<void> _pickImageGallery() async {
    try {
      final res = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (res != null) {
        setState(() {
          image = File(res.path);
          _imagePath = res.path;
          print(res.path);
        });
        await uploadImageToFirebase(File(res.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("failed to pick image : $e")));
    }
  }

  Future<void> _pickImagecamera() async {
    try {
      final res = await _imagePicker.pickImage(source: ImageSource.camera);

      if (res != null) {
        setState(() {
          image = File(res.path);
          _imagePath = res.path;
          print(res.path);
        });
        await uploadImageToFirebase(File(res.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("failed to pick image : $e")));
    }
  }

  Future<void> uploadImageToFirebase(File image) async {
    print("00");
    setState(() {
      isLoading = true;
    });
    try {
      print("01");
      String currentUser = FirebaseAuth.instance.currentUser!.uid;
      Reference reference = FirebaseStorage.instance.ref().child(
          "images/$currentUser/${DateTime.now().microsecondsSinceEpoch}.png");
      print("02");
      print(currentUser);
      print(reference);
      SettableMetadata metadata = SettableMetadata(
        contentType: 'image/jpeg',
        cacheControl: 'max-age=60',
      );
      await reference.putFile(image, metadata).whenComplete(() {
        print("03");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            content: Text("Upload successfully"),
          ),
        );
      });
      imageUrl = await reference.getDownloadURL();
      print("Download URL: $imageUrl");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("failed upload image : $e"),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  void showPhotoOption() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Upload picture"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    _pickImageGallery();
                  },
                  leading: Icon(
                    Icons.photo_album,
                    color: color.thirdcolor,
                  ),
                  title: Text("Select from Gallery"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    _pickImagecamera();
                  },
                  leading: Icon(
                    Icons.camera_alt,
                    color: color.thirdcolor,
                  ),
                  title: Text("Take a photo from Camera"),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: ListView(
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: showPhotoOption,
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: image != null ? FileImage(image!) : AssetImage("assets/g.png"),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      // Container(
                      //   height: 200,
                      //    // width: 300,
                      //   decoration: BoxDecoration(
                      //     // color: Colors.red,
                      //     //   shape: BoxShape.rectangle,
                      //       image: DecorationImage(
                      //         image: image != null
                      //             ? FileImage(image!)
                      //             : AssetImage("assets/g.png")as ImageProvider,
                      //          // fit: BoxFit.fill
                      //       ),
                      //       // color: Colors.grey,
                      //       // border: Border.all(color: Colors.grey),
                      //       borderRadius: BorderRadius.circular(10.0)),
                      // ),
                      // child: CircleAvatar(
                      //   backgroundImage: (image != null)
                      //       ? FileImage(image!)
                      //       : AssetImage("assets/2.jpg"),
                      //   radius: 100,
                      // ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.00)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.00)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.00)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.00)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.00)),
                  hintText: "Title",
                  hintStyle: TextStyle(
                      // color: color.white.withOpacity(0.5),
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: desController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.00)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.00)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.00)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.00)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.00)),
                  hintText: "Description",
                  hintStyle: TextStyle(
                      // color: color.white.withOpacity(0.5),
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                value: _selectedCountry,
                decoration: InputDecoration(
                  labelText: 'Select country',
                  border: OutlineInputBorder(),
                ),
                items: _countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCountry = newValue;
                    _countryController.text = newValue!; // Update TextField with selected country
                  });
                },
              ),
              SizedBox(height: 20.0,),
              CupertinoButton(
                onPressed: () async {
                  if (imageUrl == null) {
                  } else {
                    uploaddata();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => BottomNavBar(index: 0)));
                  }
                },
                color: Colors.grey,
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
