import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_cash_app/presentation/LinkCardEditCardScreen/controller/link_card_edit_card_screen_controller.dart';
import 'package:secure_cash_app/presentation/LoanApprovedScreen/controller/loan_approved_screen_controller.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/appbar_image_1.dart';
import '../../Custom Widgets/common_image_view.dart';
import '../../routes/app_routes.dart';
import 'controller/link_card_success_screen_controller.dart';

class LinkCardSuccessScreen extends StatelessWidget {
  var linkCardController = Get.find<LinkCardEditCardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.darkGrey,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    "Receipt",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppStyle.DmSansFont.copyWith(
                        color: ColorConstant.primaryWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: getFontSize(30)),
                  ),
                ),
              ),
              Container(
                width: size.width,
                child: SingleChildScrollView(
                  child: Container(
                    height: getVerticalSize(
                      650.00,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: CommonImageView(
                            svgPath: "asset/icons/img_subtract.svg",
                            height: getVerticalSize(
                              650.00,
                            ),
                            width: getHorizontalSize(
                              370.00,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 64,
                                    right: 64,
                                    top:20
                                  ),
                                  child:Image.asset(
                                    "asset/icons/img_success_check.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 64,
                                    top: 32,
                                    right: 64,
                                  ),
                                  child: Text(
                                    "Successful!",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.naturalBlack,
                                        fontSize: getFontSize(28),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(left: 28, right: 28, top: 10),
                                  child: Text(
                                    "Your card has been linked successfully.",
                                    textAlign: TextAlign.center,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.naturalGrey4,
                                        fontSize: getFontSize(20),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 38.0, right: 38,top:32),
                                  child: DottedLine(
                                      dashColor: ColorConstant.greyTextColor),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(top: 15, right: 10, left: 40),
                                  child: Text(
                                    "Card ",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.greyTextColor,
                                        fontSize: getFontSize(20),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin:
                                  EdgeInsets.only(top: 12, left: 40, right: 40),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: EdgeInsets.only(
                                          left: 16,
                                          top: 17,
                                          bottom: 16,
                                        ),
                                        color: ColorConstant.primaryWhite,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                        ),
                                        child: Container(
                                          height: getSize(
                                            48.00,
                                          ),
                                          width: getSize(
                                            48.00,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6)),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child:Image.asset(
                                                    'asset/icons/credit_card.png',height: 20,),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 16,
                                          top: 18,
                                          bottom: 16,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: 10,
                                              ),
                                              child: Text(
                                                  linkCardController.cardNumberController.text,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant.primaryBlack,
                                                      fontSize: getFontSize(20),
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),

                                            Container(
                                              width: getHorizontalSize(
                                                179.00,
                                              ),
                                              margin: EdgeInsets.only(
                                                top: 3,
                                              ),
                                              child: Row(

                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    linkCardController.expDateController.text,
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle.DmSansFont.copyWith(
                                                          color: ColorConstant.greyTextColor,
                                                          fontSize: getFontSize(14),
                                                          fontWeight: FontWeight.bold),
                                                    ),



                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0,right: 40,top: 12),
                                child: AppElevatedButton(
                                  buttonName: "Done",
                                  textColor: Colors.white,
                                  buttonColor: ColorConstant.primaryLightGreen,
                                  radius: 16,
                                  onPressed: () {
                                    Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0});
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 64,
                                    top: 25,
                                    right: 64,
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      Get.toNamed(AppRoutes.linkCardAddCardScreen);
                                    },
                                    child: Text(
                                      "Add more",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryDarkGreen,
                                          fontSize: getFontSize(14),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('asset/animations/partyyy.json', height: 300,width: MediaQuery.of(context).size.width),
            ],
          ),
        ],
      ),
    );
  }
}

class TicketUi extends StatelessWidget {
  const TicketUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 220,
            margin: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: TicketPainter(
                borderColor: Colors.black,
                bgColor: const Color(0xFFfed966),
              ),
              child: Container(),
            ),
          ),
        ),
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  final Color borderColor;
  final Color bgColor;

  static const _cornerGap = 20.0;
  static const _cutoutRadius = 20.0;
  static const _cutoutDiameter = _cutoutRadius * 2;

  TicketPainter({required this.bgColor, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final maxWidth = size.width;
    final maxHeight = size.height;

    final cutoutStartPos = maxHeight - maxHeight * 0.2;
    final leftCutoutStartY = cutoutStartPos;
    final rightCutoutStartY = cutoutStartPos - _cutoutDiameter;
    final dottedLineY = cutoutStartPos - _cutoutRadius;
    double dottedLineStartX = _cutoutRadius;
    final double dottedLineEndX = maxWidth - _cutoutRadius;
    const double dashWidth = 8.5;
    const double dashSpace = 4;

    final paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = bgColor;

    final paintBorder = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = borderColor;

    final paintDottedLine = Paint()
      ..color = borderColor.withOpacity(0.5)
      ..strokeWidth = 1.2;

    var path = Path();

    path.moveTo(_cornerGap, 0);
    path.lineTo(maxWidth - _cornerGap, 0);
    _drawCornerArc(path, maxWidth, _cornerGap);
    path.lineTo(maxWidth, rightCutoutStartY);
    _drawCutout(path, maxWidth, rightCutoutStartY + _cutoutDiameter);
    path.lineTo(maxWidth, maxHeight - _cornerGap);
    _drawCornerArc(path, maxWidth - _cornerGap, maxHeight);
    path.lineTo(_cornerGap, maxHeight);
    _drawCornerArc(path, 0, maxHeight - _cornerGap);
    path.lineTo(0, leftCutoutStartY);
    _drawCutout(path, 0.0, leftCutoutStartY - _cutoutDiameter);
    path.lineTo(0, _cornerGap);
    _drawCornerArc(path, _cornerGap, 0);

    canvas.drawPath(path, paintBg);
    canvas.drawPath(path, paintBorder);

    while (dottedLineStartX < dottedLineEndX) {
      canvas.drawLine(
        Offset(dottedLineStartX, dottedLineY),
        Offset(dottedLineStartX + dashWidth, dottedLineY),
        paintDottedLine,
      );
      dottedLineStartX += dashWidth + dashSpace;
    }
  }

  _drawCutout(Path path, double startX, double endY) {
    path.arcToPoint(
      Offset(startX, endY),
      radius: const Radius.circular(_cutoutRadius),
      clockwise: false,
    );
  }

  _drawCornerArc(Path path, double endPointX, double endPointY) {
    path.arcToPoint(
      Offset(endPointX, endPointY),
      radius: const Radius.circular(_cornerGap),
    );
  }

  @override
  bool shouldRepaint(TicketPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TicketPainter oldDelegate) => false;
}
