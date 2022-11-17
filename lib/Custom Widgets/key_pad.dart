import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_svg/svg.dart';

import '../App Configurations/color_constants.dart';
import '../theme/app_style.dart';
import '../utils/HelperFiles/math_utils.dart';

class KeyPad extends StatelessWidget{
  final TextEditingController pinController;
  final Function onChange;
  final Function onNext;


  KeyPad({required this.onChange, required this.pinController, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonWidget('1',context),
              buttonWidget('2',context),
              buttonWidget('3',context),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonWidget('4',context),
              buttonWidget('5',context),
              buttonWidget('6',context),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonWidget('7',context),
              buttonWidget('8',context),
              buttonWidget('9',context),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonWidget('.',context),
              buttonWidget('0',context),
              iconButtonWidget(context, () {
                print(pinController.text.length.toString());
                print(pinController.text.toString());
                if(pinController.text.length-1==1){
                  pinController.text="";
                }
                if(pinController.text.length==1){
                  pinController.text="";
                }
                if (pinController.text.length > 1) {
                  pinController.text = pinController.text.removeLast();
                }

                onChange(pinController.text);
              }),
            ],
          ),
          SizedBox(height: 25),
          InkWell(
            onTap:() => onNext(),
            child: Container(
              height: MediaQuery.of(context).size.height/16,
              width: MediaQuery.of(context).size.width/1.2,
              decoration: BoxDecoration(
                color: ColorConstant.blue26,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),

              ),
              child: Center(
                child: Text("Next",style: AppStyle.textStyleSFPRO.copyWith(
                    color: ColorConstant.primaryWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: getFontSize(18)),),
              ),
            ),
          )
        ],
      ),
    );
  }

  buttonWidget(String buttonText,BuildContext context) {
    return InkWell(
      onTap:(){
        if(pinController.text.length>=8){

        }
        else{
          pinController.text = pinController.text.length<1?pinController.text+buttonText.toString():pinController.text+buttonText.toString();
          print(pinController.text.toString());
        }

      } ,
      child: Container(
        height: MediaQuery.of(context).size.height/18,
        width: MediaQuery.of(context).size.width/4.75,
        decoration: BoxDecoration(
          color: ColorConstant.blue26,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),

        ),
        child: Center(
          child: Text(buttonText,style: AppStyle.textStyleSFPRO.copyWith(
              color: ColorConstant.primaryWhite,
              fontWeight: FontWeight.w500,
              fontSize: getFontSize(24)),),
        ),
      ),
    );
  }
  iconButtonWidget(BuildContext context, VoidCallback function) {
    return InkWell(
      onTap: function,
      child: Container(
        height: MediaQuery.of(context).size.height/18,
        width: MediaQuery.of(context).size.width/4.75,
        decoration:  BoxDecoration(
          color: ColorConstant.blue26,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),

        ),
        child: Center(
          child:SvgPicture.asset(
            'asset/back_space.svg',
            fit: BoxFit.cover,
            color: ColorConstant.primaryWhite,
            height: 18,
            width: 21,
          ),
        ),
      ),
    );
  }

}