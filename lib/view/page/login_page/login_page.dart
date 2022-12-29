import 'package:favorr/view/page/home/home_page.dart';
import 'package:favorr/view/page/register_page/register_page.dart';
import 'package:favorr/view/page/splash_page/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
            FlutterLogo(
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 8,
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
                  depth: 8,
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
              onPressed: login,
              child: Text(
                "Login",
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
                  return RegisterPage();
                }))
              },
              child: Text(
                "Register",
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

  login() async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    // ignore: unnecessary_null_comparison
    if (user == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return SplashPage();
      }));
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }
}
