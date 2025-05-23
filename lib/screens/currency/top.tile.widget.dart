import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:flutter_meedu/meedu.dart';

class TopTileController extends SimpleNotifier {
  bool _isHovering = false;
  bool get isHovering {
    return _isHovering;
  }

  set isHovering(bool val) {
    _isHovering = val;
    notify();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class TopTileWidget extends StatelessWidget {
  final IconData leading;
  final String title;
  final VoidCallback onTap;
  // final TopTileController controller;
  const TopTileWidget(
      // {Key? key, required this.title, required this.leading, required this.onTap, required this.controller})
      {Key? key,
      required this.title,
      required this.leading,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topTileProvider = SimpleProvider<TopTileController>(
      (ref) {
        /// YOUR CODE HERE
        return TopTileController();
      },
    );

    return Consumer(builder: (_, ref, __) {
      final controller = ref.watch(topTileProvider);
// final controller = provider
      return InkWell(
        onHover: (value) {
          // setState(() {
          value ? controller.isHovering = true : controller.isHovering = false;
          // });
        },
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(leading, color: controller.isHovering ? Colors.blue[200] : theme.primaryColor),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: controller.isHovering ? Colors.blue[200] : theme.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: controller.isHovering,
              child: Container(
                height: 2,
                width: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    });
  }
}
