// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDmux8JLq4G8BkZ-TuJCRYxZYcT0U5Opb4',
    appId: '1:74666616754:web:280a5eddc0125d6d62a6ab',
    messagingSenderId: '74666616754',
    projectId: 'favorr-2b2d5',
    authDomain: 'favorr-2b2d5.firebaseapp.com',
    storageBucket: 'favorr-2b2d5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOcnVaewpKEe5296V_rG-NDd26vp2tXPQ',
    appId: '1:74666616754:android:fa92dc35e8efacc062a6ab',
    messagingSenderId: '74666616754',
    projectId: 'favorr-2b2d5',
    storageBucket: 'favorr-2b2d5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCel13v15jrxoMDyVvJ9jzerVAInIA9USs',
    appId: '1:74666616754:ios:86828e43e422c9f962a6ab',
    messagingSenderId: '74666616754',
    projectId: 'favorr-2b2d5',
    storageBucket: 'favorr-2b2d5.appspot.com',
    iosClientId: '74666616754-ag2a12pvc9nqd5vtc5daud3a194tg2h4.apps.googleusercontent.com',
    iosBundleId: 'com.example.favorr',
  );
}
