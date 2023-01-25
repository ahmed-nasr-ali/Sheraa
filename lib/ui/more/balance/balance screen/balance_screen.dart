// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/balance/choose%20the%20amount/Choose_the_amount.dart';
import 'package:sheraa/ui/more/balance/current%20balance/current_balance.dart';
import 'package:sheraa/ui/more/balance/terms%20and%20conditions%20screen/terms_and_conditions_screen.dart';
import 'package:sheraa/ui/more/balance/transaction%20history/transaction_history.dart';
import 'package:sheraa/utils/app_colors.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
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
            text: AppLocalizations.of(context)!.translate("wallet")),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: _height / 162.4, //5
                ),
                Container(
                  width: double.maxFinite,
                  color: secondryMainColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: _height / 40.6 //20
                          ),
                      Image.asset('assets/images/vuesax-bulk-wallet.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(
                            text: AppLocalizations.of(context)!
                                .translate("current balance"),
                            size: _height / 67.66666666666667, //12
                            typeOfFontWieght: 1,
                          ),
                          SizedBox(width: _width / 75), //5
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CurrentBalance(),
                                ),
                              );
                            },
                            child:
                                Image.asset('assets/images/question-fill.png'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(
                            size: _height / 33.83333333333333, //24
                            text: '0',
                            typeOfFontWieght: 1,
                          ),
                          SizedBox(width: _width / 75),
                          SmallText(
                            text:
                                AppLocalizations.of(context)!.translate("rial"),
                            size: _height / 67.66666666666667, //12
                            color: textGrayColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: _height / 101.5, //8
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: _height / 62.46153846153846, //13
                ),
                CustomButton(
                    enableVerticalMargin: false,
                    enableHorizontalMargin: true,
                    horizontalMargin: _width / 3.260869565217391, //115
                    width: _width,
                    height: _height / 16.24, //50
                    btnLbl:
                        AppLocalizations.of(context)!.translate("Buy Credit"),
                    onPressedFunction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseTheAmount()));
                    },
                    btnColor: mainAppColor,
                    btnStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                        fontSize: _height / 58),
                    borderColor: mainAppColor),
                SizedBox(
                  height: _height / 36.90909090909091, //22
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _width / 22.05882352941176), //17
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigText(
                        size: _height / 67.66666666666667,
                        typeOfFontWieght: 1,
                        text: AppLocalizations.of(context)!
                            .translate("Transaction history"),
                        color: blackColor,
                      ),
                      SizedBox(width: _width / 125 //3
                          ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionHistory(),
                            ),
                          );
                        },
                        child: Image.asset('assets/images/question-fill.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _height / 16.24 //50
                    ),
                Image.asset('assets/images/history.png'),
                SizedBox(
                  height: _height / 101.5, //8
                ),
                SmallText(
                  size: _height / 67.66666666666667, //12
                  text: AppLocalizations.of(context)!
                      .translate("No previous dealings"),
                  color: blackColor,
                )
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
                            builder: (context) => TermsAndConditionsScreen()));
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
    )));
  }
}
