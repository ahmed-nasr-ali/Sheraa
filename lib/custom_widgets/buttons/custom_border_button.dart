import 'package:flutter/material.dart';

class CustomBorderButton extends StatelessWidget {
  final Color? btnColor;
  final Color borderBtnColor;

  final String? btnLbl;
  final VoidCallback? onPressedFunction;
  final TextStyle? btnStyle;
  final Widget icon;

  const CustomBorderButton(
      {required Key key,
      this.btnLbl,
      this.onPressedFunction,
      this.btnColor,
      required this.borderBtnColor,
      this.btnStyle,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.01),
        child: Builder(
            builder: (context) => RaisedButton(
                  onPressed: onPressedFunction,
                  elevation: 0,
                  shape: new RoundedRectangleBorder(
                      side: BorderSide(
                          color: borderBtnColor, style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(25.0)),
                  color: btnColor,
                  child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          icon != null ? icon : Container(),
                          SizedBox(
                            width: 5,
                          ),
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
