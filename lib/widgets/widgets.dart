import 'package:flutter/material.dart';

class ReadMoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const ReadMoreButton({Key? key, required this.onPressed, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor), //textPrimary),
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return BorderSide(
                color: Theme.of(context).primaryColor, //textPrimary,
                width: 2);
          }

          return BorderSide(
              color: Theme.of(context).primaryColor, //textPrimary,
              width: 2);
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return Theme.of(context).backgroundColor; //Colors.white;
          }

          // return textPrimary;
          return Theme.of(context).primaryColor;
        }),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            // return GoogleFonts.montserrat(
            //   textStyle: TextStyle(
            //       fontSize: 14,
            //       color: Theme.of(context).backgroundColor, //Colors.white,
            //       letterSpacing: 1),
            // );
            return TextStyle(
                fontSize: 14,
                color: Theme.of(context).backgroundColor, //Colors.white,
                letterSpacing: 1);
          }

          // return GoogleFonts.montserrat(
          //   textStyle: TextStyle(
          //       fontSize: 14,
          //       color: Theme.of(context).primaryColor, //textPrimary,
          //       letterSpacing: 1),
          // );
          return TextStyle(
              fontSize: 14,
              color: Theme.of(context).primaryColor, //textPrimary,
              letterSpacing: 1);
        }),
        padding:
            MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 12, vertical: 16)),
      ),
      child: Text(
        title,
        // style: TextStyle(color: Theme.of(context).primaryColor),
        //"READ MORE",
      ),
    );
  }
}

class ReadIconMoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final String title;

  const ReadIconMoreButton({Key? key, required this.onPressed, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor), //textPrimary),
          side: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              return BorderSide(
                  color: Theme.of(context).primaryColor, //textPrimary,
                  width: 2);
            }

            return BorderSide(
                color: Theme.of(context).primaryColor, //textPrimary,
                width: 2);
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              return Theme.of(context).backgroundColor; //Colors.white;
            }

            // return textPrimary;
            return Theme.of(context).primaryColor;
          }),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              // return GoogleFonts.montserrat(
              //   textStyle: TextStyle(
              //       fontSize: 14,
              //       color: Theme.of(context).backgroundColor, //Colors.white,
              //       letterSpacing: 1),
              // );
              return TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).backgroundColor, //Colors.white,
                  letterSpacing: 1);
            }

            // return GoogleFonts.montserrat(
            //   textStyle: TextStyle(
            //       fontSize: 14,
            //       color: Theme.of(context).primaryColor, //textPrimary,
            //       letterSpacing: 1),
            // );
            return TextStyle(
                fontSize: 14,
                color: Theme.of(context).primaryColor, //textPrimary,
                letterSpacing: 1);
          }),
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 12, vertical: 16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(title, overflow: TextOverflow.ellipsis, softWrap: true),
            ),
          ],
        ));
  }
}

const Widget divider = Divider(color: Color(0xFFEEEEEE), thickness: 1);
Widget dividerSmall = Container(
  width: 40,
  decoration: const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Color(0xFFA0A0A0),
        width: 1,
      ),
    ),
  ),
);

class DividerSize extends StatelessWidget {
  final double space;
  const DividerSize({
    Key? key,
    required this.space,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
      SizedBox(
        height: space / 2,
      ),
      divider,
      SizedBox(
        height: space / 2,
      ),
    ]);
  }
}
