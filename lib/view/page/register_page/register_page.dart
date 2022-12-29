import 'dart:io';

import 'package:favorr/view/page/login_page/login_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

final ImagePicker _picker = ImagePicker();

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final imageController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    imageController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            NeumorphicButton(
              onPressed: getImage,
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 20,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              // ignore: unnecessary_null_comparison
              child: image != null
                  ? Image.file(
                      image!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.person), Text("Upload\nPhoto")],
                      ),
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -15,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Enter Name",
                    contentPadding: EdgeInsets.only(left: 10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -15,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Enter Mail",
                    contentPadding: EdgeInsets.only(left: 10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -15,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    contentPadding: EdgeInsets.only(left: 10)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            NeumorphicButton(
              onPressed: registerUser,
              child: Text(
                "Submit",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: NeumorphicStyle(
                  color: Colors.amber[300],
                  shape: NeumorphicShape.convex,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 10,
            ),
            NeumorphicButton(
              onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }))
              },
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: NeumorphicStyle(
                  color: Colors.amber[300],
                  shape: NeumorphicShape.convex,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12))),
            )
          ],
        ),
      ),
    );
  }

  File? image;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();

    // Pick an image
    final XFile? pickedImag =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(pickedImag!.path);
  }

  registerUser() async {
    if (image == null) {
      print(321);
    }
    final storage = FirebaseStorage.instanceFor();
    final storageRef = storage.ref();
    storageRef.putFile(image!);
  }
}
