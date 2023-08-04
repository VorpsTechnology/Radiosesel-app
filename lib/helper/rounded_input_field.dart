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
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isError == false
            ? backgroundColor
            : (showDivider == false && showBorder == false)
            ? Theme.of(context).errorColor
            : backgroundColor,
        borderRadius: BorderRadius.circular(cornerRadius ?? 0),
        border: showBorder == true
            ? Border.all(
            width: 0.5,
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
                        // contentPadding:
                        // const EdgeInsets.only(left: 10, right: 10),
                        counterText: "",
                        // labelText: hintText,
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

class DropDownField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final bool? disable;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  const DropDownField({
    Key? key,
    this.label,
    this.hintText,
    this.disable,
    this.controller,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  _DropDownFieldState createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Text(widget.label!,
              style: Theme.of(context).textTheme.subtitle1)
              .bP8
              : Container(),
          Row(
            children: [
              Expanded(
                  child: TextField(
                    style: Theme.of(context).textTheme.bodySmall,
                    controller: widget.controller,
                    onChanged: widget.onChanged,
                    keyboardType: TextInputType.number,
                    cursorColor: Theme.of(context).primaryColorDark,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      hintText: widget.hintText,
                      border: InputBorder.none,
                    ),
                  )),
              ThemeIconWidget(ThemeIcon.downArrow,
                  color: Theme.of(context).errorColor)
            ],
          ).ripple(() {
            if (widget.disable != true) {
              widget.onTap!();
            }
          }),
        ],
      ),
    );
  }
}

class InputMobileNumberField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final String? phoneCodeText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? phoneCodeValueChanged;
  final bool? showDivider;
  final Color? cursorColor;
  final TextStyle? textStyle;
  final bool? isError;
  final bool? showBorder;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? cornerRadius;

  const InputMobileNumberField({
    Key? key,
    this.label,
    this.hintText,
    this.showDivider,
    required this.phoneCodeText,
    this.controller,
    required this.onChanged,
    required this.phoneCodeValueChanged,
    this.cursorColor,
    this.textStyle,
    this.isError,
    this.showBorder,
    this.borderColor,
    this.cornerRadius,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _InputMobileNumberFieldState createState() => _InputMobileNumberFieldState();
}

class _InputMobileNumberFieldState extends State<InputMobileNumberField> {
  bool? startedEditing;
  late bool? isError;
  late String? phoneCodeText;
  late TextEditingController controller;
  late String? hintText;
  late bool? showBorder;
  late Color? backgroundColor;
  late bool? showDivider;
  late Color? borderColor;
  late double? cornerRadius;

  @override
  void initState() {
    // TODO: implement initState

    isError = widget.isError;
    controller = widget.controller!;
    hintText = widget.hintText;
    showBorder = widget.showBorder;
    backgroundColor = widget.backgroundColor;
    showDivider = widget.showDivider;
    borderColor = widget.borderColor;
    cornerRadius = widget.cornerRadius;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color:Colors.red,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isError == false
            ? backgroundColor
            : (showDivider == false && showBorder == false)
            ? Theme.of(context).errorColor
            : backgroundColor,
        borderRadius: BorderRadius.circular(
            cornerRadius != null ? cornerRadius! : 0),
        border: showBorder == true
            ? Border.all(
            width: 0.5,
            color: isError == true
                ? Theme.of(context).errorColor
                : borderColor ?? Theme.of(context).primaryColorLight)
            : null,
      ),
      height: widget.label != null ? 72 : 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.label != null
              ? Text(widget.label!,
              style: Theme.of(context).textTheme.subtitle1)
              : Container(),
          Row(children: [
            Text(
              '${widget.phoneCodeText}',
              style: widget.textStyle,
            ).hP8.ripple(() {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                // optional. Shows phone code before the country name.
                onSelect: (Country country) {
                  setState(() {
                    phoneCodeText = '+${country.phoneCode}';
                    widget.phoneCodeValueChanged!(phoneCodeText!);
                  });
                },
              );
            }),
            Container(
              width: 0.5,
              height: 20,
              color: Theme.of(context).dividerColor,
            ).hP8,
            Expanded(
              child: SizedBox(
                  height: 46,
                  child: Focus(
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.left,
                      style: widget.textStyle,
                      onChanged: widget.onChanged,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                          const EdgeInsets.only(left: 10, right: 10),
                          counterText: "",
                          // labelText: hintText,
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          hintStyle: Theme.of(context).textTheme.titleSmall,
                          hintText: hintText),
                    ),
                    onFocusChange: (hasFocus) {
                      startedEditing = hasFocus;
                      setState(() {});
                    },
                  )),
            )
          ]),
          line()
        ],
      ),
    );
  }

  Widget line() {
    return widget.showDivider == true
        ? Container(
        height: 0.5,
        color: startedEditing == true
            ? Theme.of(context).primaryColor
            : isError == true
            ? Theme.of(context).errorColor
            : Theme.of(context).dividerColor)
        : Container();
  }
}

