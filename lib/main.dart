import 'package:flutter/material.dart';
// import 'package:nuncare/common/colors.dart';
import 'package:nuncare/screens/auth/root_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final theme = ThemeData(
  useMaterial3: false,
  textTheme: GoogleFonts.poppinsTextTheme(),
  // colorScheme: ColorScheme.fromSeed(
  //   brightness: Brightness.dark,
  //   seedColor: const Color.fromARGB(255, 0, 186, 186),
  // ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then(
    (value) => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const RootScreen(),
        theme: theme,
      ),
    ),
  );
}
