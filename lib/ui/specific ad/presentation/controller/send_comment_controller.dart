import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/send_comment_provider.dart';

class SendCommentController {
  static Future sendCommentMethod(
      BuildContext context, Map<String, dynamic> body) async {
    final _sendCommentProvider =
        Provider.of<SendCommentProvider>(context, listen: false);

    if (_sendCommentProvider.isSending) {
      return;
    } else {
      _sendCommentProvider.setIsSending(true);
      CommentsEntity _newComment =
          await _sendCommentProvider.sendCommentMehtod(context, body);

      _sendCommentProvider.setDataToCommentList(_newComment);

      _sendCommentProvider.setIsSending(false);
    }
  }
}
