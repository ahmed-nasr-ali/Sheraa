import 'package:flutter/material.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';

import 'package:sheraa/ui/specific%20ad/domine/use%20cases/get_all_comments.dart';

class GetAllCommentsProvider extends ChangeNotifier {
  GetAllCommentsUseCase getAllCommentsUseCase;

  GetAllCommentsProvider({
    required this.getAllCommentsUseCase,
  });

  Future<List<CommentsEntity>> getAllCommentsMethod(
      BuildContext context, String adId, int pageNumber) async {
    return await getAllCommentsUseCase.call(context, adId, pageNumber);
  }

  List<CommentsEntity> _commentList = [];

  bool _isLoading = true;

  bool _noMoreData = false;

  bool _noMoreSearchingData = false;

  bool _isFecthData = false;

  bool _isFetchSearchingData = false;

  bool _loadingpagenationApi = true;

  int _pageNo = 2;

  List<CommentsEntity> get commentsList => _commentList;

  bool get isLoading => _isLoading;

  bool get noMoreData => _noMoreData;

  bool get noMoreSearchingData => _noMoreSearchingData;

  bool get isFecthData => _isFecthData;

  bool get isFetchingSearchingData => _isFetchSearchingData;

  bool get loadingpagenationApi => _loadingpagenationApi;

  int get pageNo => _pageNo;

  increamentPageNo() {
    _pageNo += 1;
    notifyListeners();
  }

  setDataToCommentList(List<CommentsEntity> listOfComments) {
    _commentList.addAll(listOfComments);
    print("comment list is : ${_commentList.length}");
    notifyListeners();
  }

  clearCommentList() {
    _commentList.clear();
    print("clear comment list ${_commentList.length}");
    notifyListeners();
  }

  setIsLoading(bool loading) {
    _isLoading = loading;
    print("is loading state is : $_isLoading");
    notifyListeners();
  }

  setNoMoreData(bool donotFetch) {
    _noMoreData = donotFetch;
    print("do not fetch new data from server : $_noMoreData");
    notifyListeners();
  }

  setNoMoreSearchingData(bool donotFetch) {
    _noMoreSearchingData = donotFetch;
    print(
        "do not fetch new searching data from server : $_noMoreSearchingData");
    notifyListeners();
  }

  setIsFetchingData(bool isFetch) {
    _isFecthData = isFetch;
    print("is fetch state is : $_isFecthData");
    notifyListeners();
  }

  setIsFetchingSearchingData(bool isFetch) {
    _isFetchSearchingData = isFetch;
    print("is fetch  Searching state is : $_isFetchSearchingData");
    notifyListeners();
  }

  setPagenationApiLoading(bool loading) {
    _loadingpagenationApi = loading;
    print("pagenation loading state is $_loadingpagenationApi");
    notifyListeners();
  }

  setAllDateToDefault() {
    _commentList.clear();
    _isLoading = true;
    _noMoreData = false;
    _noMoreSearchingData = false;
    _isFecthData = false;
    _isFetchSearchingData = false;
    _loadingpagenationApi = true;
    _pageNo = 2;
    notifyListeners();
    print("comment list is : ${_commentList.length}");
  }
}
