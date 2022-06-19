import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:train_repository/train_repository.dart';
import 'package:trainvel/home/home.dart';
import 'package:trainvel/result/cubit/trip_catalog_cubit.dart';
import 'package:trainvel/ticket_catalog/cubit/catalog_cubit.dart';
import 'package:trainvel/ticket_repository.dart';
import 'package:trainvel/user/cubit/user_cubit.dart';

void main() async {
  HydratedBlocOverrides.runZoned(
    () => runApp(const App()),
    storage: await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
    ),
  );
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
          create: (_) => CatalogCubit(TicketRepository()),
        ),
        BlocProvider(
          create: (_) => UserCubit(),
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
