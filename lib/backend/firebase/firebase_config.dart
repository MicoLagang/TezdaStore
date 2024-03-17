import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBWOTfPV9gjslEjZbHY1W9uGE4Y4EFr3Jg",
            authDomain: "tezdastore-60965.firebaseapp.com",
            projectId: "tezdastore-60965",
            storageBucket: "tezdastore-60965.appspot.com",
            messagingSenderId: "1072831597212",
            appId: "1:1072831597212:web:db78cb7763b3dc2e453b59",
            measurementId: "G-CHG4TJL4GF"));
  } else {
    await Firebase.initializeApp();
  }
}
