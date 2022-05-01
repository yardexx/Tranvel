import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trainvel/home/home.dart';
import 'package:trainvel/result/cubit/trip_catalog_cubit.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const App()),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return BlocProvider(
        create: (_) => TripCatalogCubit(),
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
        ));
  }
}
