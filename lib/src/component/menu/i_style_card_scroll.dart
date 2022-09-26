import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../palette/palette.dart';
import '../size/i_padding.dart';
import '../size/i_screen.dart';

Widget scrollCard<T>(
  BuildContext context, {
  required Widget widget,
  Function(DragUpdateDetails)? function,
  Function()? onTap,
  required double initData,
  GlobalKey? key,
}) {
  var data = IScreen().width(context, width: 1.0) / initData;
  return Positioned(
    right: 0,
    bottom: 0,
    top: 0,
    child: Stack(
      children: [
        SizedBox(
          width: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  width: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(data >= 1.25 ? 10 : 0),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                    color: Palette.secondary2,
                  ),
                ),
              ),
            ],
          ),
        ),
        Consumer<T>(
          builder: (context, provider, child) {
            return Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(IPadding.p0),
                      decoration: BoxDecoration(
                        color: Palette.secondary2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: onTap,
                        onHorizontalDragUpdate: function,
                        child: Image.asset(
                          key: key,
                          data >= 1.25
                              ? "assets/icon/add.png"
                              : "assets/icon/arrow-right.png",
                          width: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: initData,
                  decoration: const BoxDecoration(
                    color: Palette.secondary2,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    height: IScreen().height(context, height: 1.0),
                    width: IScreen().width(context, width: 1.0),
                    decoration: const BoxDecoration(
                      color: Palette.secondary2,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(10),
                      ),
                    ),
                    child: initData <= 20 ? Container() : widget,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    ),
  );
}
