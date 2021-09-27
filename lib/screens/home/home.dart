import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/animations/slide_right.dart';
import 'package:flutter_demo/common/utils.dart';
import 'package:flutter_demo/res/assets.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/res.dart';
import 'package:flutter_demo/res/strings.dart';
import 'package:flutter_demo/screens/home/home_components.dart';
import 'package:flutter_demo/screens/home/home_provider.dart';
import 'package:flutter_demo/widgets/common_widgets.dart';
import 'package:flutter_demo/widgets/text_views.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeProvider homeProvider;
  List<String> categoryImages = [
    'assets/png/office.png',
    'assets/png/food.png',
    'assets/png/workspace.png',
    'assets/png/coffee.png',
    'assets/png/coffee.png',
  ];

  @override
  void initState() {
    super.initState();
    homeProvider = HomeProvider();
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: sizes!.height,
        width: sizes!.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.appBgImage), fit: BoxFit.fill)),
        //     horizontal: sizes!.pagePadding, vertical: sizes!.pagePadding),
        child: homeProvider.isAdsFetched
            ? SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: sizes!.pagePadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView.getRegularTextHeavy(
                          'Hi, ${PreferenceUtils.getString(Strings.loginName)}',
                          Assets.latoRegular,
                          color: AppColors.darkGreyTextColor,
                          lines: 50,
                        ),
                        HomeComponents.notificationButton(context),
                      ],
                    ),
                  ),

                  SizedBox(height: sizes!.heightRatio * 10),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: sizes!.pagePadding),
                    child: TextView.getExtraLargeText(
                        'What are you looking for?', Assets.latoRegular,
                        color: Colors.black, lines: 1),
                  ),
                  SizedBox(
                    height: sizes!.heightRatio * 20,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: sizes!.pagePadding),
                    child: CommonWidgets.customSearchBar(context,
                        hint: 'Location'),
                  ),
                  SizedBox(
                    height: sizes!.heightRatio * 30,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: sizes!.pagePadding),
                    child: TextView.getLargeText('Category', Assets.latoRegular,
                        color: AppColors.blackTextColor, lines: 1),
                  ),
                  SizedBox(
                    height: sizes!.heightRatio * 20,
                  ),
                  homeProvider.getHomeResponse!.data!.categories!.length > 0
                      ? Container(
                          height: sizes!.height * 0.12,
                          padding: EdgeInsets.symmetric(
                              horizontal: sizes!.pagePadding),
                          child: ListView.builder(
                              itemCount: homeProvider
                                  .getHomeResponse!.data!.categories!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      right: sizes!.width * 0.07),
                                  child: CommonWidgets.categoryTabs(
                                      image: categoryImages[index],
                                      text: homeProvider.getHomeResponse!.data!
                                              .categories![index].name ??
                                          ""),
                                );
                              }),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     CommonWidgets.categoryTabs(
                          //         image: 'assets/png/coffee.png', text: 'Cafe'),
                          //     CommonWidgets.categoryTabs(
                          //         image: 'assets/png/workspace.png', text: 'Work space'),
                          //     CommonWidgets.categoryTabs(
                          //         image: 'assets/png/food.png', text: 'Restaurant'),
                          //     CommonWidgets.categoryTabs(
                          //         image: 'assets/png/office.png', text: 'Office')
                          //   ],
                          // ),
                        )
                      : TextView.getLargeText(
                          "Nothing to Show", Assets.latoRegular,
                          color: AppColors.blackTextColor, lines: 1),
                  SizedBox(
                    height: sizes!.heightRatio * 30,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: sizes!.pagePadding),
                    child: CommonWidgets.headerRow(
                        headerText: 'Your Preference',
                        buttonText: 'Explore More',
                        onPress: goToCheckIn),
                  ),

                  SizedBox(
                    height: sizes!.heightRatio * 20,
                  ),
                  homeProvider.getHomeResponse!.data!.preferences!.length > 0
                      ? Container(
                          height: sizes!.height * 0.36,
                          child: ListView.builder(
                              itemCount: homeProvider
                                  .getHomeResponse!.data!.preferences!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: sizes!.pagePadding),
                                  child: Container(
                                    //height: sizes!.height * 0.40,
                                    width: sizes!.width * 0.88,
                                    child: CommonWidgets.officeInfoContainer(
                                        name: homeProvider
                                                .getHomeResponse!
                                                .data!
                                                .preferences![index]
                                                .name ??
                                            "",
                                        area: homeProvider
                                                .getHomeResponse!
                                                .data!
                                                .preferences![index]
                                                .area ??
                                            "",
                                        price: (homeProvider.getHomeResponse!.data!.preferences![index].price ?? "")
                                            .toString(),
                                        distance: homeProvider.getHomeResponse!
                                            .data!.preferences![index].distance,
                                        open: "Open",
                                        description: homeProvider
                                            .getHomeResponse!
                                            .data!
                                            .preferences![index]
                                            .description,
                                        ratingText: homeProvider
                                            .getHomeResponse!
                                            .data!
                                            .preferences![index]
                                            .rating.toString(),
                                        starRating: homeProvider
                                            .getHomeResponse!
                                            .data!
                                            .preferences![index]
                                            .rating,
                                        onPress: () {}),
                                  ),
                                );
                              }),
                        )
                      : TextView.getLargeText(
                          "Nothing to Show", Assets.latoRegular,
                          color: AppColors.blackTextColor, lines: 1),
                  SizedBox(
                    height: sizes!.heightRatio * 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: sizes!.pagePadding),
                    child: CommonWidgets.headerRow(
                      headerText: 'Updates Around You',
                      buttonText: 'See all',
                    ),
                  ),
                  SizedBox(
                    height: sizes!.heightRatio * 20,
                  ),
                  //
                  homeProvider.getHomeResponse!.data!.updates!.length > 0
                      ? Padding(
                          padding: EdgeInsets.only(
                              left: sizes!.pagePadding,
                              right: sizes!.pagePadding,
                              bottom: sizes!.pagePadding),
                          child: CommonWidgets.seminarsCard(
                              text: homeProvider.getHomeResponse!.data!.updates![0].name ?? "",
                              date: homeProvider.getHomeResponse!.data!.updates![0].date ?? "",
                              image: Assets.seminarimage,
                              description: homeProvider.getHomeResponse!.data!.updates![0].description ?? ""),

                          // CommonWidgets.seminarsCard(
                          //     text: homeProvider.getHomeResponse!.data!
                          //             .updates![0].name ??
                          //         "",
                          //     date: homeProvider.getHomeResponse!.data!
                          //             .updates![0].date ??
                          //         ""),
                        )
                      : Container(),
                  // SizedBox(height: sizes!.heightRatio * 20,),
                ],
              ))
            : Center(
                child: Container(
                  height: sizes!.height * 0.15,
                  child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
                ),
              ),
      ),
    ));
  }

  void goToCheckIn() {
    // Navigator.pushReplacement(
    //     context,
    //     SlideRightRoute(
    //         page: BottomTab(
    //       pageIndex: 0,
    //     )));
  }
}
