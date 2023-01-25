import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/replies_entity.dart';

import 'package:sheraa/ui/specific%20ad/domine/use%20cases/send_reply_comment_use_case.dart';

class SendReplyCommentProvider extends ChangeNotifier {
  SendReplyCommentUseCase sendReplyCommentUseCase;

  SendReplyCommentProvider({
    required this.sendReplyCommentUseCase,
  });

  Future<RepliesEntity> sendReplyComment(
      BuildContext context, Map<String, dynamic> body) async {
    return await sendReplyCommentUseCase.call(context, body);
  }

  List<RepliesEntity> _replyList = [];

  List<RepliesEntity> get replyList => _replyList;

  bool _isSending = false;

  bool get isSending => _isSending;

  setIsSending(bool issending) {
    _isSending = issending;
    notifyListeners();
  }

  setDataToReplyCommentsList(RepliesEntity _newReplyComment) {
    _replyList.add(_newReplyComment);
    notifyListeners();
  }

  clearSendReplyCommentList() {
    _replyList.clear();
    print("reply comment list clear :  ${_replyList.length}");
    // notifyListeners();
  }
}
