import 'package:favorr/view/widget/post_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.of(context)!.isUsingDark
          ? Colors.blueGrey
          : Colors.grey[100],
      appBar: NeumorphicAppBar(
        centerTitle: true,
        actions: [
          Switch(
              value: NeumorphicTheme.of(context)!.isUsingDark,
              onChanged: (value) {
                if (NeumorphicTheme.of(context)!.isUsingDark) {
                  NeumorphicTheme.of(context)!.themeMode = ThemeMode.light;
                } else {
                  NeumorphicTheme.of(context)!.themeMode = ThemeMode.dark;
                }
              })
        ],
        leading:
            NeumorphicButton(onPressed: () => {}, child: Icon(Icons.person)),
        title: Column(children: [
          Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            child: Text(
              '',
              style: TextStyle(fontSize: 12),
            ),
          )
        ]),
      ),
      body: ListView(padding: EdgeInsets.all(10), children: [
        NeumorphicButton(
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 20,
              lightSource: LightSource.topLeft,
              color: Colors.white),
          child: Container(
            height: 180,
            width: 80,
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Danang Satriani",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "danang@danang.com",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 180,
                    child: NeumorphicButton(
                      onPressed: _signOut,
                      margin: EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.exit_to_app), Text("Logout")],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Your Post",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        PostWidget(),
        PostWidget(),
        PostWidget(),
        PostWidget(),
        PostWidget(),
      ]),
    );
  }
}
