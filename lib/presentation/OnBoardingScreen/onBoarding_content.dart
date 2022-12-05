
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
              width: MediaQuery.of(context).size.width/1.3,
            ),
          ],
        ),
      ],
    );
  }
}
