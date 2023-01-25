// ignore_for_file: must_be_immutable, unused_field, unnecessary_statements

import 'package:flutter/material.dart';
import 'package:sheraa/providers/401_auth_error.dart';

import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/user_information.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/ad%20user%20profile/ad%20user%20profile%20screen/ad_user_profile.dart';

class UserProfile extends StatelessWidget {
  UserEntity userDetails;
  String pageName;

  bool navigateToAdUserProfile;
  bool isHiddenContact;
  UserProfile({
    Key? key,
    required this.userDetails,
    required this.pageName,
    this.navigateToAdUserProfile = false,
    required this.isHiddenContact,
  }) : super(key: key);

  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        pageName == "MyAd"
            ? UserINformation(
                userDetails: userDetails,
                showViewsNo: false,
                userState: false,
                centerResponseSpeed: false,
                topSizebosHeight: _height! / 47.76470588235294, //17,
                bottomSizboxHeight: _height! / 54.13333333333333, //15 ,
                dividerThickness: _height! / 162.4, //5
                onTap: () {},
                splashEffect: true,
              )
            : UserINformation(
                userDetails: userDetails,
                showViewsNo: false,
                userState: true,
                centerResponseSpeed: false,
                topSizebosHeight: _height! / 54.13333333333333, //  15,
                bottomSizboxHeight: _height! / 40.6, //20,
                dividerThickness: _height! / 162.4, //20,
                splashEffect: true,
                onTap: () {
                  if (!unAuthUser(context)) {
                    navigateToAdUserProfile
                        ? null
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdUserProfile(
                                userDetails: userDetails,
                                isHiddenContact: isHiddenContact,
                              ),
                            ),
                          );
                  }
                },
              ),
      ],
    );
  }
}
