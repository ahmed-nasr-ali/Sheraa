// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<dynamic>? dataRetrieved; // data decoded from the json file
  List<dynamic>? data; // data to display on the screen
  var _searchController = TextEditingController();
  var searchValue = "";
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    final String response = await rootBundle.loadString(
        'assets/CountryCodes.json'); //do(responseكدا كل الي في فيل الجاسون متخزن في )
    dataRetrieved = json.decode(response)
        as List<dynamic>; //do (list dataRetrieved  كدا خزناالبيانات في )
    setState(() {
      data = dataRetrieved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'اختار المدينه ',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          SearchingBar(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    (data != null)
                        ? data!
                            .where((e) => e['name']
                                .toString()
                                .toLowerCase()
                                .contains(searchValue.toLowerCase()))
                            .map((e) => ListTile(
                                  onTap: () {
                                    Navigator.pop(context, {
                                      'name': e['name'],
                                      'code': e['dial_code']
                                    });
                                  },
                                  title: Text(e['name']),
                                  trailing: Text(e['dial_code']),
                                ))
                            .toList()
                        : [
                            Center(
                              child: Text('loading...'),
                            )
                          ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget SearchingBar() {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 36,
          right: MediaQuery.of(context).size.width / 36,
          bottom: MediaQuery.of(context).size.width / 36),
      //10,10,10
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height / 51.46667), //15
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 36,
                  left: MediaQuery.of(context).size.width / 36,
                  bottom:
                      MediaQuery.of(context).size.height / 308.8), //10,10,2.5
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchValue = value;
                  });
                },
                controller: _searchController,
                textAlign: TextAlign.start,
                //controller: controller,
                // cursorColor:
                //     themeProvider.isDarkMode ? whiteColor : textGrayColor,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "ابحث في المدن",
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 64.33, //12
                    fontWeight: FontWeight.normal,
                    // color:
                    //     themeProvider.isDarkMode ? whiteColor : textGrayColor,
                  ),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 36),
              child: Icon(Icons.search))
        ],
      ),
    );
  }
}
