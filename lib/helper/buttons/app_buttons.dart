import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class FilledButtonType1 extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  final double? cornerRadius;
  final bool? isEnabled;

  final Widget? leading;
  final Widget? trailing;
  final Color? enabledBackgroundColor;
  final Color? disabledBackgroundColor;

  final TextStyle? enabledTextStyle;
  final TextStyle? disabledTextStyle;

  final VoidCallback? onPress;

  const FilledButtonType1({
    Key? key,
    required this.text,
    required this.onPress,
    this.height,
    this.width,
    this.cornerRadius,
    this.leading,
    this.trailing,
    this.enabledBackgroundColor,
    this.disabledBackgroundColor,
    this.enabledTextStyle,
    this.disabledTextStyle,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 50,
      color: isEnabled == true
          ? enabledBackgroundColor ?? Theme.of(context).primaryColor
          : disabledBackgroundColor ??
              Theme.of(context).backgroundColor.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading != null ? leading!.hP8 : Container(),
          Center(
            child: Text(
              text!,
              style: isEnabled == true
                  ? enabledTextStyle ?? Theme.of(context).textTheme.bodyLarge
                  : disabledTextStyle ?? Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          trailing != null ? trailing!.hP4 : Container()
        ],
      ),
    ).round(cornerRadius ?? 5).ripple(() {
      isEnabled == true ? onPress!() : null;
    });
  }
}

class BorderButtonType1 extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? height;
  final double? cornerRadius;
  final TextStyle? textStyle;

  const BorderButtonType1(
      {Key? key,
      required this.text,
      required this.onPress,
      this.height,
      this.cornerRadius,
      this.borderColor,
      this.backgroundColor,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: double.infinity,
          height: height ?? 50,
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 5.0,
                spreadRadius: 2,
                offset: Offset(
                  1,
                  12,
                ),
              )
            ],
          ),
          child: Center(
            child: Text(
              text!,
              style: textStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w600),
            ).hP16,
          ),
        )
            .borderWithRadius(
                context: context,
                value: 1,
                radius: cornerRadius ?? 5,
                color: borderColor ?? Theme.of(context).dividerColor)
            .ripple(onPress!),
      ),
    );
  }
}

class ThemeIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPress;
  final Color? borderColor;
  final Color? iconColor;
  final double? height;
  final double? cornerRadius;
  final TextStyle? textStyle;

  const ThemeIconButton(
      {Key? key,
      required this.icon,
      required this.onPress,
      this.height,
      this.cornerRadius,
      this.borderColor,
      this.iconColor,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      // height: height ?? 50,
      child: Center(
          child: IconButton(
              onPressed: onPress,
              icon: Icon(
                icon,
                color: iconColor,
              ))),
    ).ripple(onPress!);
  }
}
