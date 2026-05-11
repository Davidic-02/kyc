import 'package:flutter/material.dart';
import 'package:kyc/core/services/deeplink_services.dart';
import 'package:kyc/features/auth_1/bloc/magic_link/magic_link_bloc.dart';

class AppInitializer extends StatefulWidget {
  final Widget child;
  final DeepLinkService deepLinkService;
  final MagicLinkBloc magicLinkBloc;

  const AppInitializer({
    super.key,
    required this.child,
    required this.deepLinkService,
    required this.magicLinkBloc,
  });

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  @override
  void initState() {
    super.initState();

    widget.deepLinkService.init(widget.magicLinkBloc);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
