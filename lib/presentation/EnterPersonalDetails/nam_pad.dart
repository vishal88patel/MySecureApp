import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

// KeyPad widget
// This widget is reusable and its buttons are customizable (color, size)
class NumPad extends StatelessWidget {
  final String type;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;

  const NumPad({
    Key? key,

    required this.delete,
    required this.onSubmit,
    required this.controller,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // implement the number keys (from 0 to 9) with the NumberButton widget
            // the NumberButton widget is defined in the bottom of this file
            children: [
              buttonWidget(
                number: '1',context: context,
                controller: controller,type: type
              ),
              buttonWidget(
                number: '2',
                context: context,
                controller: controller,type: type
              ),
              buttonWidget(
                number: '3',context: context,
                controller: controller,type: type
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonWidget(
                number: '4',
                context: context,

                controller: controller,type: type
              ),
              buttonWidget(
                number: '5',
                context: context,

                controller: controller,type: type
              ),
              buttonWidget(
                number: '6',
                context: context,

                controller: controller,type: type
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonWidget(
                number: '7',
                context: context,

                controller: controller,type: type
              ),
              buttonWidget(
                number: '8',
                context: context,
                controller: controller,type: type
              ),
              buttonWidget(
                number: '9',
                context: context,

                controller: controller,type: type
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // this button is used to delete the last number
              buttonWidget(number: '.',context:context,controller: controller,type: type),

              buttonWidget(

                number: '0',
               context: context,
                controller: controller,type: type
              ),
              // this button is used to submit the entered value
              iconButtonWidget(context: context,function: () => delete()),

            ],
          ),
          const SizedBox(height: 20),

          InkWell(
            onTap:() => onSubmit(),
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
}

// define NumberButton widget
// its shape is round

buttonWidget(
    {required String number,required BuildContext context,
      required String type,
      required TextEditingController controller}) {
  return InkWell(
    onTap:(){
      if(type=='BIRTHDATE'){
      if(controller.text.length<=9){
        controller.text += number.toString();
        log('message ${controller.text}');
        if(controller.text.length==2){
          controller.text += '/';
        }
        log('message1 ${controller.text}');
        if(controller.text.length==5){
          controller.text += '/';
        }
        log('message2 ${controller.text}');
      }}else if(type=='SNN'){
        if(controller.text.length<=8){
          controller.text += number.toString();

        }
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
        child: Text(number.toString(),style: AppStyle.textStyleSFPRO.copyWith(
            color: ColorConstant.primaryWhite,
            fontWeight: FontWeight.w500,
            fontSize: getFontSize(24)),),
      ),
    ),
  );

}
iconButtonWidget({required BuildContext context,required VoidCallback function}) {
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

