// import 'package:flutter/material.dart';

// class SettingsPage extends StatelessWidget {
//   static const String route = '/settings';
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: theme.primaryTextTheme.headline2!.color,
//         title: const Text("translator.settings"),
//       ),
//       body: const Text("Settings"),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/typography.dart';
import '/routes.dart';
import '/core/store.dart';
import '/services/translator/translator.controller.dart';
import '/services/translator/translator.service.dart';
import '/widgets/widgets.dart';
import 'settings.controller.dart';

class SettingsPage extends StatelessWidget {
  static const String route = '/settings';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [SelectedValueTheme]);
    VxState.watch(context, on: [SelectedValueLang]);

    final MyStore store = VxState.store as MyStore;
    final theme = Theme.of(context);
    final themeController = store.themeController;
    final TranslatorController translator = store.translatorController;
    final LocaleService localeService = store.localeService;
    final SettingsController controller = store.settingsController;

    final appBarActions = [
      IconButton(
        onPressed: () {
          store.navigator.routeManager.push(Uri.parse(Routes.home));
        },
        icon: Icon(CupertinoIcons.checkmark, color: theme.primaryColor,),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: appBarActions,
        // backgroundColor: theme.primaryTextTheme.headline2!.color,
        // backgroundColor: theme.backgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(translator.settings, style: TextStyle(color: theme.primaryColor),),
        leading: IconButton(
          onPressed: () {
            store.navigator.routeManager.push(Uri.parse(Routes.home));
          },
          icon: Icon(CupertinoIcons.back, color: theme.primaryColor,),
        ),
        elevation: 0.0,
      ),
      body: FutureBuilder<void>(
        future: controller.read(), //'mclocklite'),
        builder: (
          BuildContext context,
          AsyncSnapshot<void> snapshot,
        ) {
          return Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: <Widget>[
                      Form(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              //Theme
                              DropdownWidget(
                                title: translator.switcherthemes,
                                list: store.settingsController.listItemColorTheme.map((e) {
                                  return DropdownMenuItem(
                                    value: e.i,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Card(
                                            color: e.color,
                                            child: const SizedBox(width: 24, height: 24),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(e.title),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                currentValue: store.settingsController.selectedValueTheme,
                                onChange: (int? value) {
                                  // store.settingsController.selectedValueTheme = value == null ? 0 : value.toInt();
                                  SelectedValueTheme(value == null ? 0 : value.toInt());
                                  debugPrint(value.toString());
                                },
                              ),
                              //Lang
                              DropdownWidget(
                                title: translator.language,
                                list: store.settingsController.listItemLanguage.map((e) {
                                  return DropdownMenuItem(
                                    value: e.i,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(e.short),
                                          const SizedBox(width: 10),
                                          Text(
                                            e.title,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                currentValue: store.settingsController.selectedValueLang,
                                onChange: (int? value) {
                                  // store.settingsController.selectedValueLang = value == null ? 0 : value.toInt();
                                  SelectedValueLang(value == null ? 0 : value.toInt());
                                  debugPrint(value.toString());
                                },
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ReadMoreButton(
                                    onPressed: () async {
                                      if (controller.selectedValueLang == 0) {
                                        translator.reload(TranslatorController());
                                        translator.writeStorage();
                                        localeService.set("EN");
                                      } else {
                                        TranslatorService tr = TranslatorService();
                                        translator.upload(await tr
                                            .change(controller.listItemLanguage[controller.selectedValueLang].short));
                                        translator.writeStorage();
                                        localeService
                                            .set(controller.listItemLanguage[controller.selectedValueLang].short);
                                        // localeService.current = localeService.createLocale(
                                        //     controller.listItemLanguage[controller.selectedValueLang].short.toLowerCase());
                                      }
                                      themeController.change(controller.selectedValueTheme);
                                      themeController.save();

                                      controller.writeStorage();
                                      // Navigator.pushNamed(context, Routes.home);
                                      store.navigator.routeManager.push(Uri.parse(Routes.home));
                                    },
                                    title: translator.confirm,
                                  ),
                                  ReadMoreButton(
                                    onPressed: () {
                                      // Navigator.pushNamed(context, Routes.home);
                                      store.navigator.routeManager.push(Uri.parse(Routes.home));
                                    },
                                    title: translator.cancel,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

typedef VoidCallbackValue = Function(int value);

class DropdownWidget extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<int>> list;
  final int currentValue;
  final VoidCallbackValue onChange;
  const DropdownWidget(
      {Key? key, required this.title, required this.list, required this.currentValue, required this.onChange})
      : super(key: key);

//   @override
//   State<EmptyWidget> createState() => EmptyWidgetState();
// }

// class EmptyWidgetState extends State<EmptyWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title, //translator.beginweek.value,
          style: headlineTextStyle(context),
        ),
      ),
      Container(
        // padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
              dropdownColor: Colors.grey.shade500,
              // dropdownColor: theme.primaryColor,
              borderRadius: BorderRadius.circular(5),
              isExpanded: true,
              items: list,
              // items: controller.listItemBeginWeek.map((e) {
              //   return DropdownMenuItem(
              //     value: e.i,
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 15.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: <Widget>[
              //           Text(e.title),
              //           const SizedBox(width: 10),
              //           Text(
              //             e.comment,
              //           ),
              //         ],
              //       ),
              //     ),
              //   );
              // }).toList(),

              // hint: Text(translator.language.value),
              hint: Text(
                title,
                style: TextStyle(color: theme.primaryColor),
              ),
              // value: dropdownController.selectedValueBeginWeek, //_value2,
              value: currentValue,
              onChanged: (value) {
                onChange(value!);
              }
              // onChanged: (value) {
              //   currentValue = value == null ? 0 : value.toInt();
              //   print(value);
              //   // setState(() {
              //   //   dropdownController.selectedValueBeginWeek = value == null ? 0 : value.toInt();
              //   //   print(value);
              //   // });
              // },
              ),
        ),
      ),
    ]);
  }
}
