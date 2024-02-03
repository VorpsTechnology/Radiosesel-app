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
                        spreadRadius: .2,
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
