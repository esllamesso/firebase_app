import 'package:firebase_app/core/reposatories/auth_repository.dart';
import 'package:firebase_app/logic/blocs/login/login_bloc.dart';
import 'package:firebase_app/logic/blocs/register/register_bloc.dart';
import 'package:firebase_app/views/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/reposatories/place_repository.dart';
import 'logic/blocs/places/place_bloc.dart';
import 'logic/blocs/places/place_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: "https://cajcwjkwlkzqrwbfswhk.supabase.co",
    publishableKey: "sb_publishable_OgrDIbMkUTGF5LuhPOvlgA_DF4Tk3M-",
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterBloc(AuthRepository())),
        BlocProvider(create: (_) => LoginBloc(AuthRepository())),
        BlocProvider(
          create: (_) => PlaceBloc(PlaceRepository())..add(GetPlacesEvent()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: WelcomeScreen(),
    );
  }
}
