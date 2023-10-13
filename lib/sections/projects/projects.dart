import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_website/data/keys.dart';
import 'package:my_personal_website/data/text.dart';
import 'package:my_personal_website/theme/theme.dart';

import '../../commons/commons.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  /// Show More / Show Less Button Logic
  ///
  /// Start with showing [condensedView] elements.
  /// If 'Show More' is clicked, show all elements
  /// and change button to 'Show Less'.
  /// If 'Show Less' is clicked, reduce and show [condensedView] elements

  int condensedView = 6;
  int currentlyShown = 6;

  List projects = [];
  final List _tempProjects = [];

  final options = const LiveOptions(
    delay: Duration(milliseconds: 200),
    showItemInterval: Duration(milliseconds: 100),
    showItemDuration: Duration(milliseconds: 300),
  );

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    bool isMediumScreen = ResponsiveWidget.isMediumScreen(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SlideAnimation(
            animationKey: Keys.projectsSection,
            delay: Duration(milliseconds: 50),
            child: SectionTitle(
              number: SectionTitleData.sectionNumber3,
              title: SectionTitleData.section3Title,
            ),
          ),
          LiveGrid.options(
            options: options,
            primary: true,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _tempProjects.length,
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
              return FadeTransition(
                opacity: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeOut)),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -0.2),
                    end: Offset.zero,
                  ).animate(animation),
                  child: Project(
                    title: projects[index]['title'],
                    description: projects[index]['description'],
                    url: projects[index]['url'],
                    tags: projects[index]['tags'],
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isSmallScreen
                  ? 1
                  : isMediumScreen
                      ? 2
                      : 3,
              childAspectRatio: 1.35,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Center(
              child: FadeAnimation(
                animationKey: Keys.projectsButton,
                delay: const Duration(milliseconds: 50),
                child: OutlinedButton(
                  style: ButtonStyles.primary,
                  child: Text(
                    currentlyShown == projects.length
                        ? ButtonData.showLess
                        : ButtonData.showMore,
                    style: TextStyles.buttonText,
                  ),
                  onPressed: () => setState(() {
                    if (currentlyShown == projects.length) {
                      _tempProjects.removeRange(
                          condensedView, projects.length);
                      currentlyShown = condensedView;
                    } else {
                      _tempProjects.addAll(
                          projects.getRange(condensedView, projects.length));
                      currentlyShown = projects.length;
                    }
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
 
  }
}
