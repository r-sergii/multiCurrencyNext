import 'package:flutter/widgets.dart';

abstract class IconWidget extends StatelessWidget {

  final Color? color;
  final double? size;

  const IconWidget({super.key, this.color, this.size});
  // const factory IconWidget.icon({Key? key, required IconData icon, Color? color, double? size}) = IconDataWidget;
  
  @override
  Widget build(BuildContext context) {
    if (color!=null && size!=null) {
      return buildIcon(context, color!, size!);
    }
    final theme = IconTheme.of(context);
    return buildIcon(context, color ?? theme.color!, size ?? theme.size!);
  }

  Widget buildIcon(BuildContext context, Color color, double size);
}

///
///
///
class IconBuilder extends IconWidget {
  final IconWidgetBuilder builder;
  
  const IconBuilder({super.key, required this.builder, super.color, super.size});

  @override
  Widget buildIcon(BuildContext context, Color color, double size) => builder(context, color, size);
}

typedef IconWidgetBuilder = Widget Function(BuildContext context, Color color, double size);

///
///
///
class IconDataWidget extends IconWidget {
  final IconData icon;
  
  const IconDataWidget({super.key, required this.icon, super.color, super.size});

  @override
  Widget buildIcon(BuildContext context, Color color, double size) {
    return Icon(icon, size: size, color: color);
  }
}

///
///
///
class ImageIconWidget extends IconWidget {
  final String asset;
  final BoxFit? fit;
  
  const ImageIconWidget({super.key, required this.asset, this.fit, super.color, super.size});

  @override
  Widget buildIcon(BuildContext context, Color color, double size) {
    return Image.asset(asset, color: color, width: size, height: size, fit: fit);
  }
}

