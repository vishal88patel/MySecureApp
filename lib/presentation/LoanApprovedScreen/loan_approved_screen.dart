import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_secure_app/presentation/LoanApprovedScreen/controller/loan_approved_screen_controller.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/appbar_image_1.dart';

class LoanApprovedScreen extends StatelessWidget {
  var loanApprovedController = Get.find<LoanApprovedSScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryDarkGreen,
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AppbarImage1(
                    height: getVerticalSize(
                      120.00,
                    ),
                    width: getHorizontalSize(
                      359.00,
                    ),
                    imagePath: "asset/icons/img_ribbons_1.png",
                  ),
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      "Payment Receipt",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.primaryWhite,
                          fontSize: getFontSize(28)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: size.height / 1.2,
                width: getHorizontalSize(370),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                child: CustomPaint(
                  painter: TicketPainter(
                    borderColor: ColorConstant.primaryBlack,
                    bgColor: ColorConstant.primaryWhite,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(getVerticalSize(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(15.0),
                                    child: Image.asset(
                                      "asset/icons/doller_card.png",
                                      height: 220,
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(
                                  height: getVerticalSize(30),
                                ),
                                Text(
                                  "Name",
                                  style: AppStyle.DmSansFont
                                      .copyWith(
                                      color: ColorConstant.lightText,
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFontSize(18)),
                                ),
                                Obx(
                                      () => Text(
                                    loanApprovedController.HeadeName.value,
                                    style: AppStyle.DmSansFont
                                        .copyWith(
                                        color:
                                        ColorConstant.primaryBlack,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(24)),
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(30),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        /* Text(
                                              "Date",
                                              style: AppStyle
                                                  .DmSansFont
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .lightText,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize:
                                                          getFontSize(18)),
                                            ),
                                            Text(
                                              "21 Dec 2021",
                                              style: AppStyle.textStyleSFPROBold
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .primaryBlack,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          getFontSize(24)),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(30),
                                            ),*/
                                        Text(
                                          "Loan Type",
                                          style: AppStyle
                                              .DmSansFont
                                              .copyWith(
                                              color: ColorConstant
                                                  .lightText,
                                              fontWeight:
                                              FontWeight.w400,
                                              fontSize:
                                              getFontSize(18)),
                                        ),
                                        Obx(
                                              () => Text(
                                            loanApprovedController.loan_type
                                                .toString(),
                                            style: AppStyle
                                                .DmSansFont
                                                .copyWith(
                                                color: ColorConstant
                                                    .primaryBlack,
                                                fontWeight:
                                                FontWeight.w700,
                                                fontSize:
                                                getFontSize(24)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        /*Text(
                                              "TIme",
                                              style: AppStyle
                                                  .DmSansFont
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .lightText,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize:
                                                          getFontSize(18)),
                                            ),
                                            Text(
                                              "07:00 PM",
                                              style: AppStyle.textStyleSFPROBold
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .primaryBlack,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          getFontSize(24)),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(30),
                                            ),*/
                                        Text(
                                          "Amount ",
                                          style: AppStyle
                                              .DmSansFont
                                              .copyWith(
                                              color: ColorConstant
                                                  .lightText,
                                              fontWeight:
                                              FontWeight.w400,
                                              fontSize:
                                              getFontSize(18)),
                                        ),
                                        Obx(
                                              () => Text(
                                            "\$" +
                                                loanApprovedController
                                                    .loanCalModel
                                                    .value
                                                    .data!
                                                    .loanAmount
                                                    .toString(),
                                            style: AppStyle
                                                .DmSansFont
                                                .copyWith(
                                                color: ColorConstant
                                                    .primaryBlack,
                                                fontWeight:
                                                FontWeight.w700,
                                                fontSize:
                                                getFontSize(24)),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(15),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: getHorizontalSize(340),
                                height: getVerticalSize(1),
                                color: ColorConstant.divider,
                              ),
                              SizedBox(
                                height: getVerticalSize(40),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Congratulations,",
                                      style: AppStyle.DmSansFont
                                          .copyWith(
                                          color:
                                          ColorConstant.lightGreen,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(16)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Your Loan is Approved! and the Amount has been Credited in Your Wallet",
                                      style: AppStyle.DmSansFont
                                          .copyWith(
                                          color: ColorConstant
                                              .primaryBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(16)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(60),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                      "asset/icons/barcode_image.jpeg"),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        top: 190,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Lottie.asset('asset/animations/approved_anim.json',height: 80),
                            Transform.rotate(
                              angle: 0.6,
                              child: Image.asset(
                                "asset/icons/approved_sign.png",
                                height: 70,
                                width: 200,
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
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