class InputDateField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final String? defaultText;
  final ValueChanged<TimeOfDay>? onChanged;

  const InputDateField({
    Key? key,
    this.label,
    this.hintText,
    this.defaultText,
    this.onChanged,
  }) : super(key: key);

  @override
  _InputDateFieldState createState() => _InputDateFieldState();
}

class _InputDateFieldState extends State<InputDateField> {
  String? label;
  String? hintText;
  String? defaultText;
  TextEditingController controller = TextEditingController();
  ValueChanged<TimeOfDay>? onChanged;

  @override
  void initState() {
    // TODO: implement initState
    hintText = widget.label;
    hintText = widget.hintText;
    defaultText = widget.defaultText;
    onChanged = widget.onChanged;

    controller.text = defaultText ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Text(widget.label!,
              style: Theme.of(context).textTheme.subtitle1)
              .bP8
              : Container(),
          Container(
            width: 80,
            height: 50,
            color: Theme.of(context).backgroundColor,
            child: TextField(
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              controller: controller,
              // onChanged: onChanged,
              cursorColor: Theme.of(context).primaryColorDark,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                border: InputBorder.none,
              ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay initialTime = TimeOfDay.now();
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: initialTime,
                );

                if (pickedTime != null) {
                  //print(pickedTime.minute); //pickedDate output format => 2021-03-10 00:00:00.000
                  // String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement
                  onChanged!(pickedTime);
                  setState(() {
                    controller.text = pickedTime
                        .format(context); //set output date to TextField value.
                  });
                } else {}
              },
            ).hP4,
          ).round(25),
        ],
      ),
    );
  }
}

class RoundedInputDateTimeField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final String? defaultText;
  final ValueChanged<DateTime>? onChanged;

  const RoundedInputDateTimeField({
    Key? key,
    this.label,
    this.hintText,
    this.defaultText,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedInputDateTimeFieldState createState() =>
      _RoundedInputDateTimeFieldState();
}

class _RoundedInputDateTimeFieldState extends State<RoundedInputDateTimeField> {
  String? label;
  String? hintText;
  String? defaultText;
  TextEditingController controller = TextEditingController();
  ValueChanged<DateTime>? onChanged;

  @override
  void initState() {
    // TODO: implement initState
    label = widget.label;
    hintText = widget.hintText;
    defaultText = widget.defaultText;
    onChanged = widget.onChanged;

    controller.text = defaultText ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          widget.label != null
              ? Text(widget.label!,
              style: Theme.of(context).textTheme.subtitle1)
              .bP8
              : Container(),
          Container(
            color: Theme.of(context).backgroundColor,
            child: Center(
              child: TextField(
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.left,
                controller: controller,
                // onChanged: onChanged,
                cursorColor: Theme.of(context).primaryColorDark,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: InputBorder.none,
                ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1960),
                      initialDate: DateTime.now(),
                      lastDate: DateTime(2100));
                  if (pickedDate != null) {
                    onChanged!(pickedDate);
                    setState(() {
                      String formattedDate =
                      DateFormat('dd-MMM-yyyy').format(pickedDate);
                      controller.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ).hP16,
            ),
          ).round(25),
        ],
      ),
    );
  }
}