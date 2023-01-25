import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/get_all_comments_provider.dart';

class GetCommentsController {
  static Future fetchData(BuildContext context, String adId) async {
    final _commentsProvider =
        Provider.of<GetAllCommentsProvider>(context, listen: false);

    List<CommentsEntity> _newCommentList =
        await _commentsProvider.getAllCommentsMethod(context, adId, 1);

    _commentsProvider.setDataToCommentList(_newCommentList);

    if (_newCommentList.length < 15) {
      _commentsProvider.setPagenationApiLoading(false);
    }

    _commentsProvider.clearCommentList();

    _commentsProvider.setDataToCommentList(_newCommentList);

    _commentsProvider.setIsLoading(false);
  }

  static Future pagenationApi(BuildContext context, String adId) async {
    final _commentsProvider =
        Provider.of<GetAllCommentsProvider>(context, listen: false);
    if (!_commentsProvider.isLoading) {
      if (_commentsProvider.noMoreData) {
      } else {
        if (_commentsProvider.isFecthData) return;
        _commentsProvider.setIsFetchingData(true);

        List<CommentsEntity> _newCitiesList = await _commentsProvider
            .getAllCommentsMethod(context, adId, _commentsProvider.pageNo);

        if (_newCitiesList.length < 15) {
          _commentsProvider.setNoMoreData(true);
          _commentsProvider.setPagenationApiLoading(false);
        }
        _commentsProvider.setDataToCommentList(_newCitiesList);

        _commentsProvider.setIsFetchingData(false);
      }
    }
  }
}
