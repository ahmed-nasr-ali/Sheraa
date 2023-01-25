import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/specific%20ad/domine/repository/specific_ad_repository.dart';

class ReportCommentUseCase {
  SpecificAdRepository specificAdRepository;

  ReportCommentUseCase({
    required this.specificAdRepository,
  });

  Future<bool> call(BuildContext context, Map<String, dynamic> body) async {
    return await specificAdRepository.reportComment(context, body);
  }
}
