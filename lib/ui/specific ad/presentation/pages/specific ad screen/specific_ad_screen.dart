// ignore_for_file: must_be_immutable, unused_local_variable, unused_field, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/get_specific_ad_provider.dart';
import 'package:sheraa/ui/specific%20ad/presentation/controller/get_comments_controller.dart';
import 'package:sheraa/ui/specific%20ad/widgets/ad%20price/ad_price.dart';
import 'package:sheraa/ui/specific%20ad/widgets/ad%20specifications/ad_specifications_widget.dart';
import 'package:sheraa/ui/specific%20ad/widgets/ad%20views%20and%20statistics/ad_views_and_statistics.dart';
import 'package:sheraa/ui/specific%20ad/widgets/ad_image/ad_image_widget.dart';
import 'package:sheraa/ui/specific%20ad/widgets/add%20location/ad_location.dart';
import 'package:sheraa/ui/specific%20ad/widgets/comment%20body/comment_body.dart';
import 'package:sheraa/ui/specific%20ad/widgets/communication%20part/communication_part.dart';
import 'package:sheraa/ui/specific%20ad/widgets/make%20your%20ad%20special%20or%20vip/make_your_ad_special_or_vip.dart';
import 'package:sheraa/ui/specific%20ad/widgets/request%20buy%20ad/request_buy_ad.dart';
import 'package:sheraa/ui/specific%20ad/widgets/save%20ad/save_ad.dart';
import 'package:sheraa/ui/specific%20ad/widgets/send%20comment/send_comment.dart';
import 'package:sheraa/ui/specific%20ad/widgets/user%20profile/user_profile.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:sheraa/utils/error.dart';

class SpecificAdScreenDetails extends StatefulWidget {
  String pageName;
  bool isMyAd;
  AdEntity? adDetails;
  bool isDeepLink;
  String deepLink_ad_Id;
  bool navigateToAdUserProfile;
  SpecificAdScreenDetails({
    Key? key,
    required this.pageName,
    this.adDetails,
    required this.isMyAd,
    this.isDeepLink = false,
    this.deepLink_ad_Id = "",
    this.navigateToAdUserProfile = false,
  }) : super(key: key);

  @override
  State<SpecificAdScreenDetails> createState() =>
      _SpecificAdScreenDetailsState();
}

class _SpecificAdScreenDetailsState extends State<SpecificAdScreenDetails> {
  final _controller = ScrollController();

  bool _isLoading = false;

  double? _height;

  double? _width;

  Future<AdEntity>? _adDetails;

  bool initialRun = true;

  int pageNo = 2;

