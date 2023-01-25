// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/custom_widgets/succes%20operation%20bottom%20sheet/increase_views_and_account_upgrade.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/account%20upgrade/account_upgrade_provider.dart';
import 'package:sheraa/providers/increase%20views/increase_views_provider.dart';
import 'package:sheraa/providers/navigation_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';
import 'package:sheraa/ui/more/balance/payment%20method/network%20payment/network_payment.dart';
import 'package:sheraa/ui/more/balance/payment%20method/payment%20widget/payment_operation_widget.dart';
import 'package:sheraa/ui/more/balance/terms%20and%20conditions%20screen/terms_and_conditions_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class PaymentMethodScreen extends StatefulWidget {
  String pageName;
  Map? body;
  PaymentMethodScreen({
    Key? key,
    required this.pageName,
    this.body,
  }) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.body);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
        child: PageContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset("assets/images/arrow_simple_chock.png")),
          title: SmallText(
              color: blackColor,
              size: _height / 50.75, //16
              typeOfFontWieght: 1,
              text: AppLocalizations.of(context)!.translate("Pay by")),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: _height / 162.4,
                  ),
                  Container(
                    width: _width,
                    color: secondryMainColor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: _height / 62.46153846153846, //13
                        ),
                        SmallText(
                          color: blackColor,
                          size: _height / 67.66666666666667, //12
                          text: AppLocalizations.of(context)!
                              .translate("requerd money"),
                          typeOfFontWieght: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallText(
                              color: blackColor,
                              size: _height / 33.83333333333333, //24
                              text: "200",
                              typeOfFontWieght: 1,
                            ),
                            SizedBox(
                              width: _width / 187.5, //2
                            ),
                            SmallText(
                              color: blackColor,
                              size: _height / 67.66666666666667, //12
                              text: AppLocalizations.of(context)!
                                  .translate("rial"),
                              typeOfFontWieght: 0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _height / 32.48, //25
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height / 54.13333333333333, //15
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: _width / 22.05882352941176 //17
                        ),
                    width: _width,
                    // height: 142,
                    decoration: BoxDecoration(
                        color: secondryMainColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        PaymentOperationWidget(
                            rightText: AppLocalizations.of(context)!
                                .translate("The operation"),
                            leftText: AppLocalizations.of(context)!.translate(
                                "Featured ad, number of days: 2 days")),
                        PaymentOperationWidget(
                            rightText: AppLocalizations.of(context)!
                                .translate("Discount"),
                            leftText: "0 " +
                                AppLocalizations.of(context)!
                                    .translate("rial")),
                        PaymentOperationWidget(
                            rightText: AppLocalizations.of(context)!
                                .translate("Value added tax"),
                            leftText: "0 " +
                                AppLocalizations.of(context)!
                                    .translate("rial")),
                        PaymentOperationWidget(
                          rightText: AppLocalizations.of(context)!
                              .translate("the total"),
                          leftText: "0 " +
                              AppLocalizations.of(context)!.translate("rial"),
                          isDivider: 2,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height / 81.2, //10
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _width / 25, //15
                      ),
                      SmallText(
                          color: blackColor,
                          size: _height / 67.66666666666667, //12
                          typeOfFontWieght: 1,
                          text: AppLocalizations.of(context)!.translate(
                              "Pay by one of the following methods")),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NetworkPaymentScreen()));
                        },
                        child: Container(
                          width: _width / 22.05882352941176, //17
                          height: _height / 47.76470588235294, //17
                          margin:
                              EdgeInsets.symmetric(horizontal: _width / 125),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/question-fill.png"))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height / 67.66666666666667,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _width / 23.4375, //16
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                              width: _width / 3.571428571428571, //105
                              height: _height / 10.82666666666667, //75
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(_height / 81.2),
                                  border:
                                      Border.all(color: Colors.grey.shade200)),
                              child: Center(
                                child:
                                    Image.asset("assets/images/visa_PNG4.png"),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                              width: _width / 3.571428571428571, //105
                              height: _height / 10.82666666666667, //75
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(_height / 81.2),
                                  border:
                                      Border.all(color: Colors.grey.shade200)),
                              child: Center(
                                child: Image.asset("assets/images/bank.png"),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                              width: _width / 3.571428571428571, //105
                              height: _height / 10.82666666666667, //75
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(_height / 81.2),
                                  border:
                                      Border.all(color: Colors.grey.shade200)),
                              child: Center(
                                child: Image.asset("assets/images/mada.png"),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height / 81.2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _width / 23.4375, //16
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                              width: _width / 3.571428571428571, //105
                              height: _height / 10.82666666666667, //75
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(_height / 81.2),
                                  border:
                                      Border.all(color: Colors.grey.shade200)),
                              child: Center(
                                child:
                                    Image.asset("assets/images/visa_PNG4.png"),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                              width: _width / 3.571428571428571, //105
                              height: _height / 10.82666666666667, //75
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(_height / 81.2),
                                  border:
                                      Border.all(color: Colors.grey.shade200)),
                              child: Center(
                                child: Image.asset("assets/images/bank.png"),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                              width: _width / 3.571428571428571, //105
                              height: _height / 10.82666666666667, //75
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(_height / 81.2),
                                  border:
                                      Border.all(color: Colors.grey.shade200)),
                              child: Center(
                                child: Image.asset("assets/images/mada.png"),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height / 81.2, //10
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _width / 23.4375, //16
                      ),
                      Image.asset("assets/images/vuesax.png"),
                      SizedBox(
                        width: _width / 75, //5
                      ),
                      SmallText(
                          size: _height / 81.2,
                          color: blackColor,
                          text: AppLocalizations.of(context)!
                              .translate("100% Safe and Guaranteed"))
                    ],
                  ),
                  SizedBox(
                    height: _height / 36.90909090909091, //22
                  ),
                  CustomButton(
                      enableVerticalMargin: false,
                      enableHorizontalMargin: true,
                      horizontalMargin: _width / 12.5, //115
                      width: _width,
                      height: _height / 16.24, //50
                      btnLbl:
                          AppLocalizations.of(context)!.translate("pay_off"),
                      onPressedFunction: () async {
                        ///todo
                        print(widget.body);

                        if (widget.pageName == "increase views") {
                          ///customer user
                          print("increase views");
                          if (UserData.getUserType() == "") {
                            print("customer icrease views");
                            bool x = await Provider.of<IncreaseVeiwsProvider>(
                                    context,
                                    listen: false)
                                .increaseViewsforAdtoCustomer(
                              context,
                              widget.body ?? {},
                            );
                            if (x) {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child:
                                            IncreaseViewsOrAccountupgardeSucces(
                                          pageName: "increase views",
                                        ));
                                  });
                            }
                          }

                          /// seller or store user
                          else {
                            print("seller or store icrease views");

                            bool x = await Provider.of<IncreaseVeiwsProvider>(
                                    context,
                                    listen: false)
                                .increaseViewsforAdtoSellerOrStore(
                              context,
                              widget.body ?? {},
                            );
                            if (x) {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child:
                                            IncreaseViewsOrAccountupgardeSucces(
                                          pageName: "increase views",
                                        ));
                                  });
                            }
                          }
                        }
                        if (widget.pageName == "account upgrade seller") {
                          bool x =
                              await Provider.of<AccountUpgradeToSellerOrStore>(
                            context,
                            listen: false,
                          ).accountUpgradedataToSellerOrStore(
                            context,
                            widget.body ?? {},
                          );

                          if (x) {
                            UserData.setUserType("seller");
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child:
                                          IncreaseViewsOrAccountupgardeSucces(
                                        pageName: "account upgarde",
                                      ));
                                });
                          }
                        }

                        if (widget.pageName == "account upgrade store") {
                          bool x =
                              await Provider.of<AccountUpgradeToSellerOrStore>(
                            context,
                            listen: false,
                          ).accountUpgradedataToSellerOrStore(
                            context,
                            widget.body ?? {},
                          );

                          if (x) {
                            UserData.setUserType("store");
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child:
                                          IncreaseViewsOrAccountupgardeSucces(
                                        pageName: "account upgarde",
                                      ));
                                });
                          }
                        }
                      },
                      btnColor: whiteColor,
                      btnStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mainAppColor,
                          fontSize: _height / 58),
                      borderColor: mainAppColor),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _width / 18.75, vertical: _height / 40.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.translate("common questions"),
                    style: TextStyle(
                        fontSize: _height / 67.66666666666667, //12
                        decoration: TextDecoration.underline,
                        color: mainAppColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TermsAndConditionsScreen()));
                    },
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate("Terms and Conditions"),
                      style: TextStyle(
                          fontSize: _height / 67.66666666666667, //12
                          decoration: TextDecoration.underline,
                          color: mainAppColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
