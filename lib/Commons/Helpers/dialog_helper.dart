import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_vn/Commons/Constants/app_consts.dart';

class DialogHelper {
  static showDialogLoading() {
    return Get.generalDialog(
        barrierDismissible: false,
        barrierLabel: "",
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return CupertinoAlertDialog(
            content: Wrap(
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator()),
                  SizedBox(
                    width: 170,
                    child: Text(
                      lblPleaseWait,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: Get.context!.textTheme.labelSmall
                          ?.copyWith(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ]),
          );
        });
  }

  static closeDialogLoading() {
    Get.back();
  }

  static showDialog(
      {String? title = "",
      String? content = "",
      Widget? bodyContent,
      bool? barrierDismissible = true,
      List<CupertinoDialogAction>? actions}) async {
    return await Get.generalDialog(
        barrierDismissible: barrierDismissible!,
        barrierLabel: title,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return CupertinoAlertDialog(
            title: title!.isEmpty ? null : Text(title),
            content: bodyContent ?? (content!.isEmpty ? null : Text(content)),
            actions: actions ?? [],
          );
        });
  }

  static showDialogBottomSheet(Widget child, {bool enableDrag = false}) {
    return Get.bottomSheet(
      child,
      isScrollControlled: true,
      backgroundColor: Colors.black.withOpacity(0),
      barrierColor: Colors.black.withOpacity(0),
      enableDrag: enableDrag,
    );
  }
}
