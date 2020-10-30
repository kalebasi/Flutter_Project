import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double yukseklik;
  final Widget buttonIcon;
  final VoidCallback onPressed;

  const Button(
      {Key key,
        @required this.buttonText,
        this.buttonColor: Colors.teal,
        this.textColor:Colors.white,
        this.radius:16,
        this.yukseklik :40,
        this.buttonIcon,
        this.onPressed})
      : assert(buttonText !=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: yukseklik,
        child: RaisedButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if(buttonIcon !=null) ...[
                buttonIcon,
                Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
                Opacity(opacity: 0,child: buttonIcon),
              ],
              if(buttonIcon ==null)... [
                Container(),
                Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
                Container(),
              ]
            ],
          ),
          color: buttonColor,
        ),
      ),
    );
  }
}
