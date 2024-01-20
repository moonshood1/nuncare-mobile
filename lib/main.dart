import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuncare/screens/auth/root_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_riverpod'

final theme = ThemeData(
  useMaterial3: false,
  textTheme: GoogleFonts.poppinsTextTheme(),
//   colorScheme: ColorScheme.fromSeed(
//     brightness: Brightness.dark,
//     seedColor: const Color.fromARGB(255, 0, 186, 186),
//   ),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then(
    (value) => runApp(
      ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const RootScreen(),
          theme: theme,
        ),
      ),
    ),
  );
}
