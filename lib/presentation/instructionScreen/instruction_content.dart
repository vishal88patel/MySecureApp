
import 'package:flutter/material.dart';

class InstructionContent extends StatelessWidget {
  const InstructionContent({
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
