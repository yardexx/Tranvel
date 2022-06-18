import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:train_repository/train_repository.dart';
import 'package:trainvel/home/home.dart';
import 'package:trainvel/result/cubit/trip_catalog_cubit.dart';
import 'package:trainvel/ticket_catalog/bloc/catalog_bloc.dart';
import 'package:trainvel/ticket_repository.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const App()),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TripCatalogCubit(TrainRepository()),
        ),
        BlocProvider(
          create: (_) => CatalogBloc(TicketRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Trainvel',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
          appBarTheme: AppBarTheme.of(context).copyWith(
            centerTitle: true,
          ),
          textTheme: GoogleFonts.montserratTextTheme(),
          // scaffoldBackgroundColor: Colors.grey.shade200,
          bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
          ),
          cardTheme: CardTheme.of(context).copyWith(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        home: const SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}
