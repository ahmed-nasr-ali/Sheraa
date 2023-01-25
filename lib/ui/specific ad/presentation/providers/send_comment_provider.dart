import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';

import 'package:sheraa/ui/specific%20ad/domine/use%20cases/send_comment_use_case.dart';

class SendCommentProvider extends ChangeNotifier {
  SendCommentUseCase sendCommentUseCase;

  SendCommentProvider({
    required this.sendCommentUseCase,
  });

  Future<CommentsEntity> sendCommentMehtod(
      BuildContext context, Map<String, dynamic> body) async {
    return await sendCommentUseCase.call(context, body);
  }

  bool _isSending = false;

  bool get isSending => _isSending;

  setIsSending(bool issending) {
    _isSending = issending;
    notifyListeners();
  }

  List<CommentsEntity> _commentList = [];

  List<CommentsEntity> get commentList => _commentList;

  setDataToCommentList(CommentsEntity _newComment) {
    _commentList.add(_newComment);
    notifyListeners();
  }

  clearSendCommentList() {
    _commentList.clear();
    print("comment list clear :  ${_commentList.length}");
    // notifyListeners();
  }
}
