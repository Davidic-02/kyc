import 'package:app_links/app_links.dart';
import 'package:kyc/features/auth_1/bloc/magic_link/magic_link_bloc.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  void init(MagicLinkBloc bloc) {
    _appLinks.uriLinkStream.listen((uri) {
      _handleUri(uri, bloc);
    });

    _appLinks.getInitialLink().then((uri) {
      if (uri != null) {
        _handleUri(uri, bloc);
      }
    });
  }

  void _handleUri(Uri uri, MagicLinkBloc bloc) {
    if (uri.toString().contains('finishSignIn') ||
        uri.queryParameters.containsKey('oobCode')) {
      bloc.add(MagicLinkEvent.verifyLink(uri.toString()));
    }
  }
}
