import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import '../../ui/icons/icons.dart';
import 'start.controller.dart';

final startProvider = SimpleProvider<StartController>(
  (ref) {
    /// YOUR CODE HERE
    return StartController();
  },
);

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final controller = ref.watch(startProvider);
        return FutureBuilder<void>(
          future: controller.init(context),
          builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
          ) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/icon.png', width: 120, height: 120), //assets/splash.png'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListenableBuilder(
                          listenable: controller.isNet,
                          builder: (_, __) => Icon(CupertinoIcons.bolt_circle,
                              size: 80, color: controller.isNet.value ? Colors.greenAccent : Colors.redAccent),
                        ),
                        ListenableBuilder(
                          listenable: controller.isBackend,
                          builder: (_, __) => AIcon.cloudInCircle(
                              size: 80, color: controller.isBackend.value ? Colors.greenAccent : Colors.redAccent),
                        ),
                        ListenableBuilder(
                          listenable: controller.isGraph,
                          builder: (_, __) => Icon(CupertinoIcons.graph_circle,
                              size: 80, color: controller.isGraph.value ? Colors.greenAccent : Colors.redAccent),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
