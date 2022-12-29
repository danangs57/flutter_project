import 'package:favorr/view/page/home/home_page.dart';
import 'package:favorr/view/page/login_page/login_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({Key? key}) : super(key: key);

  @override
  State<UploadPostPage> createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        centerTitle: true,
        leading:
            NeumorphicButton(onPressed: () => {}, child: Icon(Icons.person)),
        title: Column(children: [
          Text(
            "Create Favor",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            child: Text(
              'Bekasi Edition',
              style: TextStyle(fontSize: 12),
            ),
          )
        ]),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          NeumorphicButton(
            onPressed: () => {},
            style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: 20,
                lightSource: LightSource.topLeft,
                color: Colors.white),
            child: Container(
              height: 100,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.photo), Text("Upload\nPhoto")],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: -10,
                lightSource: LightSource.topLeft,
                color: Colors.white),
            child: TextField(
              decoration: InputDecoration(
                  hintMaxLines: 5,
                  hintText: "Enter Favor",
                  contentPadding: EdgeInsets.only(left: 10, top: 10)),
              minLines: 4,
              maxLines: 4,
              maxLength: 50,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: -15,
                lightSource: LightSource.topLeft,
                color: Colors.white),
            child: DropdownButtonFormField<int>(
              items: [
                DropdownMenuItem(
                  child: Text("Tambun"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Babelan"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("Pekayon"),
                  value: 3,
                ),
                DropdownMenuItem(
                  child: Text("Burangkeng"),
                  value: 4,
                ),
                DropdownMenuItem(
                  child: Text("Cimuning"),
                  value: 5,
                )
              ],
              onChanged: (value) => {},
              decoration: InputDecoration(
                  hintText: "Select Area",
                  contentPadding: EdgeInsets.only(left: 10)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          NeumorphicButton(
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HomePage();
              }))
            },
            child: Text(
              "Back",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: NeumorphicStyle(
                color: Colors.amber[300],
                shape: NeumorphicShape.convex,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12))),
          ),
        ]),
      ),
    );
  }
}
