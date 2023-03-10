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
    apiKey: 'AIzaSyCvZ_C55M8e_9nyb1Aj1uC0SLzrlNmcgpc',
    appId: '1:733228730100:web:edde3692e52ba4367cc0a1',
    messagingSenderId: '733228730100',
    projectId: 'fir-sample-8365d',
    authDomain: 'fir-sample-8365d.firebaseapp.com',
    storageBucket: 'fir-sample-8365d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRq-3wrNNqKeNa2MfN6HCk9Z1zGEvn-X4',
    appId: '1:733228730100:android:37745ffa0e1528177cc0a1',
    messagingSenderId: '733228730100',
    projectId: 'fir-sample-8365d',
    storageBucket: 'fir-sample-8365d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyewwjYpWClXWkJCmPINxOkQD3wATVjMw',
    appId: '1:733228730100:ios:97236b621362f9567cc0a1',
    messagingSenderId: '733228730100',
    projectId: 'fir-sample-8365d',
    storageBucket: 'fir-sample-8365d.appspot.com',
    iosClientId: '733228730100-s905n16tu1mjpbj9vpe2mh7osk4bttjn.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseSample',
  );
}
