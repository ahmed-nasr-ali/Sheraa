// ignore_for_file: must_be_immutable, unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/models/ad.dart';
import 'package:sheraa/ui/specific%20ad/presentation/controller/get_comments_controller.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/get_all_comments_provider.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/send_reply_comment_provider.dart';
import 'package:sheraa/ui/specific%20ad/widgets/comment%20body/comment_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class CommentBodyWidget extends StatefulWidget {
  String ad_Id;
  CommentBodyWidget({
    Key? key,
    required this.ad_Id,
  }) : super(key: key);

  @override
  State<CommentBodyWidget> createState() => _CommentBodyWidgetState();
}

class _CommentBodyWidgetState extends State<CommentBodyWidget> {
  double? _height;

  double? _width;

  @override
  void initState() {
    super.initState();

    fetch();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<SendReplyCommentProvider>(context, listen: false)
        .clearSendReplyCommentList();
  }

  Future fetch() async {
    await GetCommentsController.fetchData(context, widget.ad_Id);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return Consumer<GetAllCommentsProvider>(builder: (context, value, child) {
      return value.isLoading
          ? Center(
              child: SpinKitFadingCircle(color: mainAppColor),
            )
          : Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: value.commentsList.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0,
                      thickness: 0,
                      color: containerColor,
                    );
                  },
                  itemBuilder: (context, index) {
                    return CommentWidget(
                      commentsObject: value.commentsList[index],
                      replyComment: value.commentsList[index].replies ?? [],
                      ad_id: int.parse(widget.ad_Id),
                    );
                  },
                ),
                value.loadingpagenationApi
                    ? Center(
                        child: SpinKitFadingCircle(color: mainAppColor),
                      )
                    : Container()
              ],
            );
    });
  }
}
