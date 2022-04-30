import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trainvel/home/home.dart';
import 'package:trainvel/result/result.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Catalog()),
      ],
      child: MaterialApp(
        title: 'Trainvel',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
          textTheme: GoogleFonts.montserratTextTheme(),
          scaffoldBackgroundColor: Colors.grey.shade200,
          cardTheme: CardTheme(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
