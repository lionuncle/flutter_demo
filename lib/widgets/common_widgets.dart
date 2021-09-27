
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/res/assets.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/res.dart';
import 'package:flutter_demo/res/strings.dart';
import 'package:flutter_demo/screens/Filter_screen/filter.dart';
import 'package:flutter_demo/widgets/text_views.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommonWidgets {
  static Widget mainButton(String text, {Function? onpress}) {
    return Container(
      width: sizes!.widthRatio * 325,
      height: sizes!.heightRatio * 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.buttonBlue,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: AppColors.buttonBlue,
        boxShadow: [
          BoxShadow(
            color: AppColors.buttonBlueShadow,
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          if (onpress != null) {
            onpress.call();
          }
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: Assets.latoBold,
          ),
        ),
      ),
    );
  }

  static Widget smallButton(
      String? text, double width, double height, String icon,
      {String? fontFamily,
      double? fontSize,
      @required Color? textColor,
      @required bool? selected,
      @required Function? onPress}) {
    if (fontSize != null) {
      fontSize = sizes!.fontRatio * fontSize;
    }

    selected ??= false;

    return Container(
      //padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 12.5, vertical: sizes!.heightRatio * 1),
      width: sizes!.widthRatio * width,
      height: sizes!.heightRatio * height,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.smallButtonBorder,
          width: 0.25,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: AppColors.smallButton,
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.smallButtonShadow,
        //     blurRadius: 18,
        //     offset: Offset(0, 0),
        //   ),
        // ],
      ),
      child: TextButton(
        onPressed: () {
          if (onPress != null) {
            onPress.call();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: sizes!.widthRatio * 20.13,
              height: sizes!.heightRatio * 20.13,
              child: Image.asset(icon),
            ),
            SizedBox(
              width: sizes!.widthRatio * 10,
            ),
            Text(
              text!,
              style: TextStyle(
                color: selected
                    ? AppColors.smallButtonText
                    : AppColors.greyButtonTextColor,
                fontSize: fontSize ?? sizes!.fontRatio * 14,
                fontFamily: fontFamily ?? Assets.latoRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget offerSmallButton(
      String? text, String icon,
      {String? fontFamily,
        double? fontSize,
        @required Color? textColor,
        @required bool? selected,
        @required Function? onPress}) {
    if (fontSize != null) {
      fontSize = sizes!.fontRatio * fontSize;
    }

    selected ??= false;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 12.5, vertical: sizes!.heightRatio * 1),
      //width: sizes!.widthRatio * width,
      //height: sizes!.heightRatio * height,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.smallButtonBorder,
          width: 0.25,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: AppColors.smallButton,
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.smallButtonShadow,
        //     blurRadius: 18,
        //     offset: Offset(0, 0),
        //   ),
        // ],
      ),
      child: TextButton(
        onPressed: () {
          if (onPress != null) {
            onPress.call();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: sizes!.widthRatio * 20.13,
              height: sizes!.heightRatio * 20.13,
              child: Image.asset(icon),
            ),
            SizedBox(
              width: sizes!.widthRatio * 10,
            ),
            Text(
              text!,
              style: TextStyle(
                color: selected
                    ? AppColors.smallButtonText
                    : AppColors.greyButtonTextColor,
                fontSize: fontSize ?? sizes!.fontRatio * 14,
                fontFamily: fontFamily ?? Assets.latoRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget featureSmallButton(
      String? text, double width, double height, String? icon,
      {String? fontFamily,
      double? fontSize,
      @required bool? selected,
      @required Function? onPress}) {
    if (fontSize != null) {
      fontSize = sizes!.fontRatio * fontSize;
    }

    selected ??= false;

    return Container(
      //padding: EdgeInsets.symmetric(
      //horizontal: sizes!.widthRatio * 5, vertical: sizes!.heightRatio * 1),
      //margin: EdgeInsets.symmetric(
      //horizontal: sizes!.widthRatio * 100, vertical: sizes!.heightRatio * 0),
      width: sizes!.widthRatio * width,
      height: sizes!.heightRatio * height,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.smallButtonBorder,
          width: 0.25,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: AppColors.smallButton,
      ),
      child: TextButton(
        onPressed: () {
          if (onPress != null) {
            onPress.call();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: sizes!.widthRatio * 20.13,
              height: sizes!.heightRatio * 20.13,
              child: Image.network(icon ?? ""),
            ),
            SizedBox(
              width: sizes!.widthRatio * 10,
            ),
            Text(
              text ?? "Loading",
              style: TextStyle(
                color: selected
                    ? AppColors.smallButtonText
                    : AppColors.greyButtonTextColor,
                fontSize: fontSize ?? sizes!.fontRatio * 14,
                fontFamily: fontFamily ?? Assets.latoRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget featureChip(
      {@required String? icon,
      @required String? text,
      @required bool? selected,
      @required Function? onPress}) {

    selected ??= false;

    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress.call();
        }
      },
      child: Chip(
        labelPadding: EdgeInsets.all(2.0),
        avatar: Image.network(icon ?? ""),
        label: Text(
          text ?? "",
          style: TextStyle(
            color: selected
                ? AppColors.smallButtonText
                : AppColors.greyButtonTextColor,
            fontSize: sizes!.fontRatio * 12,
            fontFamily: Assets.poppinsRegular,
          ),
        ),
        backgroundColor: AppColors.whiteTextColor,
        elevation: 10.0,
        shadowColor: AppColors.featuresChipShadow,
        padding: EdgeInsets.all(8.0),
      ),
    );
  }

  static Widget loginText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.smallButtonText,
        fontFamily: Assets.latoRegular,
        fontSize: sizes!.fontRatio * fontSize,
      ),
    );
  }

  static Widget customTextField(IconData icon, bool isPassword,
      {String? placeHolder, @required dynamic controller}) {
    return Container(
      padding: EdgeInsets.only(
          left: sizes!.widthRatio * 20, right: sizes!.widthRatio * 7),
      width: sizes!.widthRatio * 325,
      height: sizes!.heightRatio * 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.smallButtonBorder,
          width: 0.25,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: AppColors.whiteTextColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.smallButtonShadow,
            blurRadius: 18,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          hintText: placeHolder ?? "",
          hintStyle: TextStyle(
              color: AppColors.lightGreyTextColor,
              fontFamily: Assets.latoLight,
              fontSize: 14),
          contentPadding: EdgeInsets.only(bottom: sizes!.heightRatio * 10),
          border: InputBorder.none,
          suffixIcon: Icon(
            icon,
            color: AppColors.appTheme,
          ),
        ),
      ),
    );
  }

  static Widget customTextFieldNoIcon(bool isPassword,
      {String? placeHolder, @required dynamic controller}) {
    return Container(
      padding: EdgeInsets.only(
          left: sizes!.widthRatio * 20, right: sizes!.widthRatio * 7),
      width: sizes!.widthRatio * 325,
      height: sizes!.heightRatio * 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.smallButtonBorder,
          width: 0.25,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: AppColors.whiteTextColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.smallButtonShadow,
            blurRadius: 18,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          hintText: placeHolder ?? "",
          hintStyle: TextStyle(
              color: AppColors.lightGreyTextColor,
              fontFamily: Assets.latoLight,
              fontSize: 14),
          contentPadding: EdgeInsets.only(bottom: sizes!.heightRatio * 10),
          border: InputBorder.none,
        ),
      ),
    );
  }

  static Widget customSmallTextField(
      {String? placeHolder,
      TextEditingController? controller,
      double? height,
      double? width}) {
    return Container(
      padding: EdgeInsets.only(
          left: sizes!.widthRatio * 20, right: sizes!.widthRatio * 7),
      width: width ?? sizes!.widthRatio * 130,
      height: height ?? sizes!.heightRatio * 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.smallButtonBorder,
          width: 0.25,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: AppColors.whiteTextColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.smallButtonShadow,
            blurRadius: 18,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: placeHolder ?? "",
          hintStyle: TextStyle(
              color: AppColors.lightGreyTextColor,
              fontFamily: Assets.latoLight,
              fontSize: 14),
          contentPadding: EdgeInsets.only(bottom: sizes!.heightRatio * 14),
          border: InputBorder.none,
        ),
      ),
    );
  }

  static Widget customBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: sizes!.widthRatio * 5,
            vertical: sizes!.heightRatio * 5),
        width: sizes!.widthRatio * 30,
        height: sizes!.heightRatio * 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.smallButtonBorder,
            width: 0.25,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.whiteTextColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.smallButtonShadow,
              blurRadius: 18,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Image.asset(
          Assets.backIcon,
        ),
      ),
    );
  }

  static Widget getAppBarText(BuildContext context, {@required String? text}) {
    return Container(
      padding: EdgeInsets.all(sizes!.widthRatio * 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sizes!.widthRatio * 5,
                  vertical: sizes!.heightRatio * 5),
              width: sizes!.widthRatio * 30,
              height: sizes!.heightRatio * 30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.smallButtonBorder,
                  width: 0.25,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColors.whiteTextColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.smallButtonShadow,
                    blurRadius: 18,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Image.asset(
                Assets.backIcon,
              ),
            ),
          ),
          SizedBox(
            width: sizes!.width * 0.05,
          ),
          TextView.getExtraLargeText(text ?? "", Assets.latoBlack,
              color: AppColors.blackTextColor, lines: 1),
        ],
      ),
    );
  }

  static Widget numberTextField() {
    return Container(
      padding: EdgeInsets.only(
          left: sizes!.widthRatio * 20, right: sizes!.widthRatio * 7),
      width: sizes!.widthRatio * 325,
      height: sizes!.heightRatio * 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.smallButtonBorder,
          width: 0.25,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: AppColors.whiteTextColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.smallButtonShadow,
            blurRadius: 18,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "(303)148-6535",
          hintStyle: TextStyle(
              color: AppColors.lightGreyTextColor,
              fontFamily: Assets.latoLight,
              fontSize: 14),
          contentPadding: EdgeInsets.only(bottom: sizes!.heightRatio * 16),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }

  static Widget customCheckbox(bool isCheck) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (isCheck) {},
          activeColor: AppColors.buttonBlue,
        ),
        CommonWidgets.loginText(
            'Agree with Term and Services', sizes!.fontRatio * 13),
      ],
    );
  }

  static Widget alreadyAccountRow(
      {String? text1, String? text2, Function? onPress}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonWidgets.loginText(text1!, 15),
        TextButton(
          onPressed: () {
            onPress!.call();
          },
          child: Text(
            text2!,
            style: TextStyle(
              color: AppColors.appTheme,
              fontSize: 15,
              fontFamily: Assets.latoBold,
            ),
          ),
        ),
      ],
    );
  }

  static Widget customSearchBar(BuildContext context, {String? hint}) {
    return Container(
      width: sizes!.widthRatio * 324,
      height: sizes!.heightRatio * 50,
      decoration: BoxDecoration(
        color: AppColors.whiteTextColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: AppColors.lightGreyTextColor,
              blurRadius: 2,
              offset: Offset(1, 1))
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(Assets.searchIcon),
              color: AppColors.blueHomeColor,
            ),
            // Icon(
            //   Icons.search,
            //   color: AppColors.blueHomeColor,
            // )
          ),
          Container(
            width: sizes!.widthRatio * 194,
            child: TextField(
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: AppColors.blackTextColor),
                  border: InputBorder.none),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: sizes!.heightRatio * 8.0),
            child: VerticalDivider(
              color: Colors.grey,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        transitionsBuilder:
                            (context, animation, animationTime, child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.bounceInOut);
                          return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, animationTime) {
                          return FilterScreen();
                        }));
              },
              icon: Icon(
                Icons.filter_alt_outlined,
                color: AppColors.blueHomeColor,
              ))
        ],
      ),
    );
  }

  static Widget categoryTabs(
      {@required String? image, @required String? text}) {
    return Column(
      children: [
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteTextColor,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.lightGreyTextColor,
                      blurRadius: 2,
                      offset: Offset(1, 1))
                ]),
            child: TextButton(
              onPressed: () {},
              child: Image.asset(image ?? ''),
            )),
        SizedBox(
          height: 5,
        ),
        TextView.getRegularText(text, Assets.latoRegular,
            color: AppColors.blackTextColor, lines: 1)
      ],
    );
  }

  static Widget headerRow(
      {@required String? headerText,
      @required String? buttonText,
      @required Function? onPress}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView.getLargeText(headerText, Assets.latoRegular,
            color: AppColors.blackTextColor, lines: 1),
      ],
    );
  }

  static Widget seminarsCard({
    @required String? text,
    @required String? date,
    @required String? image,
    @required String? description
  }) {
    return Container(
      height: sizes!.heightRatio * 145,
      width: sizes!.widthRatio * 325,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.lightGreyTextColor,
                blurRadius: 2,
                offset: Offset(1, 1))
          ],
          borderRadius: BorderRadius.circular(25),
          color: Colors.white70,
          image: DecorationImage(
              image: AssetImage(image ?? Assets.seminarimage,), fit: BoxFit.fill)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.blackTextColor,
              AppColors.seminarGradient2,
              AppColors.seminarGradient3,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(sizes!.pagePadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView.getSmallText(
                      text ?? "Educational Seminar", Assets.latoRegular,
                      color: AppColors.whiteTextColor, lines: 1),
                  TextView.getSmallText12(
                    //date,
                      '${DateTimeFormat.format(DateTime.parse(date!), format: 'M j, Y')}',
                      Assets.latoRegular,
                      color: AppColors.whiteTextColor,
                      lines: 1),
                ],
              ),
              SizedBox(
                height: sizes!.heightRatio * 30,
              ),
              TextView.getSmallText(
                  description ??
                      "We are a medium-sized advertising agency with a very large office",
                  Assets.latoLight,
                  color: AppColors.whiteTextColor,
                  lines: 2),
            ],
          ),
        ),
      ),
    );
  }

  static Widget imageContainer({@required String? image}) {
    return Container(
      width: sizes!.widthRatio * 323,
      height: sizes!.heightRatio * 286,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.whiteTextColor,
          boxShadow: [
            BoxShadow(
                color: AppColors.lightGreyTextColor,
                blurRadius: 2,
                offset: Offset(1, 1))
          ],
          image: DecorationImage(
              image: AssetImage(image ?? ''), fit: BoxFit.values[5])),
    );
  }

  static Widget seminarsCardWithDetail(
      {@required String? text,
      @required String? date,
      @required String? image,
      @required String? description}) {
    return Container(
      width: sizes!.widthRatio * 280,
      height: sizes!.heightRatio * 150,
      margin: EdgeInsets.only(right: sizes!.widthRatio * 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(
            image ?? Assets.seminarimage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.blackTextColor,
              AppColors.seminarGradient2,
              AppColors.seminarGradient3,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(sizes!.pagePadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView.getSmallText(
                      text ?? "Educational Seminar", Assets.latoRegular,
                      color: AppColors.whiteTextColor, lines: 1),
                  TextView.getSmallText12(
                      //date,
                      '${DateTimeFormat.format(DateTime.parse(date!), format: 'M j, Y')}',
                      Assets.latoRegular,
                      color: AppColors.whiteTextColor,
                      lines: 1),
                ],
              ),
              SizedBox(
                height: sizes!.heightRatio * 30,
              ),
              TextView.getSmallText(
                  description ??
                      "We are a medium-sized advertising agency with a very large office",
                  Assets.latoLight,
                  color: AppColors.whiteTextColor,
                  lines: 2),
            ],
          ),
        ),
      ),
    );
  }

  static Widget officeInfoContainer(
      {@required String? name,
      @required String? area,
      @required String? price,
      @required int? distance,
      @required String? open,
      @required String? ratingText,
      @required String? description,
      @required double? starRating,
      @required Function? onPress,
        ignoreEdit
      }) {
    return Container(
        margin: EdgeInsets.only(bottom: sizes!.heightRatio * 5),
        padding: EdgeInsets.only(bottom: sizes!.heightRatio * 20),
        //width: sizes!.widthRatio * 330,
        //height: sizes!.heightRatio * 277,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColors.whiteTextColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: sizes!.widthRatio * 15,
                  right: sizes!.widthRatio * 15,
                  top: sizes!.heightRatio * 15,
                  bottom: sizes!.heightRatio * 15),
              width: sizes!.widthRatio * 400,
              //height: sizes!.heightRatio * 180,
              child: Image.asset(Assets.officeImage),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15),
              child: Row(
                children: [
                  TextView.getMediumText(name ?? "sample", Assets.latoBlack,
                      color: AppColors.blackTextColor, lines: 1),
                  SizedBox(
                    width: sizes!.widthRatio * 5,
                  ),
                  TextView.getSmallText(
                      area != null ? "($area)" : "sample", Assets.latoRegular,
                      color: AppColors.smallOfficeSizeText, lines: 1),
                  Spacer(),
                  Container(
                    width: sizes!.widthRatio * 49,
                    height: sizes!.heightRatio * 21,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: AppColors.appTheme,
                    ),
                    child: Center(
                      child: TextView.getSmallText(
                          price != null ? "$price\$" : "sample",
                          Assets.latoRegular,
                          color: AppColors.whiteTextColor,
                          lines: 1),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: sizes!.heightRatio * 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15),
              child: Row(
                children: [
                  TextView.getSmallText(
                      distance != null
                          ? "Hotel '$distance'km Distance. "
                          : "sample",
                      Assets.latoBold,
                      color: AppColors.clr_light_black,
                      lines: 1),
                  TextView.getSmallText(
                      open != null ? open : "open", Assets.latoBold,
                      color: AppColors.blueHomeColor, lines: 1),
                  Spacer(),
                  TextView.getExtraSmallText(
                      ratingText, Assets.latoRegular,
                      color: AppColors.blackTextColor, lines: 1),
                  SizedBox(
                    width: sizes!.widthRatio * 3,
                  ),
                  RatingBar.builder(
                    initialRating: starRating ?? 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 11,
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: ignoreEdit??true,
                    onRatingUpdate: (rating) {
                      onPress!.call(rating);
                      print(rating);
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: sizes!.heightRatio * 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15),
              child: TextView.getRegularText(
                description != null ? description : "sample",
                Assets.latoRegular,
                color: AppColors.officeDetailText,
                lines: 3,
              ),
            ),
          ],
        ));
  }

  static Widget officeInfoContainer2({
    @required String? name,
    @required String? area,
    @required int? distance,
    @required String? open,
    @required String? description,
    @required double? starRating,
    @required String? ratingText,
    @required Function? onPress,
    ignoreEdit}) {
    return Container(
        margin: EdgeInsets.only(bottom: sizes!.heightRatio * 15),
        padding: EdgeInsets.only(bottom: sizes!.heightRatio * 20),
        //width: sizes!.widthRatio * 330,
        //height: sizes!.heightRatio * 277,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.lightGreyTextColor,
                blurRadius: 2,
                offset: Offset(1, 1))
          ],
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColors.whiteTextColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: sizes!.widthRatio * 15,
                  right: sizes!.widthRatio * 15,
                  top: sizes!.heightRatio * 15,
                  bottom: sizes!.heightRatio * 15),
              //width: sizes!.widthRatio * 400,
              //height: sizes!.heightRatio * 180,
              child: Image.asset(Assets.seminarimage),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15),
              child: Row(
                children: [
                  TextView.getMediumText(
                      name, Assets.latoBlack,
                      color: AppColors.blackTextColor, lines: 1),
                  SizedBox(
                    width: sizes!.widthRatio * 5,
                  ),
                  TextView.getSmallText(area != null ? "($area)" : "sample", Assets.latoRegular,
                      color: AppColors.smallOfficeSizeText, lines: 1),
                  //Spacer(),
                  // Container(
                  //   width: sizes!.widthRatio * 49,
                  //   height: sizes!.heightRatio * 21,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(4)),
                  //     color: AppColors.appTheme,
                  //   ),
                  //   child: Center(
                  //     child: TextView.getSmallText(
                  //         Strings.officePriceText, Assets.latoRegular,
                  //         color: AppColors.whiteTextColor, lines: 1),
                  //   ),
                  // )
                ],
              ),
            ),
            SizedBox(
              height: sizes!.heightRatio * 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15),
              child: Row(
                children: [
                  TextView.getSmallText(
                      distance != null
                          ? "Hotel '$distance'km Distance. "
                          : "sample", Assets.latoBold,
                      color: AppColors.clr_light_black, lines: 1),
                  TextView.getSmallText(open != null ? open : "open", Assets.latoBold,
                      color: AppColors.blueHomeColor, lines: 1),
                  Spacer(),
                  TextView.getExtraSmallText(
                      ratingText, Assets.latoRegular,
                      color: AppColors.blackTextColor, lines: 1),
                  SizedBox(
                    width: sizes!.widthRatio * 3,
                  ),
                  RatingBar.builder(
                    initialRating: starRating ?? 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 11,
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: ignoreEdit??true,
                    onRatingUpdate: (rating) {
                      onPress!.call(rating);
                      print(rating);
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: sizes!.heightRatio * 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15),
              child: TextView.getRegularText(
                description != null ? description : "sample",
                Assets.latoRegular,
                color: AppColors.officeDetailText,
                lines: 3,
              ),
            ),
          ],
        ));
  }

  static Widget getTextFieldRemarks({
    @required bool? isPassword,
    @required TextEditingController? textEditingController,
    @required String? hintText,
  }) {
    return Container(
      height: sizes!.height * 0.2,
      width: sizes!.width,
      padding: EdgeInsets.only(
          left: sizes!.width * 0.05,
          right: sizes!.width * 0.05,
          top: sizes!.width * 0.02),
      decoration: BoxDecoration(
          color: AppColors.whiteTextColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: AppColors.lightGreyTextColor,
                blurRadius: 2,
                offset: Offset(1, 1))
          ]),
      child: Container(
        width: sizes!.width * 0.7,
        child: TextField(
            style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: Assets.latoLight,
                fontSize: sizes!.regularFontSize,
                color: AppColors.smallButtonText),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            //Normal textInputField will be displayed
            maxLines: 10,
            controller: textEditingController,
            // readOnly: true,
            decoration: InputDecoration(
              // prefixIcon: Image(image: AssetImage('$leftIcon')) ,
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: TextStyle(
                decoration: TextDecoration.none,
                fontSize: sizes!.regularFontSize,
                color: AppColors.smallButtonText,
                fontFamily: Assets.latoLight,
              ),
            ),
            textAlignVertical: TextAlignVertical.top),
      ),
    );
  }

  static Widget officeInfoSmallContainer(
      {@required String? heading,
      @required String? date,
      @required String? detail,
      @required String? image}) {
    return Container(
        margin: EdgeInsets.only(bottom: sizes!.heightRatio * 15),
        padding: EdgeInsets.only(bottom: sizes!.heightRatio * 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColors.whiteTextColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: sizes!.widthRatio * 15,
                  right: sizes!.widthRatio * 15,
                  top: sizes!.heightRatio * 15,
                  bottom: sizes!.heightRatio * 15),
              child: Image.asset(image ?? Assets.officeImage2),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15),
              child: Row(
                children: [
                  TextView.getMediumText(heading, Assets.latoBlack,
                      color: AppColors.blackTextColor, lines: 1),
                  Spacer(),
                  TextView.getSmallText12(
                    date ?? "May 14, 2021",
                      //'${DateTimeFormat.format(DateTime.parse(date!), format: 'M j, Y')}',
                      Assets.latoBold,
                      color: AppColors.clr_light_black, lines: 1),
                ],
              ),
            ),
            SizedBox(
              height: sizes!.heightRatio * 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15),
              child: TextView.getRegularText(
                detail,
                Assets.latoRegular,
                color: AppColors.officeDetailText,
                lines: 3,
              ),
            ),
          ],
        ));
  }

  static Widget eventsOfficeInfoSmallContainer(
      {@required String? heading,
        @required String? date,
        @required String? detail,
        @required String? image}) {
    return Container(
        margin: EdgeInsets.only(bottom: sizes!.heightRatio * 15),
        padding: EdgeInsets.only(bottom: sizes!.heightRatio * 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColors.whiteTextColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: sizes!.widthRatio * 15,
                  right: sizes!.widthRatio * 15,
                  top: sizes!.heightRatio * 15,
                  bottom: sizes!.heightRatio * 15),
              child: Image.asset(image ?? Assets.officeImage2),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15),
              child: Row(
                children: [
                  TextView.getMediumText(heading, Assets.latoBlack,
                      color: AppColors.blackTextColor, lines: 1),
                  Spacer(),
                  TextView.getSmallText12(
                      '${DateTimeFormat.format(DateTime.parse(date!), format: 'M j, Y')}',
                      Assets.latoBold,
                      color: AppColors.clr_light_black, lines: 1),
                ],
              ),
            ),
            SizedBox(
              height: sizes!.heightRatio * 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15),
              child: TextView.getRegularText(
                detail,
                Assets.latoRegular,
                color: AppColors.officeDetailText,
                lines: 3,
              ),
            ),
          ],
        ));
  }

  static Widget cafeContainer(
      {@required String? name,
      @required String? type,
      @required String? date,
      @required String? start,
      @required String? end,
      @required int? persons,
      @required String? icon,
      @required Function? onIconPress}) {
    if (icon == null) {
      icon = Assets.chatIcon;
    }
    if (date != null) {
      DateTime dateTime = DateTime.parse(date);
      date = dateTime.format('j M');
    }
    // if(start != null) {
    //   DateTime dateTime = DateTime.parse(start);
    //   final timeOffset = dateTime.add(Duration(hours: 0));
    //   start = DateTimeFormat.format(timeOffset, format: 'h:i A');
    // }

    return Container(
      margin: EdgeInsets.only(bottom: sizes!.heightRatio * 15),
      padding: EdgeInsets.symmetric(
          horizontal: sizes!.widthRatio * 15,
          vertical: sizes!.heightRatio * 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.smallButtonShadow,
              blurRadius: 10,
              offset: Offset(0, 0))
        ],
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: AppColors.whiteTextColor,
      ),
      child: Row(
        children: [
          Container(
            width: sizes!.widthRatio * 140,
            height: sizes!.heightRatio * 120,
            child: Image.asset(Assets.cafeImage),
          ),
          SizedBox(
            width: sizes!.widthRatio * 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView.getMediumText16(
                  name ?? Strings.cafeCaspianText, Assets.latoBold,
                  color: AppColors.blackTextColor, lines: 1),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              RichText(
                text: TextSpan(
                  text: type ?? "Cafe",
                  style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontFamily: Assets.latoLight,
                    fontSize: sizes!.fontRatio * 13,
                  ),
                  children: [
                    TextSpan(
                      text: " - ",
                      style: TextStyle(
                        color: AppColors.blackTextColor,
                        fontFamily: Assets.latoLight,
                        fontSize: sizes!.fontRatio * 13,
                      ),
                    ),
                    TextSpan(
                      text: date ?? "",
                      style: TextStyle(
                        color: AppColors.blackTextColor,
                        fontFamily: Assets.latoLight,
                        fontSize: sizes!.fontRatio * 13,
                      ),
                    ),
                  ],
                ),
              ),
              // TextView.getSmallText(Strings.cafeDateText, Assets.latoLight,
              //     color: AppColors.blackTextColor, lines: 1),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              RichText(
                text: TextSpan(
                  text: start ?? "",
                  style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontFamily: Assets.latoLight,
                    fontSize: sizes!.fontRatio * 13,
                  ),
                  children: [
                    TextSpan(
                      text: " - ",
                      style: TextStyle(
                        color: AppColors.blackTextColor,
                        fontFamily: Assets.latoLight,
                        fontSize: sizes!.fontRatio * 13,
                      ),
                    ),
                    TextSpan(
                      text: end ?? "",
                      style: TextStyle(
                        color: AppColors.blackTextColor,
                        fontFamily: Assets.latoLight,
                        fontSize: sizes!.fontRatio * 13,
                      ),
                    ),
                  ],
                ),
              ),
              // TextView.getSmallText(Strings.cafeTimingText, Assets.latoLight,
              //     color: AppColors.blackTextColor, lines: 1),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: sizes!.widthRatio * 3,
                    vertical: sizes!.heightRatio * 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: AppColors.buttonBlueShadowlight,
                ),
                child: TextView.getSmallText11(
                    "$persons persons" ?? "", Assets.latoRegular,
                    color: AppColors.blackTextColor, lines: 1),
              ),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: sizes!.widthRatio * 78,
                    height: sizes!.heightRatio * 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (onIconPress != null) {
                        onIconPress.call();
                      }
                    },
                    child: Container(
                      width: sizes!.widthRatio * 60,
                      height: sizes!.heightRatio * 25,
                      child: Image.asset(icon),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String? formatDate({@required String? date}) {
    if (date != null) {
      DateTime dateTime = DateTime.parse(date);
      date = dateTime.format('j M');
      return date;
    } else {
      return date;
    }
  }

  static Widget cardData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: sizes?.pagePadding ?? 15,
              bottom: sizes?.mediumPadding ?? 10),
          child: TextView.getRegularText("Card Owner", Assets.latoRegular,
              color: AppColors.blackHeading, lines: 1),
        ),
        Center(
            child: CommonWidgets.customTextField(Icons.check, false,
                placeHolder: "randy.hudson")),
        SizedBox(
          height: getHeight() * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: sizes?.pagePadding ?? 15,
              bottom: sizes?.mediumPadding ?? 10),
          child: TextView.getRegularText("Card Number", Assets.latoRegular,
              color: AppColors.blackHeading, lines: 1),
        ),
        Center(
            child: CommonWidgets.customTextField(Icons.check, false,
                placeHolder: "XXX-983264893")),
        SizedBox(
          height: getHeight() * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: sizes?.pagePadding ?? 15, right: sizes?.pagePadding ?? 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: sizes?.mediumPadding ?? 10),
                    child: TextView.getRegularText("CCV", Assets.latoRegular,
                        color: AppColors.blackHeading, lines: 1),
                  ),
                  CommonWidgets.customSmallTextField(placeHolder: "2454"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: sizes?.mediumPadding ?? 10),
                    child: TextView.getRegularText(
                        "Expiry Date", Assets.latoRegular,
                        color: AppColors.blackHeading, lines: 1),
                  ),
                  CommonWidgets.customSmallTextField(placeHolder: "14-04-2022"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  static double getHeight() => sizes?.height ?? 2560;

  static double getWidth() => sizes?.width ?? 1440;

  static Widget bookingDetailContainer({
    @required String? placeName,
    @required String? workSpace,
    @required String? persons,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: sizes!.heightRatio * 15),
      padding: EdgeInsets.symmetric(
          horizontal: sizes!.widthRatio * 15,
          vertical: sizes!.heightRatio * 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.smallButtonShadow,
              blurRadius: 10,
              offset: Offset(0, 0))
        ],
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: AppColors.whiteTextColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: sizes!.widthRatio * 120,
            height: sizes!.heightRatio * 100,
            child: Image.asset(Assets.cafeImage),
          ),
          SizedBox(
            width: sizes!.widthRatio * 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: sizes!.heightRatio * 5),
              Container(
                width: sizes!.width * 0.45,
                child: TextView.getMediumText(placeName, Assets.latoBold,
                    color: AppColors.blackTextColor, lines: 2),
              ),
              SizedBox(height: sizes!.heightRatio * 5),
              TextView.getSmallText(workSpace, Assets.latoLight,
                  color: AppColors.blackTextColor, lines: 1),
              SizedBox(height: sizes!.heightRatio * 5),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: sizes!.widthRatio * 3,
                    vertical: sizes!.heightRatio * 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: AppColors.buttonBlueShadowlight,
                ),
                child: TextView.getSmallText11('$persons Persons', Assets.latoRegular,
                    color: AppColors.blackTextColor, lines: 1),
              ),
              SizedBox(height: sizes!.heightRatio * 5),
              TextView.getSmallText12(Strings.seeDetailText, Assets.latoBold,
                  color: AppColors.navyBlueColor, lines: 1),
            ],
          ),
        ],
      ),
    );
  }

  static Widget subscriptionCard(
      {@required String? headerText,
      @required double? secondText,
      @required String? details,
      @required bool? isGreen}) {
    return Container(
      //width: sizes!.widthRatio * 323,
      //height: sizes!.heightRatio * 140,
      padding: EdgeInsets.symmetric(
          horizontal: sizes!.pagePadding, vertical: sizes!.pagePadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              isGreen ?? true ? AppColors.greenColor : AppColors.whiteTextColor,
          boxShadow: [
            BoxShadow(
                color: AppColors.veryLightGreyTextColor,
                offset: Offset(1, 1),
                blurRadius: 5)
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView.getLargeText(headerText ?? "Monthly", Assets.latoRegular,
                  color: isGreen ?? true
                      ? AppColors.whiteTextColor
                      : AppColors.blackTextColor,
                  lines: 1),
              TextView.getRegularText("QR $secondText", Assets.latoRegular,
                  color: isGreen ?? true
                      ? AppColors.whiteTextColor
                      : AppColors.blackTextColor,
                  lines: 1),
            ],
          ),
          SizedBox(height: sizes!.heightRatio * 7),
          TextView.getSmallText(
              details ?? "Lorem Ipsum dolor sit", Assets.latoRegular,
              color: isGreen ?? true
                  ? AppColors.whiteTextColor
                  : AppColors.blackTextColor,
              lines: 3),
        ],
      ),
    );
  }

  static Widget starBar({@required Function? onPress, ignoreEdit, @required double? starRating}) {
    return RatingBar.builder(


      initialRating: starRating?? 4,
      unratedColor: AppColors.transparentColor,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 11,
      itemPadding:
      EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.white,
      ),
      ignoreGestures: ignoreEdit??true,
      onRatingUpdate: (rating) {
        onPress!.call(rating);
        print(rating);
      },
    );
  }
}
