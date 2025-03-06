import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes/config/firebase_options.dart';
import 'package:homzes/data/repositories/apartment_repository.dart';
import 'package:homzes/presentation/blocs/apartment_bloc.dart';
import 'package:homzes/presentation/screens/catalog_screen.dart';
import 'package:homzes/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ApartmentRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ApartmentBloc(
              apartmentRepository: context.read<ApartmentRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Homzes',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const HomzesApp(),
        ),
      ),
    );
  }
}
