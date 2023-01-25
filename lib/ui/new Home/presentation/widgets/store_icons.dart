// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/store_icon_entity.dart';

class StoreIconWidget extends StatefulWidget {
  List<StoreIConEntity> storeIconList;
  StoreIconWidget({
    Key? key,
    required this.storeIconList,
  }) : super(key: key);

  @override
  State<StoreIconWidget> createState() => _StoreIconWidgetState();
}

class _StoreIconWidgetState extends State<StoreIconWidget> {
  double? _height;

  double? _width;

  @override
  void initState() {
    super.initState();

    print(widget.storeIconList.length);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      height: _height! / 8.547368421052632, //95
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: _width! / 75),
          itemCount: widget.storeIconList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final storeIcon = widget.storeIconList[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: _width! / 50),
              width: _width! / 3.409090909090909, //105,
              height: _height! / 8.547368421052632, //95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(_height! / 54.13333333333333), //15
                  ),
                  image: DecorationImage(
                    image: NetworkImage(storeIcon.icon),
                    fit: BoxFit.cover,
                  )),
            );
          }),
    );
  }
}
