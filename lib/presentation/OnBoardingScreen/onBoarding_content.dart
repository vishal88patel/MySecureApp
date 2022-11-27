
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    this.text,
    this.image,
  }) : super();
  final String? text, image;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image!,
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.width/1.25,
            ),
          ],
        ),
      ],
    );
  }
}