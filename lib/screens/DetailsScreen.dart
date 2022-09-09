import 'package:flutter/material.dart';

import '../custom/BorderBox.dart';
import '../custom/OptionButton.dart';
import '../utils/constants.dart';
import '../utils/custom_function.dart';
import '../utils/sample_data.dart';
import '../utils/widget_functions.dart';

class DetailsScreen extends StatelessWidget {

  final int index;

  DetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    final ThemeData themeData = Theme.of(context);
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final data = RE_DATA[index];

    final List details = [
      {
        "number":1416,
        "text":"Square Foot",
      },
      {
        "number":4,
        "text":"Bedrooms",
      },
      {
        "number":2,
        "text":"Bathrooms",
      },
      {
        "number":1,
        "text":"Carage",
      },
      {
        "number":1,
        "text":"Yard",
      },
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          child: Stack(children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data['image'].toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: BorderBox(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.arrow_back,
                                color: COLOR_BLACK,
                              ),
                            ),
                            onTap: (){
                              Navigator.pop(context);
                            },
                          ),
                          BorderBox(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.favorite_border,
                              color: COLOR_BLACK,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$${data['amount']}',
                          style: themeData.textTheme.headline1,
                        ),
                        Text(
                          '\$${data['address']}',
                          style: themeData.textTheme.bodyText2,
                        ),
                      ],
                    ),
                    BorderBox(
                      width: 120,
                      height: 40,
                      child: Text('20 Hours ago', style: themeData.textTheme.headline5),
                    ),

                  ],
                ),
              ),
              addVerticalSpace(30),
              Padding(
                padding: sidePadding,
                child: Text('House Information',
                  style: themeData.textTheme.headline4,
                ),
              ),
              addVerticalSpace(30),
              Padding(
                padding: sidePadding,
                child: Container(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: details.length,
                    itemBuilder: (context, index) {
                      return
                        Row(
                          children: [
                            ListItem(text: details[index]['text'], number: details[index]['number'],),
                            addHorizontalSpace(25)
                          ],
                        );
                    },),
                ),
              ),
              addVerticalSpace(10),
              Padding(
                padding: sidePadding,
                child: Text(data['description'].toString()),
              )
            ]),

            Positioned(
                bottom: 20,
                width: size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionButton(
                      icon: Icons.message,
                      text: 'Message',
                      width: size.width * 0.35,
                    ),
                    addHorizontalSpace(10),
                    OptionButton(
                      icon: Icons.call,
                      text: 'Call',
                      width: size.width * 0.35,
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final dynamic text;
  final dynamic number;

  const ListItem({Key? key, required this.text, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      child: Column(
        children: [
          Positioned(
              top: 15,
              right: 15,
              child: BorderBox(
                width: 80,
                height: 80,
                child: Text(number.toString(), style: themeData.textTheme.headline2),
              )),
          addVerticalSpace(15),
          Text(text,
          style: themeData.textTheme.titleLarge)
        ],
      ),//
    );
  }
}
