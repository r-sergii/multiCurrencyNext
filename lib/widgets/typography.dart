import 'package:flutter/material.dart';

// final theme =  Theme.of(context);

TextStyle baseTextStyle(BuildContext context) => const TextStyle(fontFamily: 'Segoe' //'Poppins'
    );
TextStyle regularTextStyle(BuildContext context) => baseTextStyle(context).copyWith(
    color: Theme.of(context).primaryTextTheme.subtitle2!.color, //const Color(0xffb6b2df),
    fontSize: 9.0,
    fontWeight: FontWeight.w400);
TextStyle subHeaderTextStyle(BuildContext context) => regularTextStyle(context).copyWith(fontSize: 12.0);
TextStyle headerTextStyle(BuildContext context) => baseTextStyle(context).copyWith(
    color: Theme.of(context).primaryTextTheme.subtitle2!.color, //Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600);
TextStyle headerTextStyleInvert(BuildContext context) => baseTextStyle(context).copyWith(
    color: Theme.of(context).backgroundColor, //Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600);

TextStyle headlineTextStyle(BuildContext context) =>
    TextStyle(fontSize: 26, color: Theme.of(context).primaryColor, letterSpacing: 1.5, fontWeight: FontWeight.w300);
