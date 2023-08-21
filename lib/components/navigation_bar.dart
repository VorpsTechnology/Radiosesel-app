import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class CustomNavigationBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget? child;
  final bool? showSeparator;
  final Color? backgroundColor;
  final void Function()? onTap;
  const CustomNavigationBar(
      {Key? key,
      this.child,
      this.showSeparator,
      this.backgroundColor,
      this.onTap})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
          preferredSize: preferredSize,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff17C4EA).withOpacity(.6),
                    // borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 5.0,
                        spreadRadius: 2,
                        offset: Offset(
                          1,
                          2,
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      child ??
                          Container(
                            height: 50,
                            width: 310,
                            // decoration: const BoxDecoration(
                            //   image: DecorationImage(
                            //       image: AssetImage("assets/images/logo.png"),
                            //       fit: BoxFit.fitWidth),
                            // ),
                            alignment: Alignment.center,
                            child: Text(
                              "RADIOSESEL.COM",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: CommonColor.kWhite,
                                      letterSpacing: 5,
                                      fontWeight: FontWeight.bold),
                            ).hP16,
                          ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 10,
                child: GestureDetector(
                  child: Image.asset(
                    "assets/icons/drawer_icon.png",
                    width: 30,
                    height: 30,
                    color: CommonColor.kWhite,
                  ),
                  onTap: onTap ??
                      () {
                        ZoomDrawer.of(context)?.open();
                      },
                ),
              ),
            ],
          )),
    );
  }
}

class BackNavigationBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String? title;
  final bool? showDivider;
  final bool? centerTitle;
  final VoidCallback backTapHandler;

  const BackNavigationBar(
      {Key? key,
      this.title,
      this.showDivider,
      this.centerTitle,
      required this.backTapHandler})
      : preferredSize = const Size.fromHeight(70.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              Row(
                children: [
                  ThemeIconWidget(ThemeIcon.backArrow,
                          size: 20, color: Theme.of(context).iconTheme.color)
                      .ripple(() {
                    backTapHandler();
                    // Navigator.of(context).pop();
                  }),
                  centerTitle == true ? const Spacer() : Container(),
                  centerTitle != true ? Container(width: 20) : Container(),
                  title != null
                      ? Text(title!,
                              style: Theme.of(context).textTheme.titleLarge)
                          .ripple(() {
                          backTapHandler();
                          //Navigator.of(context).pop();
                        })
                      : Container(),
                  centerTitle == true ? const Spacer() : Container(),
                  Container(width: 20)
                ],
              ).tp(55).hP16,
              const Spacer(),
              showDivider == true
                  ? Divider(height: 1, color: Theme.of(context).dividerColor)
                  : Container()
            ],
          ),
        ));
  }
}

class NavigationBarWithCloseBtn extends StatelessWidget
    with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String? title;
  final bool? showDivider;
  final bool? centerTitle;

  const NavigationBarWithCloseBtn(
      {Key? key, this.title, this.showDivider, this.centerTitle})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              Row(
                children: [
                  const ThemeIconWidget(ThemeIcon.close, size: 20).ripple(() {
                    // Routemaster.of(context).pop();
                  }),
                  centerTitle == true ? const Spacer() : Container(),
                  centerTitle != true ? Container(width: 20) : Container(),
                  title != null
                      ? Text(title!,
                              style: Theme.of(context).textTheme.bodyLarge)
                          .ripple(() {
                          // NavigationService.instance.goBack();
                          // Routemaster.of(context).pop();
                        })
                      : Container(),
                  centerTitle == true ? const Spacer() : Container(),
                  Container(width: 20)
                ],
              ).tp(55).hP16,
              const Spacer(),
              showDivider == true
                  ? Divider(height: 1, color: Theme.of(context).dividerColor)
                  : Container()
            ],
          ),
        ));
  }
}

class TitleNavigationBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String? title;
  final bool? showDivider;

  const TitleNavigationBar({Key? key, required this.title, this.showDivider})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title!, style: Theme.of(context).textTheme.bodyLarge).bP16,
              showDivider == true
                  ? Divider(height: 1, color: Theme.of(context).dividerColor)
                  : Container()
            ],
          ),
        ));
  }
}

class BackNavBar extends StatelessWidget {
  final String? title;
  final bool? showDivider;
  final bool? centerTitle;
  final VoidCallback backTapHandler;

  const BackNavBar(
      {Key? key,
      this.title,
      this.showDivider,
      this.centerTitle,
      required this.backTapHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Theme.of(context).backgroundColor.withOpacity(0.5),
      child: Column(
        children: [
          Row(
            children: [
              ThemeIconWidget(ThemeIcon.backArrow,
                      size: 20, color: Theme.of(context).iconTheme.color)
                  .ripple(() {
                backTapHandler();
                // Navigator.of(context).pop();
              }),
              centerTitle == true ? const Spacer() : Container(),
              centerTitle != true ? Container(width: 20) : Container(),
              title != null
                  ? Text(title!,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w600))
                      .ripple(() {
                      backTapHandler();
                      //Navigator.of(context).pop();
                    })
                  : Container(),
              centerTitle == true ? const Spacer() : Container(),
              Container(width: 20)
            ],
          ).tp(55).hP16,
          const Spacer(),
          showDivider == true
              ? Divider(height: 1, color: Theme.of(context).dividerColor)
              : Container()
        ],
      ),
    );
  }
}
