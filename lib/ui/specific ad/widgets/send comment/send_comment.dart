// ignore_for_file: unused_field, unused_local_variable, must_be_immutable, unnecessary_statements

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/specific%20ad/presentation/controller/send_comment_controller.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/send_comment_provider.dart';
import 'package:sheraa/ui/specific%20ad/widgets/comment%20body/comment_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class SendCommentPart extends StatefulWidget {
  int adId;
  String commentsNumber;
  SendCommentPart({
    Key? key,
    required this.adId,
    required this.commentsNumber,
  }) : super(key: key);

  @override
  State<SendCommentPart> createState() => _SendCommentPartState();
}

class _SendCommentPartState extends State<SendCommentPart> {
  TextEditingController commentcontroller = TextEditingController();

  SendCommentProvider? _sendCommentProvider;

  double? _height;

  double? _width;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sendCommentProvider =
        Provider.of<SendCommentProvider>(context, listen: false);

    _sendCommentProvider!.clearSendCommentList();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _width! / 23.4375, //16
              ),
              child: SmallText(
                text:
                    "${AppLocalizations.of(context)!.translate("comments (1)")}" +
                        "(${widget.commentsNumber})",
                color: blackColor,
                typeOfFontWieght: 1,
                size: _height! / 67.66666666666667, //12
              ),
            ),
            Row(
              children: [
                Image.asset("assets/images/messagesmall.png"),
                SizedBox(
                  width: _width! / 93.75, //4
                ),
                SmallText(
                  text: AppLocalizations.of(context)!
                      .translate("follow up comment"),
                  color: textGrayColor,
                  typeOfFontWieght: 0,
                  size: _height! / 67.66666666666667, //12
                ),
                SizedBox(
                  width: _width! / 93.75, //4
                ),
                Image.asset("assets/images/question-fill.png"),
                SizedBox(
                  width: _width! / 16.30434782608696, //23
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: _height! / 54.13333333333333, //10
        ),
        CustomTextFormField(
          controller: commentcontroller,
          contentPadding: _width! / 23.4375, //15
          hasHorizontalMargin: true,
          horizontalMargin: _width! / 23.4375, //16
          enableBorder: false,
          enabled: true,
          labelText: AppLocalizations.of(context)!
              .translate("Write your comment here..."),
          labelSize: _height! / 67.66666666666667, //12,
          isPassword: false,
          readOnly: false,
          suffixIconIsImage: false,
          suffixIcon: GestureDetector(
            onTap: () async {
              Map<String, dynamic> _body = {
                "ad_id": widget.adId,
                "comment": commentcontroller.text,
              };
              if (commentcontroller.text.isNotEmpty) {
                await SendCommentController.sendCommentMethod(context, _body)
                    .then((value) {
                  setState(() {});
                });
              }
              commentcontroller.clear();
            },
            child: Image.asset("assets/images/send.png"),
          ),

          suffixIconImagePath: "assets/images/send.png",
        ),
        SizedBox(
          height: _height! / 62.46153846153846, //13
        ),
        Divider(
          height: 0,
          thickness: _height! / 162.4,
          color: Color(0xffF8F9FB),
        ),
        _sendCommentProvider!.commentList.isEmpty
            ? Container()
            : SizedBox(
                height: _height! / 54.13333333333333, //15
              ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _sendCommentProvider!.commentList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CommentWidget(
                  commentsObject: _sendCommentProvider!.commentList[index],
                  replyComment:
                      _sendCommentProvider!.commentList[index].replies ?? [],
                  isMyComment: true,
                ),
                Divider(
                  height: 0,
                  color: containerColor,
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
