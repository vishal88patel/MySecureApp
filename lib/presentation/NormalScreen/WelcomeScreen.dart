
import 'package:flutter/material.dart';

import 'Screen1.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }
  @override
  void dispose(){
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geeks for Geeks"),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value){
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index){

                  // contents of slider
                  return Slider(
                    image: slides[index].getImage(),

                  );
                }
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(slides.length, (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            color: Colors.green,
            child: InkWell(
              onTap: (){
                if(currentIndex == slides.length - 1){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Screen1()),
                  );
                }
                _controller!.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
              },
              child: Container(
                child: Text(
                    currentIndex == slides.length - 1 ? "Continue": "Next"),

              ),
            ),

          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  // container created for dots
  Container buildDot(int index, BuildContext context){
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
    );
  }
}

// ignore: must_be_immutable
// slider declared
class Slider extends StatelessWidget {
  String? image;

  Slider({this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(

      // contains container
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // image given in slider
            Image(image: AssetImage(image!)),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}


class SliderModel{
  String? image;

// images given
  SliderModel({this.image});

// setter for image
  void setImage(String getImage){
    image = getImage;
  }

// getter for image
  String? getImage(){
    return image;
  }
}
List<SliderModel> getSlides(){
  List<SliderModel> slides =  <SliderModel>[];
  SliderModel sliderModel =  SliderModel();

  // 1
  sliderModel.setImage("asset/icons/ic_app_logo.svg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  // 2
  sliderModel.setImage("asset/icons/ic_app_logo.svg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  // 3
  sliderModel.setImage("asset/icons/ic_app_logo.svg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}