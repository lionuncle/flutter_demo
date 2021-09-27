import 'package:flutter/material.dart';
import 'package:flutter_demo/res/assets.dart';
import 'package:flutter_demo/widgets/common_widgets.dart';

class FilterComponents {

  static Widget categoryList() {
    return Wrap(
        spacing: 5,
        runSpacing: 10,
        children: [
          CommonWidgets.smallButton('Internet', 115, 40, Assets.wifiColorIcon),
          CommonWidgets.smallButton('Coffee', 107, 40, Assets.coffeeColorIcon),
          CommonWidgets.smallButton('LEDs', 90, 40, Assets.ledGreyIcon),
          CommonWidgets.smallButton('Meeting Room', 155, 40, Assets.meetingGreyIcon),
          CommonWidgets.smallButton('Air Condition', 145, 40, Assets.acGreyIcon),
          CommonWidgets.smallButton('Food', 85, 40, Assets.foodColorIcon),
          CommonWidgets.smallButton('Projector', 120, 40, Assets.projectorGreyIcon),
          CommonWidgets.smallButton('Toilet', 90, 40, Assets.toiletIcon),
          CommonWidgets.smallButton('White Board', 140, 40, Assets.whiteBoardGreyIcon),
          CommonWidgets.smallButton('Free Parking', 145, 40, Assets.parkingColorIcon),
    ],
    );
  }

}
