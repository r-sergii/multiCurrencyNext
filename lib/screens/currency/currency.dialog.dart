import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/store.dart';
import '/app.dart';
// import '/cross/multiplatform/multiplatform.dart';
// import '/cross/multiplatform/platform.dart';
import '/services/translator/translator.controller.dart';
import '/widgets/link_text_span.dart';

class CurrencyAboutDialog extends StatelessWidget {
  const CurrencyAboutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MyStore store = VxState.store as MyStore;
    final TranslatorController translator = store.translatorController;
    final theme = Theme.of(context);
    final TextStyle aboutTextStyle = theme.textTheme.bodyLarge!;
    // final TextStyle footerStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.primary);

    // Platform platform = getPlatform();

    return AboutDialog(
      applicationName: App.appName,
      applicationIcon: Image.asset('images/icon.png', height: 96, width: 96),
      applicationVersion: "${translator.version} ${App.nomerVersion}",
      applicationLegalese: "${App.copyright} \n ${App.author}",
      children: [
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(Icons.info_outline, color: Theme.of(context).colorScheme.primary),
              ),
              TextSpan(style: aboutTextStyle, text: '\t\t'),
              LinkTextSpan(
                style: linkStyle,
                uri: App.multiAppsUri,
                text: 'multiApps.inf.ua',
              ),
              TextSpan(style: aboutTextStyle, text: '\n'),
              WidgetSpan(
                child: Icon(Icons.email_outlined, color: Theme.of(context).colorScheme.primary),
              ),
              TextSpan(style: aboutTextStyle, text: '\t\t'),
              LinkTextSpan(
                style: linkStyle,
                uri: App.supportUri,
                text: 'multiApps@i.ua',
              ),
              TextSpan(style: aboutTextStyle, text: '\n'),
              // WidgetSpan(
              //   child: Icon(Icons.star_border, color: Theme.of(context).colorScheme.primary),
              // ),
              // TextSpan(style: aboutTextStyle, text: '\t\t'),
              // if (platform == Platform.web)
              //   LinkTextSpan(
              //     style: linkStyle,
              //     uri: App.storeWebUri,
              //     text: App.storeWebName,
              //   ),
              // if (platform == Platform.android)
              //   LinkTextSpan(
              //     style: linkStyle,
              //     uri: App.storeAndroidUri,
              //     text: App.storeAndroidName,
              //   ),
              // if (platform == Platform.linux)
              //   LinkTextSpan(
              //     style: linkStyle,
              //     uri: App.storeLinuxUri,
              //     text: App.storeLinuxName,
              //   ),
              // if (platform == Platform.windows)
              //   LinkTextSpan(
              //     style: linkStyle,
              //     uri: App.storeWindowsUri,
              //     text: App.storeWindowsName,
              //   ),
              // TextSpan(style: aboutTextStyle, text: '\n'),
              // WidgetSpan(
              //   child: Icon(Icons.local_police, color: Theme.of(context).colorScheme.primary),
              // ),
              // TextSpan(style: aboutTextStyle, text: '\t\t'),
              // LinkTextSpan(
              //   style: linkStyle,
              //   uri: App.privacyPolicyUri,
              //   text: translator.privacyPolicy,
              // ),
              // TextSpan(style: aboutTextStyle, text: '\n'),
              // // CupertinoIcons.rosette
              // WidgetSpan(
              //   child: Icon(Icons.workspace_premium_outlined, color: Theme.of(context).colorScheme.primary),
              // ),
              // TextSpan(style: aboutTextStyle, text: '\t\t'),
              // ButtonTextSpan(
              //   style: linkStyle,
              //   uri: App.privacyPolicyUri,
              //   text: translator.license,
              //   callback: () {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return LicenseDialogShowcase(
              //           app: App.appName,
              //           appStyle: aboutTextStyle,
              //           version: App.version,
              //           style: linkStyle,
              //           confirm: translator.confirm,
              //         );
              //       },
              //     );
              //   },
              // ),
              // TextSpan(style: aboutTextStyle, text: '\n'),
            ],
          ),
        ),
      ],
    );
  }
}
