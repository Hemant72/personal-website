import 'package:flutter/material.dart';
import 'package:my_personal_website/theme/theme.dart';

class MenuButton extends StatelessWidget {
  final String buttonNumber;
  final String buttonTitle;
  final GlobalKey<State<StatefulWidget>> dataKey;
  const MenuButton({
    super.key,
    required this.buttonNumber,
    required this.buttonTitle,
    required this.dataKey,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Scrollable.ensureVisible(
          dataKey.currentContext ?? context,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 1500),
        );
      },
      child: Row(
        children: <Widget>[
          Text(buttonNumber, style: TextStyles.navBarButtonNumber),
          const SizedBox(width: 8.0),
          Text(buttonTitle, style: TextStyles.navBarButtonText),
        ],
      ),
    );
  }
}
