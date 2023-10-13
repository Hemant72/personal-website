import 'package:flutter/material.dart';
import 'package:my_personal_website/commons/fade_animation.dart';
import 'package:my_personal_website/commons/responsive_widget.dart';
import 'package:my_personal_website/data/keys.dart';
import 'package:my_personal_website/sections/about/about_me.dart';
import 'package:my_personal_website/sections/about/my_picture.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 128.0, bottom: 64.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const AboutMe(),
              SizedBox(
                  width: ResponsiveWidget.isAtLeastLargeScreen(context)
                      ? 80.0
                      : 0.0),
              if (ResponsiveWidget.isAtLeastLargeScreen(context))
               const FadeAnimation(
                  animationKey: Keys.myPicture,
                  delay: Duration(milliseconds: 1000),
                  child: MyPicture(),
                ),
            ],
          ),
          if (!ResponsiveWidget.isAtLeastLargeScreen(context))
            const FadeAnimation(
              animationKey: Keys.myPicture,
              delay: Duration(milliseconds: 1000),
              child: MyPicture(),
            ),
        ],
      ),
    );
  }
}
