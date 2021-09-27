import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/res/assets.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/res.dart';
import 'package:flutter_demo/screens/Filter_screen/filter_components.dart';
import 'package:flutter_demo/widgets/common_widgets.dart';
import 'package:flutter_demo/widgets/text_views.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _currentSliderValue = 0;

  @override
  void initState() {
    //Constants.route = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Container(
            height: sizes!.height,
            width: sizes!.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        Assets.appBgImage
                    ),
                    fit: BoxFit.fill
                )
            ),
            padding: EdgeInsets.only(left: sizes!.pagePadding, right: sizes!.pagePadding, top: sizes!.pagePadding),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView.getExtraLargeText('Filters', Assets.latoRegular, color: AppColors.blackTextColor, lines: 1),
                      IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.clear,color: AppColors.blackTextColor,),
                      )
                    ],
                  ),
                  SizedBox(height: sizes!.heightRatio * 40),

                  TextView.getLargeText('Range', Assets.latoRegular, color: AppColors.blackTextColor, lines: 1),
                  SizedBox(height: sizes!.heightRatio * 20),

              Container(width: sizes!.width,
                child: Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 50,
                  divisions: 50,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  label: "$_currentSliderValue",
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView.getSmallTextHeavy('0 km', Assets.latoRegular, color: AppColors.blackTextColor, lines: 1),
                    TextView.getSmallTextHeavy('50 km', Assets.latoRegular, color: AppColors.blackTextColor, lines: 1),
                  ],
                ),
              ),
                  SizedBox(height: sizes!.heightRatio * 40),
                  TextView.getLargeText('Features', Assets.latoRegular, color: AppColors.blackTextColor, lines: 1),
                  SizedBox(height: sizes!.heightRatio * 20),
                  FilterComponents.categoryList(),
                  SizedBox(height: sizes!.heightRatio * 50),

                  CommonWidgets.mainButton('Apply',
                      onpress: () {}
                  ),
                  SizedBox(height: sizes!.heightRatio * 15),

                ],

              ),
            ),
          ),
        ));
  }
}
