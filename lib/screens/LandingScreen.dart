import 'package:design/custom/BorderBox.dart';
import 'package:design/custom/OptionButton.dart';
import 'package:design/utils/constants.dart';
import 'package:design/utils/sample_data.dart';
import 'package:design/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../utils/custom_function.dart';
import 'DetailsScreen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    final ThemeData themeData = Theme.of(context);
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BorderBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.menu,
                        color: COLOR_BLACK,
                      ),
                    ),
                    BorderBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.settings,
                        color: COLOR_BLACK,
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Text(
                  'City',
                  style: themeData.textTheme.bodyText2,
                ),
              ),
              Padding(
                padding: sidePadding,
                child: Text(
                  'San Francisco',
                  style: themeData.textTheme.headline1,
                ),
              ),
              Padding(
                padding: sidePadding,
                child: Divider(
                  height: padding,
                  color: COLOR_GREY,
                ),
              ),
              addVerticalSpace(10),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,

                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    "<\$220,00>",
                    "For Sale",
                    "3-4 Beds",
                    ">1200 sqft",
                  ].map((filters) => ChoiceOption(text: filters)).toList(),
                ),
              ),
              addVerticalSpace(10),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),

                    itemCount: RE_DATA.length,
                    itemBuilder: (context, index) {
                      return
                        GestureDetector(
                          child: RealEstateItem(itemData: RE_DATA[index]),
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(index: index,))),
                        );
                    },),
              ),
            ]),
            Positioned(
                bottom: 20,
                width: size.width,
                child: Center(
                  child: OptionButton(
                    icon: Icons.map_rounded,
                    text: 'Map View',
                    width: size.width * 0.35,
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: COLOR_GREY),
      child: Text(text, style: themeData.textTheme.headline5),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(itemData['image'])),
            Positioned(
                top: 15,
                right: 15,
                child: BorderBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.favorite, color: COLOR_BLACK),
                )),
          ],
        ),
        addVerticalSpace(15),
        Row(
          children: [
            Text(
              "${formatCurrency(itemData["amount"])}",
              style: themeData.textTheme.headline1,
            ),
            addHorizontalSpace(10),
            Text(
              "${itemData["address"]}",
              style: themeData.textTheme.bodyText2,
            )
          ],
        ),
        addVerticalSpace(10),
        Text(
          "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["are"]} saft",
          style: themeData.textTheme.headline5,
        )
      ]),
    );
  }
}