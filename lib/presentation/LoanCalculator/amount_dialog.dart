import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';

import '../../Custom Widgets/app_ElevatedButton .dart';

class CustomDialog extends StatelessWidget {
  final String description;
  final void Function() onPressed;

  CustomDialog({
    required this.description, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 66 + 16,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 66),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ColorConstant.darkGreen,
                ColorConstant.greyF9,
                ColorConstant.greyF9,
                ColorConstant.redish,
              ],
            ),),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: ColorConstant.primaryBlack
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child:AppElevatedButton(
                  buttonColor: ColorConstant.primaryLightGreen,
                    buttonName: 'Done',
                    radius: 5,
                    onPressed: onPressed),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius:66,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('asset/icons/app_icon_splash.png'),
            ),
          ),
        ),
      ],
    );
  }
}