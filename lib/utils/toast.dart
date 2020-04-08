import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formulas_cms/utils/colors.dart';
import 'package:formulas_cms/utils/fonts.dart';

const int _kFadeDurationMs = 200;

abstract class ToastBase {
  void show(String msg, BuildContext context,
      {int gravity,
      Color backgroundColor,
      Color textColor,
      double backgroundRadius,
      double fontSize,
      });
}

class Toast implements ToastBase {
  void show(String msg, BuildContext context,
      {int gravity = 0,
      Color backgroundColor = const Color.fromRGBO(0, 0, 0, 0.6),
      Color textColor = Colors.white,
      double backgroundRadius = 20,
      double fontSize,
      }) {
    ToastView.dismiss();
    ToastView.createView(
        msg, context, gravity, backgroundColor, textColor, backgroundRadius, fontSize);
  }
}

class ToastView {
  static final ToastView _singleton = new ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createView(String msg, BuildContext context, int gravity,
      Color background, Color textColor, double backgroundRadius, double fontSize) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
          widget: Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(backgroundRadius),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child:Text(
                  msg,
                  key: Key(msg),
                  softWrap: true,
                  style: AppFonts.h4.copyWith(
                    color: AppColors.primaryWhite,
                  ),
                ),
              ),
            ),
          ),
          gravity: gravity),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget extends StatefulWidget {
  ToastWidget({
    Key key,
    @required this.widget,
    @required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int gravity;

  @override
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> opacityAnim;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: _kFadeDurationMs));
    opacityAnim = Tween<double>(begin: 0, end: 1).animate(animationController);

    WidgetsBinding.instance.addPostFrameCallback((context) {
      animationController.forward().whenComplete(() async {
        if (this.mounted)
          await Future.delayed(Duration(milliseconds: 3200));
        if (this.mounted)
          animationController.reverse().whenCompleteOrCancel(() {
            ToastView.dismiss();
          });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: widget.gravity == 2 ? 50 : null,
        bottom: widget.gravity == 0 ? 50 : null,
        child: FadeTransition(
          opacity: opacityAnim,
          child: Material(
            color: Colors.transparent,
            child: widget.widget,
          ),
        ));
  }

  @override
  void dispose() {
    animationController.stop();
    animationController.dispose();

    super.dispose();
  }
}
