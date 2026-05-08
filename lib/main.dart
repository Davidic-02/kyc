import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc/features/auth/bloc/phone_auth/phone_auth_bloc.dart';
import 'package:kyc/features/auth/data/repositories/phone_auth_repository.dart';
import 'app/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PhoneAuthBloc(
            PhoneAuthRepositoryImpl(
              FirebaseAuth.instance,
              isTestMode: kDebugMode, // true in debug, false in release
            ),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
