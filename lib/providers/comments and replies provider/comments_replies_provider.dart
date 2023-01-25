// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class CommentsProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  Comments _comments = Comments();

  List<Comments> _commentList = [];

  List<Comments> get commentList => _commentList;

  Future<void> sendComment(BuildContext context, Map body) async {
    // commentloading = true;

    final response = await _apiProvider.post(
      Urls.COMMENTS_URL,
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );
    if (response["status_code"] == 201) {
      _comments = Comments.fromJson(response["response"]["data"]);

      _commentList.add(_comments);

      ///
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }
    // commentloading = false;
    // notifyListeners();
  }
}

class RepliesProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  ///===========================================================================
  /// reply
  //  bool replyloading = false;

  Replies _replies = Replies();

  List<Replies> _replyList = [];

  List<Replies> get replyList => _replyList;

  Future<void> sendReply(BuildContext context, Map body) async {
    // replyloading = true;

    final response = await _apiProvider.post(
      "${Urls.COMMENTS_URL}/replay",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );
    print(response["status_code"]);

    print(response["response"]["data"]);
    if (response["status_code"] == 200) {
      _replies = Replies.fromJson(response["response"]["data"]);

      _replyList.add(_replies);
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    notifyListeners();
  }
}

class GetAllCommentsprovider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  List<Comments> _commentsList = [];

  int _pageNumber = 1;

  int totalPage = 0;

  List<Comments> get commentsList => _commentsList;

  int get pageNumber => _pageNumber;

  setPageNumber(int number) {
    _pageNumber = number;
    notifyListeners();
  }

  Future<List<Comments>> getAllComments(
    BuildContext context,
    String ad_Id,
  ) async {
    print("get all comments called page number ");
    final response = await _apiProvider.get(
      "${Urls.GET_ALL_COMMENTS_URL}$ad_Id/comments?page=1",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      _commentsList =
          iterable.map((model) => Comments.fromJson(model)).toList();

      totalPage = response['response']['meta']["last_page"];

      print(totalPage);

      notifyListeners();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }
    return _commentsList;
  }

  Future<List<Comments>> getPagenationComments(
    BuildContext context,
    String ad_Id,
  ) async {
    // _pageNumber++;
    print("-------------------$_pageNumber");
    _pageNumber++;

    if (_pageNumber == totalPage || _pageNumber < totalPage) {
      print("get pagenation comments called page number $_pageNumber");

      final response = await _apiProvider.get(
        "${Urls.GET_ALL_COMMENTS_URL}$ad_Id/comments?page=$_pageNumber",
        header: {
          'Accept': 'application/json',
          "Accept-Language": UserData.getUSerLang(),
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${UserData.getUserApiToken()}"
        },
      );

      if (response['status_code'] == 200) {
        Iterable iterable = response['response']['data'];
        print("==============================");

        List<Comments> pagenationComments =
            iterable.map((model) => Comments.fromJson(model)).toList();
        print(pagenationComments[0].comment);
        _commentsList.addAll(pagenationComments);
        print("==============================");

        notifyListeners();
      } else {
        Commons.showError(
            context: context, message: response['response']["message"]);
      }
      return _commentsList;
    } else {
      print("no data");
      return <Comments>[];
    }
  }
}
