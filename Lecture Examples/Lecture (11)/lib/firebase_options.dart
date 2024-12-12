// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2Oc_Fv2Ws7lwMjLNmYH6eCEVowg2cC9A',
    appId: '1:1054007045980:android:15bea051ac0bbb5f6a5b99',
    messagingSenderId: '1054007045980',
    projectId: 'fchat-6a080',
    storageBucket: 'fchat-6a080.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4TkgG_gbPO--PiDxddVJdmxCiwjF-ir4',
    appId: '1:1054007045980:ios:506512d7aca0fea96a5b99',
    messagingSenderId: '1054007045980',
    projectId: 'fchat-6a080',
    storageBucket: 'fchat-6a080.appspot.com',
    androidClientId: '1054007045980-ktll73fli5cqs3dcoce85gase84r8r8h.apps.googleusercontent.com',
    iosClientId: '1054007045980-9qbc4m9cpe26cmpj4eugq4huns7b4ct0.apps.googleusercontent.com',
    iosBundleId: 'com.cne.profileApp',
  );
}