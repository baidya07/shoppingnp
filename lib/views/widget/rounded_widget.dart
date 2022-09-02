import 'package:flutter/material.dart';

///Creates a rounded icon

class RoundedIcon extends StatelessWidget {
  final bool hasShadow;
  final Widget child;
  final double? elevation;
  final double? borderRadius;
  final double? contentPadding;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? shadowSpreadRadius;
  final double? shadowBlurRadius;
  final double? offsetX;
  final double? offsetY;

  final double? iconSize;
  final void Function() onPressed;

  const RoundedIcon({
    Key? key,
    required this.child,
    this.elevation,
    this.borderRadius,
    this.iconSize,
    this.contentPadding,
    this.shadowColor,
    this.hasShadow = false,
    this.backgroundColor = Colors.white,
    this.shadowSpreadRadius,
    this.shadowBlurRadius,
    this.offsetX,
    this.offsetY,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(contentPadding ?? 10),
        decoration: BoxDecoration(
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: shadowColor ?? Colors.grey.withOpacity(0.05),
                    spreadRadius: shadowSpreadRadius ?? 20,
                    blurRadius: shadowBlurRadius ?? 20,
                    offset: Offset(offsetX ?? 20,
                        offsetY ?? 20), // changes position of shadow
                  ),
                ]
              : [],
          borderRadius: BorderRadius.circular(borderRadius ?? 100),
          color: backgroundColor,
        ),
        child: SizedBox(
          width: iconSize ?? 18,
          height: iconSize ?? 18,
          child: child,
        ),
      ),
    );
  }
}
