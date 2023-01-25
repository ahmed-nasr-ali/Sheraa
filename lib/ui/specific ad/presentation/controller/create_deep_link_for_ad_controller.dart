import 'package:share/share.dart';
import 'package:sheraa/deep%20link/firebase_dynamic_link.dart';

class CreateDeepLinkForAdController {
  static Future createDeeepLink(int adId) async {
    String _generateLink = await CreateFirebaseDynamicLink.createDynamicLink(
      adId,
      true,
    );
    print(_generateLink);

    await Share.share(_generateLink);
  }
}
