// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import './icon_widget.dart';

class AIcon extends StatelessWidget {
  factory AIcon.cloudInCircle({Color color = const Color(0xFFA0A0A0), double size = 80}) => AIcon._(
        IconBuilder(
          color: color,
          size: size,
          builder: (context, color, size) => SizedBox(
            height: size,
            width: size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(CupertinoIcons.circle, color: color, size: size),
                Icon(CupertinoIcons.cloud, color: color, size: size / 1.6),
                Icon(CupertinoIcons.cloud, color: color, size: size / 1.8),
              ],
            ),
          ),
        ),
      );
  const AIcon._(this._icon);
  final Widget _icon;

  @override
  Widget build(BuildContext context) => _icon;
}
