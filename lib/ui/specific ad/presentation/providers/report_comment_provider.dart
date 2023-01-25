import 'package:flutter/cupertino.dart';

import 'package:sheraa/ui/specific%20ad/domine/use%20cases/report_comment_use_case.dart';

class ReportCommentsProvider extends ChangeNotifier {
  ReportCommentUseCase reportCommentUseCase;

  ReportCommentsProvider({
    required this.reportCommentUseCase,
  });

  Future<bool> reportCommentMethod(
      BuildContext context, Map<String, dynamic> body) async {
    return await reportCommentUseCase.call(context, body);
  }
}
