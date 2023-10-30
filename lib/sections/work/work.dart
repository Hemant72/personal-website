import 'package:flutter/material.dart';
import 'package:my_personal_website/data/keys.dart';
import 'package:my_personal_website/data/text.dart';

import '../../commons/commons.dart';

class Work extends StatelessWidget {
  const Work({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
        bottom: 64.0,
        right: ResponsiveWidget.isAtLeastLargeScreen(context) ? 136.0 : 0.0,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SlideAnimation(
            animationKey: Keys.workSection,
            delay: Duration(milliseconds: 50),
            child: SectionTitle(
              number: SectionTitleData.sectionNumber2,
              title: SectionTitleData.section2Title,
            ),
          ),
          // FadeAnimation(
          //   animationKey: Keys.kcfTechnologies,
          //   delay: const Duration(milliseconds: 100),
          //   child:
          //       KcfTechnologies(pointGroup: pointGroup, titleGroup: titleGroup),
          // ),
          // const SizedBox(height: 32.0),
          // FadeAnimation(
          //   animationKey: Keys.volvo,
          //   delay: const Duration(milliseconds: 100),
          //   child: Volvo(pointGroup: pointGroup, titleGroup: titleGroup),
          // ),
          // const SizedBox(height: 32.0),
          // FadeAnimation(
          //   animationKey: Keys.mule,
          //   delay: const Duration(milliseconds: 100),
          //   child: Mule(pointGroup: pointGroup, titleGroup: titleGroup),
          // ),
        ],
      ),
    );
  }
}