  Future pagenationApi() async {
    await GetCommentsController.pagenationApi(
        context,
        widget.isDeepLink
            ? widget.deepLink_ad_Id.split("=")[1]
            : widget.adDetails!.id.toString());
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        pagenationApi();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.isDeepLink) {
      if (initialRun) {
        _adDetails = Provider.of<GetSpecificAdProvider>(context, listen: false)
            .getSpecificAdData(context, widget.deepLink_ad_Id.split("=")[1]);

        initialRun = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build specifc ad screen");
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
        child: PageContainer(
      child: Scaffold(
        body: widget.isDeepLink
            ? buildAdBodyDependOnDeepLink()
            : _isLoading
                ? Center(
                    child: SpinKitFadingCircle(color: mainAppColor),
                  )
                : ListView(
                    controller: _controller,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //(صور الاعلان )
                          AdImageWidget(
                            adId: widget.adDetails!.id ?? 0,
                            adImages: widget.adDetails!.image!.isEmpty
                                ? []
                                : widget.adDetails!.image ?? [],
                            isFavorteAd: widget.adDetails!.isFavorite ?? false,
                          ),

                          ///(مشاهدات الاعلان و الاحصائيات )
                          AdViewsAndStatistics(
                            adID: widget.adDetails!.id ?? 0,
                            pageName: widget.pageName,
                            adViews: widget.adDetails!.views.toString(),
                          ),

                          ///(مواصفات الاعلان و وصف الاعلان)
                          AdSpecificationsAndDecribtionWidget(
                            adID: (widget.adDetails!.id).toString(),
                            adName: widget.adDetails!.name ?? "",
                            adSingleOptions:
                                widget.adDetails!.singleSelection ?? [],
                            adMultiOptions:
                                widget.adDetails!.multiSelection ?? [],
                            adDescribtion: widget.adDetails!.description ?? "",
                            adCreatedAt: widget.adDetails!.createdAt ?? "",
                          ),

                          ///(سعر الاعلان  )
                          ///( لو غير كدا دخل اي اسمpageName=MyAdلو دا اعلاني )
                          AdPrice(
                            ad_Id: widget.adDetails!.id ?? 0,
                            pageName: widget.isMyAd ? "MyAd" : "notMyAd",
                            adPrice: widget.adDetails!.price ?? "",
                          ),

                          ///(موقع الاعلان)
                          AdLocation(
                            adCity: widget.adDetails!.city == null
                                ? "لا يوجد مدينة"
                                : widget.adDetails!.city!.name ?? "",
                            adArea: widget.adDetails!.area!.name ?? "",
                          ),

                          ///(اظهار الجزء الخاص بالمستخدم الي رفع الاعلان )
                          ///pageName = Myad(انا الي رافع الاعلان )
                          UserProfile(
                            userDetails: widget.adDetails!.user!,
                            pageName: widget.isMyAd ? "MyAd" : "notMyAd",
                            navigateToAdUserProfile:
                                widget.navigateToAdUserProfile,
                            isHiddenContact:
                                widget.adDetails!.hideContacts ?? false,
                          ),

                          ///(الجزء الخاص بالاتصال و الوتساب و طلب شراء اعلان )
                          ///pagename = MyAd (هيظهر الجزء دا غير كدا مش هيظهره)
                          CommunicationPart(
                            pageName: widget.isMyAd ? "MyAd" : "notMyAd",
                            userphoneNUmber:
                                widget.adDetails!.user!.phone ?? "",
                            isHiddenContact:
                                widget.adDetails!.hideContacts ?? false,
                          ),

                          RequestBuyAd(
                            adId: widget.adDetails!.id ?? 0,
                            adImageUrl: widget.adDetails!.image!.isEmpty
                                ? ""
                                : widget.adDetails!.image![0],
                            adName: widget.adDetails!.name ?? "",
                            adPrice: widget.adDetails!.price ?? "",
                            userName: widget.adDetails!.user!.name ?? "",
                            pageName: widget.isMyAd ? "MyAd" : "notMyAd",
                            userID: (widget.adDetails!.user!.id).toString(),
                          ),

                          SaveAd(
                            adDetails: widget.adDetails!,
                          ),

                          MakeYourAdSpecialOrVip(
                            pageName: widget.isMyAd ? "MyAd" : "notMyAd",
                          ),

                          (widget.adDetails!.disableComments ?? false)
                              ? Container()
                              : SendCommentPart(
                                  adId: widget.adDetails!.id ?? 0,
                                  commentsNumber:
                                      (widget.adDetails!.commentsCount)
                                          .toString(),
                                ),

                          (widget.adDetails!.disableComments ?? false)
                              ? Container()
                              : CommentBodyWidget(
                                  ad_Id: widget.isDeepLink
                                      ? widget.deepLink_ad_Id.split("=")[1]
                                      : widget.adDetails!.id.toString(),
                                )
                        ],
                      ),
                    ],
                  ),
      ),
    ));
  }

  Widget buildAdBodyDependOnDeepLink() {
    return FutureBuilder<AdEntity>(
      future: _adDetails,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: SpinKitFadingCircle(color: mainAppColor),
            );

          case ConnectionState.active:
            return Text("");

          case ConnectionState.waiting:
            return Center(
              child: SpinKitFadingCircle(color: mainAppColor),
            );

          case ConnectionState.done:
            if (snapshot.hasError)
              return Error(
                errorMessage: AppLocalizations.of(context)!.translate('error'),
                onRetryPressed: () {},
              );
            else {
              return ListView(
                controller: _controller,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // (صور الاعلان )
                      AdImageWidget(
                        adId: snapshot.data!.id ?? 0,
                        adImages: snapshot.data!.image!.isEmpty
                            ? []
                            : snapshot.data!.image!,
                        isFavorteAd: snapshot.data!.isFavorite ?? false,
                      ),

                      ///(مشاهدات الاعلان و الاحصائيات )
                      AdViewsAndStatistics(
                        adID: snapshot.data!.id ?? 0,
                        pageName: widget.pageName,
                        adViews: snapshot.data!.views.toString(),
                      ),

                      ///(مواصفات الاعلان و وصف الاعلان)
                      AdSpecificationsAndDecribtionWidget(
                        adID: (snapshot.data!.id ?? 0).toString(),
                        adName: snapshot.data!.name ?? "لا يوجد اسم للاعلان",
                        adSingleOptions: snapshot.data!.singleSelection ?? [],
                        adMultiOptions: snapshot.data!.multiSelection ?? [],
                        adDescribtion:
                            snapshot.data!.description ?? "لا يوجد وصف للاعلان",
                        adCreatedAt: snapshot.data!.createdAt ?? "",
                      ),

                      ///(سعر الاعلان  )
                      ///( لو غير كدا دخل اي اسمpageName=MyAdلو دا اعلاني )
                      AdPrice(
                          ad_Id: snapshot.data!.id ?? 0,
                          pageName: widget.isMyAd ? "MyAd" : "notMyAd",
                          adPrice: snapshot.data!.price ?? ""),

                      ///(موقع الاعلان)
                      AdLocation(
                          adCity: snapshot.data!.city == null
                              ? "لا يوجد مدينة"
                              : snapshot.data!.city!.name ?? "",
                          adArea: snapshot.data!.area!.name ?? ""),

                      ///(اظهار الجزء الخاص بالمستخدم الي رفع الاعلان )
                      ///pageName = Myad(انا الي رافع الاعلان )
                      UserProfile(
                        userDetails: snapshot.data!.user!,
                        pageName: widget.isMyAd ? "MyAd" : "notMyAd",
                        isHiddenContact: snapshot.data!.hideContacts ?? false,
                      ),

                      // /(الجزء الخاص بالاتصال و الوتساب و طلب شراء اعلان )
                      // /pagename = MyAd (هيظهر الجزء دا غير كدا مش هيظهره)
                      CommunicationPart(
                        pageName: widget.isMyAd ? "MyAd" : "notMyAd",
                        userphoneNUmber: snapshot.data!.user!.phone ?? "",
                        isHiddenContact: snapshot.data!.hideContacts ?? false,
                      ),

                      RequestBuyAd(
                        adId: snapshot.data!.id ?? 0,
                        adImageUrl: snapshot.data!.image!.isEmpty
                            ? ""
                            : snapshot.data!.image![0],
                        adName: snapshot.data!.name ?? "لا يوجد اسم للاعلان",
                        adPrice: snapshot.data!.price ?? "",
                        userName: snapshot.data!.user!.name ?? "",
                        pageName:
                            // widget.isMyAd ?
                            "MyAd",
                        //  : "notMyAd",
                        userID: (snapshot.data!.user!.id).toString(),
                      ),

                      SaveAd(
                        adDetails: snapshot.data!,
                      ),

                      MakeYourAdSpecialOrVip(
                        pageName: widget.isMyAd ? "MyAd" : "notMyAd",
                      ),
                      (snapshot.data!.disableComments ?? true)
                          ? Container()
                          : SendCommentPart(
                              adId: snapshot.data!.id ?? 0,
                              commentsNumber:
                                  (snapshot.data!.commentsCount ?? 0)
                                      .toString(),
                            ),

                      (snapshot.data!.disableComments ?? true)
                          ? Container()
                          : CommentBodyWidget(
                              ad_Id: snapshot.data!.id.toString(),
                            )
                    ],
                  )
                ],
              );
            }
        }
      },
    );
  }
}
