import 'dart:math';
import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class InputField extends StatefulWidget {
  final String? label;
  final bool? showLabelInNewLine;
  final String? hintText;
  final String? defaultText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final ThemeIcon? icon;
  final int? maxLines;
  final bool? showDivider;
  final Color? iconColor;
  final bool? isDisabled;
  final bool? startedEditing;
  final bool? isError;
  final bool? iconOnRightSide;
  final Color? backgroundColor;
  final bool? showBorder;
  final Color? borderColor;
  final double? cornerRadius;

  final Color? cursorColor;
  final TextStyle? textStyle;

  const InputField({
    Key? key,
    this.label,
    this.showLabelInNewLine = true,
    this.hintText,
    this.defaultText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.icon,
    this.maxLines,
    this.showDivider = false,
    this.iconColor,
    this.isDisabled,
    this.startedEditing = false,
    this.isError = false,
    this.iconOnRightSide = false,
    this.backgroundColor,
    this.showBorder = false,
    this.borderColor,
    this.cornerRadius = 0,
    this.cursorColor,
    this.textStyle,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late String? label;
  late bool? showLabelInNewLine;

  late String? hintText;
  late String? defaultText;
  late TextEditingController? controller;
  late ValueChanged<String>? onChanged;
  late ValueChanged<String>? onSubmitted;
  late ThemeIcon? icon;
  late int? maxLines;
  late bool? showDivider;
  late Color? iconColor;
  late bool isDisabled;
  late bool? startedEditing;
  late bool? isError;
  late bool? iconOnRightSide;
  late Color? backgroundColor;
  late bool? showBorder;
  late Color? borderColor;
  late double? cornerRadius;

  late Color cursorColor;
  late TextStyle textStyle;

  @override
  void initState() {
    // TODO: implement initState
    label = widget.label;
    showLabelInNewLine = widget.showLabelInNewLine;
    hintText = widget.hintText;
    defaultText = widget.defaultText;
    controller = widget.controller;
    onChanged = widget.onChanged;
    onSubmitted = widget.onSubmitted;
    icon = widget.icon;
    maxLines = widget.maxLines;
    showDivider = widget.showDivider;
    iconColor = widget.iconColor;
    isDisabled = widget.isDisabled ?? false;
    startedEditing = widget.startedEditing;
    isError = widget.isError;
    iconOnRightSide = widget.iconOnRightSide;
    backgroundColor = widget.backgroundColor;
    showBorder = widget.showBorder;
    borderColor = widget.borderColor;
    cornerRadius = widget.cornerRadius;

    // cursorColor = widget.cursorColor ?? Theme.of(context).primaryColorDark;
    // textStyle = widget.textStyle ?? Theme.of(context).textTheme.bodySmall!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      // margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      decoration: BoxDecoration(
        color: isError == false
            ? backgroundColor
            : (showDivider == false && showBorder == false)
                ? Theme.of(context).errorColor
                : backgroundColor,
        borderRadius: BorderRadius.circular(cornerRadius ?? 0),
        border: showBorder == true
            ? Border.all(
                width: 1,
                color: isError == true
                    ? Theme.of(context).errorColor
                    : borderColor ?? Colors.black87)
            : null,
      ),
      // margin: EdgeInsets.symmetric(vertical: 5),
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: maxLines != null
          ? (min(maxLines!, 10) * 20) + 45
          : label != null
              ? 70
              : 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (label != null && showLabelInNewLine == true)
              ? Text(label!, style: Theme.of(context).textTheme.subtitle1).bP4
              : Container(),
          Row(
            children: [
              (label != null && showLabelInNewLine == false)
                  ? Text(label!, style: Theme.of(context).textTheme.subtitle1)
                      .bP4
                  : Container(),
              iconOnRightSide == false ? iconView() : Container(),
              Expanded(
                child: Focus(
                  child: TextField(
                    controller: controller,
                    keyboardType: hintText == hintText
                        ? TextInputType.emailAddress
                        : TextInputType.text,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleSmall,
                    onChanged: widget.onChanged,
                    maxLines: maxLines,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none,
                        counterText: "",
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        hintStyle: Theme.of(context).textTheme.titleSmall,
                        hintText: hintText),
                  ),
                  onFocusChange: (hasFocus) {
                    startedEditing = hasFocus;
                    setState(() {});
                  },
                ),
              ),
              iconOnRightSide == true ? iconView() : Container(),
            ],
          ),
          line()
        ],
      ),
    );
  }

  Widget line() {
    return showDivider == true
        ? Container(
            height: 0.5,
            color: startedEditing == true
                ? Theme.of(context).primaryColor
                : isError == true
                    ? Theme.of(context).errorColor
                    : Theme.of(context).dividerColor)
        : Container();
  }

  Widget iconView() {
    return icon != null
        ? ThemeIconWidget(icon!,
                color: iconColor ?? Theme.of(context).primaryColor, size: 20)
            .hP16
        : Container();
  }
}
