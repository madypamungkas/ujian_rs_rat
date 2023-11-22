import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_rs_rat/common/view_component/sis_color.dart';
import 'package:test_rs_rat/common/view_component/sis_texts.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gap.dart';

class SisButtonRounded extends StatelessWidget {
  const SisButtonRounded({
    Key? key,
    required this.text,
    required this.onTap,
    this.padding,
    this.color,
    this.textColor,
    this.width,
    this.isLoading = false,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final Color? color;
  final String text;
  final Color? textColor;
  final double? width;
  final Function onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function(),
      child: Container(
        width: width ?? double.infinity,
        padding:
        padding ?? EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: color ?? SisColor.mainColor,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: isLoading
              ? const CupertinoActivityIndicator()
              : Text14SpBold(
            text: text,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

class SisButtonRoundedMini extends StatelessWidget {
  const SisButtonRoundedMini({
    Key? key,
    required this.text,
    required this.onTap,
    this.padding,
    this.color,
    this.textColor,
    this.width,
    this.isLoading = false,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Widget text;
  final Color? textColor;
  final double? width;
  final Function onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function(),
      child: Container(
        width: width ?? double.infinity,
        padding:
        padding ?? EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: color ?? SisColor.mainColor,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: isLoading
              ? const CupertinoActivityIndicator()
              : text,
          ),
        ),
    );
  }
}

class SisButtonLeadIconRounded extends StatelessWidget {
  const SisButtonLeadIconRounded(
      {Key? key,
        this.text,
        required this.onTap,
        this.padding,
        this.color,
        this.textColor,
        this.width,
        this.icon,
        this.isLoading = false,
        this.isText = false,
        this.size})
      : super(key: key);

  final EdgeInsetsGeometry? padding;
  final Color? color;
  final String? text;
  final Color? textColor;
  final double? width;
  final Function onTap;
  final IconData? icon;
  final double? size;
  final bool isLoading;
  final bool isText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function(),
      child: Container(
        width: width ?? double.infinity,
        padding:
        padding ?? EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        decoration: BoxDecoration(
            color: color ?? SisColor.mainColor,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: textColor ?? Colors.white,
                size: size ?? 20,
              ),
              isText  ?
              Row(children: [ GapH(10),
                isLoading
                    ? const CupertinoActivityIndicator()
                    : Text14SpBold(
                  text: text ?? "",
                  color: textColor ?? Colors.white,
                ) ],) : Container()

            ],
          ),
        ),
      ),
    );
  }
}
