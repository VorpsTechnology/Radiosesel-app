import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class SearchBarType3 extends StatefulWidget {
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchStarted;
  final ValueChanged<String> onSearchCompleted;
  final VoidCallback? onBackHandler;

  final Color? iconColor;
  final Color? backgroundColor;
  final double? radius;

  final bool? needBackButton;
  final bool? showSearchIocn;
  final TextStyle? textStyle;
  final double? shadowOpacity;
  final String? hintText;

  const SearchBarType3({
    Key? key,
    required this.onSearchCompleted,
    this.onSearchStarted,
    this.onSearchChanged,
    this.onBackHandler,
    this.iconColor,
    this.radius,
    this.backgroundColor,
    this.needBackButton,
    this.showSearchIocn,
    this.textStyle,
    this.shadowOpacity,
    this.hintText,
  }) : super(key: key);

  @override
  SearchBarType3State createState() => SearchBarType3State();
}

class SearchBarType3State extends State<SearchBarType3> {
  late ValueChanged<String>? onSearchChanged;
  late VoidCallback? onSearchStarted;
  late ValueChanged<String> onSearchCompleted;
  late VoidCallback? onBackHandler;

  TextEditingController controller = TextEditingController();
  late Color? iconColor;
  bool? showSearchIcon;
  late TextStyle? textStyle;
  late Color? backgroundColor;
  late double? radius;
  late double? shadowOpacity;
  late String? hintText;

  @override
  void initState() {
    // TODO: implement initState
    onBackHandler = widget.onBackHandler;
    onSearchChanged = widget.onSearchChanged;
    onSearchStarted = widget.onSearchStarted;
    onSearchCompleted = widget.onSearchCompleted;
    iconColor = widget.iconColor;
    showSearchIcon = widget.showSearchIocn;
    textStyle = widget.textStyle;
    backgroundColor = widget.backgroundColor;
    radius = widget.radius;
    shadowOpacity = widget.shadowOpacity;
    hintText = widget.hintText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: 50,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.needBackButton == true
                ? IconButton(
                    onPressed: () {
                      if (onBackHandler != null) {
                        onBackHandler!();
                      }
                    },
                    icon: ThemeIconWidget(
                      ThemeIcon.backArrow,
                      color: iconColor,
                    ))
                : Container(),
            showSearchIcon == true
                ? ThemeIconWidget(
                    ThemeIcon.search,
                    color: iconColor,
                    size: 20,
                  ).lP16.ripple(() {
                    if (controller.text.length > 2) {
                      onSearchChanged!(controller.text);
                    }
                  })
                : Container(),
            Expanded(
              child: TextField(
                  controller: controller,
                  onEditingComplete: () {
                    onSearchCompleted(controller.text);
                  },
                  onChanged: (value) {
                    // controller.text = value;
                    if (onSearchChanged != null) {
                      onSearchChanged!(value);
                    }
                    setState(() {});
                  },
                  onTap: () {
                    if (onSearchStarted != null) {
                      onSearchStarted!();
                    }
                  },
                  style: textStyle,
                  cursorColor: Theme.of(context).backgroundColor.lighten(),
                  decoration: InputDecoration(
                    hintStyle:
                        textStyle ?? Theme.of(context).textTheme.bodySmall,
                    hintText: hintText ?? LocalizationString.searchAnything,
                    border: InputBorder.none,
                  )).setPadding(bottom: 4, left: 8),
            ),
          ],
        ),
      ),
    ).shadow(
        radius: radius ?? 20,
        fillColor: backgroundColor,
        shadowOpacity: shadowOpacity,
        context: context);
  }
}
