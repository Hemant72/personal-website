import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_personal_website/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableIcon extends StatefulWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final String url;
  const ClickableIcon({
    super.key,
    required this.icon,
    required this.iconSize,
    this.iconColor = AppColors.lightGrey1,
    required this.url,
  });

  @override
  State<ClickableIcon> createState() => _ClickableIconState();
}

class _ClickableIconState extends State<ClickableIcon> {
  @override
  Widget build(BuildContext context) {
    bool hovered = false;

    void incrementEnter(PointerEvent details) {
      setState(() {
        hovered = true;
      });
    }

    void incrementExit(PointerEvent details) {
      setState(() {
        hovered = false;
      });
    }

    return MouseRegion(
      onEnter: incrementEnter,
      onExit: incrementExit,
      child: IconButton(
        padding: const EdgeInsets.all(0.0),
        constraints: const BoxConstraints(),
        icon: FaIcon(widget.icon),
        iconSize: widget.iconSize,
        color: hovered ? AppColors.blueAccent : widget.iconColor,
        onPressed: () => launchUrl(Uri.parse(widget.url)),
      ),
    );
  }
}
