import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/replies_entity.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/send_reply_comment_provider.dart';

class SendReplyCommentController {
  static Future sendReplyMethod(
      BuildContext context, Map<String, dynamic> body) async {
    final _sendReplyProvider =
        Provider.of<SendReplyCommentProvider>(context, listen: false);

    if (_sendReplyProvider.isSending) {
      return;
    } else {
      _sendReplyProvider.setIsSending(true);
      RepliesEntity _newReply =
          await _sendReplyProvider.sendReplyComment(context, body);

      _sendReplyProvider.setDataToReplyCommentsList(_newReply);

      _sendReplyProvider.setIsSending(false);
    }
  }
}
