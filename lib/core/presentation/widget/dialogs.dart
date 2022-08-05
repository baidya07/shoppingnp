import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// custom animated logout dialog
Future showAnimatedDialog(
    {required BuildContext context,
    required Widget widget,
    bool barrierDismissible = true}) {
  return showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return widget;
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }
      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

class CustomLoadingDialog extends StatelessWidget {
  final double? width;
  final double? height;
  const CustomLoadingDialog({this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: FractionalOffset.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Lottie.asset('assets/anim/loading_anim.json',
                  width: width??100, height: height??100,)
            ],
          ),
        ),
      ),
    );
  }
}

void showLoadingDialog(BuildContext context, {Widget? loadingWidget}) {
  showDialog(
    context: context,
    builder: (BuildContext context) =>
        loadingWidget ?? const CustomLoadingDialog(),
  );
}

void hideLoadingDialog(BuildContext context) {
  context.router.pop();
}
