import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:secureapp/presentation/LoanApprovedScreen/controller/loan_approved_screen_controller.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/appbar_image_1.dart';
import '../../Custom Widgets/common_image_view.dart';

class LoanApprovedScreen extends StatelessWidget {
  var loanApprovedController = Get.find<LoanApprovedSScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryDarkGreen,
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
                    "Payment Receipt",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppStyle.DmSansFont.copyWith(
                        color: ColorConstant.primaryWhite,
                        fontSize: getFontSize(28)),
                  ),
                ),
              ),
              Container(
                width: size.width,
                child: SingleChildScrollView(
                  child: Container(
                    height: getVerticalSize(
                      750.00,
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CommonImageView(
                            svgPath: "asset/icons/img_subtract.svg",
                            height: getVerticalSize(
                              750.00,
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
                                  ),
                                  child: CommonImageView(
                                    svgPath: "asset/icons/img_checkmark.svg",
                                    height: getSize(
                                      100.00,
                                    ),
                                    width: getSize(
                                      100.00,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 64,
                                    top: 16,
                                    right: 64,
                                  ),
                                  child: Text(
                                    "Congratulations",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.primaryLightGreen,
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
                                  child: Flexible(
                                    child: Text(
                                      "Your Loan is Approved! and the Amount has been Credited in Your Wallet",

                                      textAlign: TextAlign.center,
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.greyTextColor,
                                          fontSize: getFontSize(20),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(left: 28, right: 28, top: 10),
                                  child: Text(
                                    "Total Amount",
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
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 28, right: 28, top: 10, bottom: 5),
                                  child: Obx(
                                      ()=> Text(
                                      "\$" +
                                    loanApprovedController
                                        .loanCalModel
                                        .value
                                        .data!
                                        .loanAmount
                                        .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontSize: getFontSize(28),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 38.0, right: 38),
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
                                    "Payment to ",
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
                                                child: SvgPicture.asset(
                                                    "asset/icons/ic_starbucks.svg"),
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
                                              child: Obx(
                                                ()=> Text(
                                                  loanApprovedController.HeadeName.value,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.DmSansFont.copyWith(
                                                      color: ColorConstant.primaryBlack,
                                                      fontSize: getFontSize(20),
                                                      fontWeight: FontWeight.bold),
                                                ),
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
                                                  Obx(
                                                  ()=> Text(
                                                      loanApprovedController.loan_type
                                                          .toString(),
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle.DmSansFont.copyWith(
                                                          color: ColorConstant.greyTextColor,
                                                          fontSize: getFontSize(14),
                                                          fontWeight: FontWeight.bold),
                                                    ),
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
                                  buttonName: "Go To Wallet",
                                  textColor: Colors.white,
                                  buttonColor: ColorConstant.primaryLightGreen,
                                  radius: 16,
                                  onPressed: () {},
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
                                  child: Text(
                                    "Thank you",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.primaryDarkGreen,
                                        fontSize: getFontSize(14),
                                        fontWeight: FontWeight.bold),
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
