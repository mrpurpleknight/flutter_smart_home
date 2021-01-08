import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FunctionTile extends StatelessWidget {

  final String _svgPath;
  final String _text;

  FunctionTile(this._svgPath, this._text);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: size.height * 0.23,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.019),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).cardColor, width: 1.2),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.024),
              child: SvgPicture.asset(
                _svgPath,
                color: Theme.of(context).cardColor,
                width: 37,
                height: 37,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.018),
              child: Text(
                _text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
