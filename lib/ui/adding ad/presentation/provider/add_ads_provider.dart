// ignore_for_file: unused_local_variable, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';

class AddOptionsIdAndFeatureName extends ChangeNotifier {
  ///muli select category part
  ///category id

  List<int> _categoryId = [];

  addCategoryId(int id) {
    _categoryId.contains(id)
        ? _categoryId.removeWhere((item) => item == id)
        : _categoryId.add(id);
  }

  List get categoryID => _categoryId;

  ///==========================================================================
  ///category name

  List<String> _categoryName = [];

  addCategoryName(String name) {
    _categoryName.contains(name)
        ? _categoryName.removeWhere((item) => item == name)
        : _categoryName.add(name);
  }

  List get categoryName => _categoryName;

  List<Map<String, dynamic>> _opttionName = [];

  List toRemoveOpptionName = [];

  addAdsOpptionName(Map<String, dynamic> opttion, String name) {
    _opttionName.forEach((item) {
      if (item.containsValue(name)) {
        toRemoveOpptionName.add(item);
      }
    });

    _opttionName
        .removeWhere((element) => toRemoveOpptionName.contains(element));

    _opttionName.add(opttion);

    notifyListeners();
  }

  List<Map<String, dynamic>> get opttinName => _opttionName;

  ///==========================================================================

  List<Map<String, dynamic>> _opptionID = [];

  List toRemoveOpptionId = [];

  addOpptionId(Map<String, dynamic> opptionId, String name) {
    _opptionID.forEach((item) {
      if (item.containsValue(name)) {
        toRemoveOpptionId.add(item);
      }
    });
    _opptionID.removeWhere((element) => toRemoveOpptionId.contains(element));

    _opptionID.add(opptionId);
    notifyListeners();
  }

  List<Map<String, dynamic>> get opptionID => _opptionID;

  ///==========================================================================
  List<Map<String, dynamic>> _opttinIDForShowing = [];

  List toRemoveopptionIdForShowing = [];

  addOpptionIDForShow(Map<String, dynamic> idForShow, String name) {
    _opttinIDForShowing.forEach((item) {
      if (item.containsKey(name)) {
        toRemoveopptionIdForShowing.add(item);
      }
    });
    _opttinIDForShowing.removeWhere(
        (element) => toRemoveopptionIdForShowing.contains(element));

    _opttinIDForShowing.add(idForShow);

    notifyListeners();
  }

  List<Map<String, dynamic>> get opptionIDForShowing => _opttinIDForShowing;

  setAllDataToDefault() {
    _opttionName.clear();
    _opptionID.clear();
    _opttinIDForShowing.clear();
    _categoryId.clear();
    _categoryName.clear();
  }
}
