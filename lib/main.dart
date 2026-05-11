import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc/core/init/app_initializer.dart';
import 'package:kyc/core/services/deeplink_services.dart';
import 'package:kyc/features/auth/bloc/phone_auth/phone_auth_bloc.dart';
import 'package:kyc/features/auth/data/repositories/phone_auth_repository.dart';
import 'package:kyc/features/auth_1/bloc/magic_link/magic_link_bloc.dart';
import 'package:kyc/features/auth_1/repository/magic_linkrepo.dart';
import 'package:kyc/features/kyc/bloc/kyc/kyc_bloc.dart';
import 'package:kyc/features/kyc/data/repository/kyc_repository.dart';
import 'package:toastification/toastification.dart';
import 'app/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final phoneAuthBloc = PhoneAuthBloc(
    PhoneAuthRepositoryImpl(FirebaseAuth.instance, isTestMode: kDebugMode),
  );

  final magicLinkBloc = MagicLinkBloc(
    MagicLinkRepositoryImpl(FirebaseAuth.instance),
  );

  // KycBloc lives at the top level so it survives
  // across all KYC route transitions
  final kycBloc = KycBloc(KycRepositoryImpl(FirebaseFirestore.instance));

  final deepLinkService = DeepLinkService();

  runApp(
    ToastificationWrapper(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => phoneAuthBloc),
          BlocProvider(create: (_) => magicLinkBloc),
          BlocProvider(create: (_) => kycBloc),
        ],
        child: AppInitializer(
          deepLinkService: deepLinkService,
          magicLinkBloc: magicLinkBloc,
          child: const App(),
        ),
      ),
    ),
  );
}
