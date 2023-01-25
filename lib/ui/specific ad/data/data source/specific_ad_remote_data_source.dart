import 'package:flutter/cupertino.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/specific%20ad/data/models/comment_model.dart';
import 'package:sheraa/ui/specific%20ad/data/models/replies_model.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls/specific%20ad%20urls/specifc_ad_urls.dart';

abstract class SpecificAdRemoteDataSource {
  Future<bool> tellMeWhenPriceDecrease(
      BuildContext context, Map<String, dynamic> body);

  Future<bool> reportAd(BuildContext context, Map<String, dynamic> body);

  Future<CommentsModel> sendComment(
      BuildContext context, Map<String, dynamic> body);

  Future<List<CommentsModel>> getAllComments(
      BuildContext context, String adId, int pageNumber);

  Future<bool> reportCommentMethod(
      BuildContext context, Map<String, dynamic> body);

  Future<RepliesModel> sendRelpyComment(
      BuildContext context, Map<String, dynamic> body);
}

class SpecificAdRemoteDataSourceIMP implements SpecificAdRemoteDataSource {
  ApiProvider _apiProvider = ApiProvider();

  @override
  Future<bool> tellMeWhenPriceDecrease(
      BuildContext context, Map<String, dynamic> body) async {
    final response = await _apiProvider.post(
      "${SpecificAdUrls.TELL_ME_WHEN_PRICE_DECREAsE_URL}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );

    if (response["status_code"] == 200) {
      snakBarWidget(
        context: context,
        content: AppLocalizations.of(context)!
            .translate("The client has been successfully informed"),
      );
      return true;
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
      return false;
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
      return false;
    }
  }

  @override
  Future<bool> reportAd(BuildContext context, Map<String, dynamic> body) async {
    final response = await _apiProvider.post(
      "${SpecificAdUrls.REPORT_AD_URL}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );
    if (response["status_code"] == 201) {
      return true;
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
      return false;
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
      return false;
    }
  }

  @override
  Future<CommentsModel> sendComment(
      BuildContext context, Map<String, dynamic> body) async {
    CommentsModel _comment = CommentsModel();

    final response = await _apiProvider.post(
      SpecificAdUrls.COMMENTS_URL,
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );
    if (response["status_code"] == 201) {
      _comment = CommentsModel.fromJson(response["response"]["data"]);
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _comment;
  }

  @override
  Future<List<CommentsModel>> getAllComments(
      BuildContext context, String adId, int pageNumber) async {
    List<CommentsModel> _commentList = [];

    print(
      "${SpecificAdUrls.GET_ALL_COMMENTS_URL}$adId/comments?page=$pageNumber",
    );

    final response = await _apiProvider.get(
      "${SpecificAdUrls.GET_ALL_COMMENTS_URL}$adId/comments?page=$pageNumber",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      _commentList =
          iterable.map((model) => CommentsModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }
    return _commentList;
  }

  @override
  Future<bool> reportCommentMethod(
      BuildContext context, Map<String, dynamic> body) async {
    final response = await _apiProvider.post(
      "${SpecificAdUrls.COMMENTS_URL}/report",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );

    if (response["status_code"] == 200) {
      return true;
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
      return false;
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
      return false;
    }
  }

  @override
  Future<RepliesModel> sendRelpyComment(
      BuildContext context, Map<String, dynamic> body) async {
    RepliesModel _reply = RepliesModel();

    final response = await _apiProvider.post(
      "${SpecificAdUrls.COMMENTS_URL}/replay",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );

    print(response["response"]["data"]);
    if (response["status_code"] == 200) {
      _reply = RepliesModel.fromJson(response["response"]["data"]);
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _reply;
  }
}
