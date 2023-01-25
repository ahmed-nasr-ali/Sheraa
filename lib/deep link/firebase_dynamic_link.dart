// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/ad%20user%20profile/ad%20user%20profile%20screen/ad_user_profile.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/specific%20ad%20screen/specific_ad_screen.dart';

class CreateFirebaseDynamicLink {
  static Future<String> createDynamicLink(int id, bool isAd,
      {bool isUserHiddenContact = false}) async {
    String _linkMessage;

    final DynamicLinkParameters dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(isAd
          ? "https://www.sheraa.com/specifcAd?id=${id}"
          : isUserHiddenContact
              ? "https://www.sheraa.com/userProfile?true/id=${id}"
              : "https://www.sheraa.com/userProfile?id=${id}"),
      uriPrefix: "https://sheraa.page.link",
      androidParameters: AndroidParameters(
        packageName: "com.ibtdi.sheraa",
        minimumVersion: 0,
      ),
    );

    Uri uri;

    uri = await dynamicLinkParams.buildUrl();

    _linkMessage = uri.toString();

    return _linkMessage;
  }

  static Future<void> initDynamicLink(BuildContext context) async {
    print("deep link called");

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        // ignore: unawaited_futures
        // print("================================");
        // print(deepLink.toString());

        // print("navigate to message screen ${deepLink.toString()}");

        return deepLink.toString().contains("userProfile")
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdUserProfile(
                    isDeepLink: true,
                    deepLink_ad_Id: deepLink.toString(),
                  ),
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SpecificAdScreenDetails(
                    pageName:
                        "notmoreInformation", //moreInformation (second case)
                    isMyAd: false,

                    isDeepLink: true,
                    deepLink_ad_Id: deepLink.toString(),
                  ),
                ),
              );
      } else {
        print("empty");
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      // ignore: unawaited_futures
      print("navigate to message screen");

      print("================================");
      print(deepLink.toString());

      if (deepLink.toString().contains("userProfile")) {
        deepLink.toString().contains("true")
            ? print("==================true")
            : print("not contain");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AdUserProfile(
              isDeepLink: true,
              deepLink_ad_Id: deepLink.toString(),
              isHiddenContact:
                  deepLink.toString().contains("true") ? true : false,
            ),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SpecificAdScreenDetails(
              pageName: "notmoreInformation", //moreInformation (second case)
              isMyAd: false,
              isDeepLink: true,
              deepLink_ad_Id: deepLink.toString(),
            ),
          ),
        );
      }
    } else {
      print("empty");
    }
  }
}
