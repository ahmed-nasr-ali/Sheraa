// ignore_for_file: must_be_immutable, non_constant_identifier_names, unnecessary_statements

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/comments%20and%20replies%20provider/comments_replies_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/replies_entity.dart';
import 'package:sheraa/ui/specific%20ad/presentation/controller/send_reply_comment_controller.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/Report%20comment%20and%20Ad/report%20comment/report_comment.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/send_reply_comment_provider.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'reply_comment_widget.dart';

class CommentWidget extends StatefulWidget {
  CommentsEntity commentsObject;

  List<RepliesEntity> replyComment;

  int? ad_id;

  bool isMyComment;

  CommentWidget({
    Key? key,
    required this.commentsObject,
    required this.replyComment,
    this.isMyComment = false,
    this.ad_id,
  }) : super(key: key);

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  bool _writeComment = false;

  TextEditingController _replyController = TextEditingController();

  double? _height;

  double? _width;

  SendReplyCommentProvider? _sendReplyCommentProvider;

  // RepliesProvider? _sendReply;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sendReplyCommentProvider =
        Provider.of<SendReplyCommentProvider>(context, listen: false);

    // _sendReply = Provider.of<RepliesProvider>(context, listen: false);

    // _sendReply!.replyList.clear();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height! / 54.13333333333333, //15
        ),
        Row(
          children: [
            SizedBox(
              width: _width! / 23.4375, //16
            ),
            CircleAvatar(
              radius: _width! / 21.42857142857143, //17.5
              backgroundImage:
                  NetworkImage(widget.commentsObject.userAvatar ?? ""),
            ),
            SizedBox(
              width: _width! / 53.57142857142857, //7
            ),
            Column(
              children: [
                Container(
                  width: _width! / 1.5, //62
                  child: SmallText(
                    align: TextAlign.start,
                    text: widget.commentsObject.userName ?? "",
                    color: blackColor,
                    typeOfFontWieght: 1,
                    size: _height! / 67.66666666666667, //12
                  ),
                ),
                SizedBox(
                  height: _height! / 324.8,
                ),
                Container(
                  width: _width! / 1.5,
                  child: SmallText(
                    align: TextAlign.start,
                    text: widget.commentsObject.createdAt ?? "",
                    size: _height! / 81.2,
                    color: textGrayColor,
                  ),
                ),
              ],
            ),
            widget.isMyComment
                ? Container()
                : Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                //todo
                                builder: (context) => ReportComment(
                                  commentId: widget.commentsObject.id ?? 0,
                                  ad_Id: widget.ad_id ?? 0,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: _width! / 15), //30
                            child: Image.asset("assets/images/flag.png"),
                          ),
                        ),
                        SizedBox(
                          width: _width! / 28.84615384615385, //13
                        )
                      ],
                    ),
                  )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            right: UserData.getUSerLang() == "ar"
                ? (_width! / 23.4375) +
                    (2 * _width! / 21.42857142857143) +
                    (_width! / 53.57142857142857)
                : _width! / 18.75,
            left: UserData.getUSerLang() == "ar"
                ? _width! / 18.75
                : (_width! / 23.4375) +
                    (2 * _width! / 21.42857142857143) +
                    (_width! / 53.57142857142857),
          ),
          child: SmallText(
            align: TextAlign.start,
            maxLine: 3,
            text: widget.commentsObject.comment ?? "",
            color: blackColor,
            typeOfFontWieght: 0,
            size: _height! / 67.66666666666667, //12
          ),
        ),
        SizedBox(
          height: _height! / 116, //7
        ),
        InkWell(
          onTap: () {
            setState(() {
              _writeComment = !_writeComment;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: (_width! / 23.4375) +
                    (2 * _width! / 21.42857142857143) +
                    (_width! / 53.57142857142857) //70
                ),
            height: _height! / 32.48, //25
            width:
                UserData.getUSerLang() == "ar" ? _width! / 7.5 : _width! / 6.25,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: _width! / 37.5,
                ),
                Image.asset("assets/images/messageanswer.png"),
                SizedBox(
                  width: _width! / 125, //3
                ),
                SmallText(
                  text: AppLocalizations.of(context)!.translate("reply"),
                  size: _height! / 81.2,
                  typeOfFontWieght: 0,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: _height! / 54.13333333333333,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.replyComment.length,
          itemBuilder: (context, index) {
            return ReplyCommentWidget(
              repliesObject: widget.replyComment[index],
            );
          },
        ),
        SizedBox(
          height: _height! / 54.13333333333333, //15
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _sendReplyCommentProvider!.replyList.length,
          itemBuilder: (context, index) {
            return widget.commentsObject.id ==
                    _sendReplyCommentProvider!.replyList[index].commentId
                ? ReplyCommentWidget(
                    repliesObject: _sendReplyCommentProvider!.replyList[index],
                  )
                : Container();
          },
        ),
        SizedBox(
          height: _height! / 162.4,
        ),
        _writeComment
            ? CustomTextFormField(
                controller: _replyController,
                contentPadding: _width! / 23.4375, //15
                hasHorizontalMargin: true,
                horizontalMargin: _width! / 23.4375, //16
                enableBorder: false,
                enabled: true,
                labelText: AppLocalizations.of(context)!
                    .translate("Write your reply here..."),
                labelSize: _height! / 67.66666666666667, //12,
                isPassword: false,
                readOnly: false,
                suffixIconIsImage: false,
                suffixIcon: GestureDetector(
                  onTap: () async {
                    if (_replyController.text.isNotEmpty) {
                      Map<String, dynamic> _body = {
                        "user_id": UserData.getUserId(),
                        "comment_id": widget.commentsObject.id ?? 0,
                        "replay": _replyController.text,
                      };

                      await SendReplyCommentController.sendReplyMethod(
                              context, _body)
                          .then((value) {
                        setState(() {});
                      });
                    }
                    _replyController.clear();
                  },
                  child: Image.asset("assets/images/send.png"),
                ),

                suffixIconImagePath: "assets/images/send.png",
              )
            : Container(),
        _writeComment
            ? SizedBox(
                height: _height! / 54.13333333333333, //15
              )
            : Container()
      ],
    );
  }
}
