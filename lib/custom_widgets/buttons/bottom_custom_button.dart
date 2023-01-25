import 'package:flutter/material.dart';

class BottomCustomButton extends StatelessWidget {
  final Color btnColor;
  final String btnLbl;
  final Function onPressedFunction;
  final TextStyle btnStyle;
  final Widget icon;

  const BottomCustomButton(
      {required Key key,
      required this.btnLbl,
      required this.onPressedFunction,
      required this.btnColor,
      required this.btnStyle,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        // margin: EdgeInsets.symmetric(
        //     horizontal:
        //        MediaQuery.of(context).size.width * 0.07,
        //     vertical: MediaQuery.of(context).size.height * 0.01),
        child: Builder(
            builder: (context) => RaisedButton(
                  onPressed: () {
                    onPressedFunction();
                  },
                  elevation: 0,
                  shape: new RoundedRectangleBorder(
                      //  borderRadius: new BorderRadius.circular(10.0)
                      ),
                  color: btnColor != null
                      ? btnColor
                      : Theme.of(context).primaryColor,
                  child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          icon != null ? icon : Container(),
                          Text(
                            '$btnLbl',
                            style: btnStyle == null
                                ? Theme.of(context).textTheme.button
                                : btnStyle,
                          ),
                        ],
                      )),
                )));
  }
}
