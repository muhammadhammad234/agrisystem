import 'package:flutter/material.dart';

import '../../utils/size_constants.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      required this.buttonText,
      this.onTap,
      this.backgroundColor,
      this.foregroundColor,
      this.borderColor,
      this.width,
      this.height,
      this.isLoading,
      this.shape,
      this.fontSize});

  String buttonText;
  void Function()? onTap;
  Color? backgroundColor;
  Color? borderColor;
  Color? foregroundColor;
  double? width;
  double? height;
  double? fontSize;
  bool? isLoading;
  OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? const Color(0xFF00BF6D),
          foregroundColor: foregroundColor ?? Colors.white,
          minimumSize: Size(width ?? double.infinity, height ?? 48),
          shape: shape ?? const StadiumBorder(),
        ),
        child: isLoading == true
            ? const CircularProgressIndicator()
            : Text(buttonText));

    // GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     alignment: Alignment.center,
    //     width: width ?? getWidth(context),
    //     height: height ?? 50,
    //     decoration: BoxDecoration(
    //         border: Border.all(
    //             color: borderColor ??
    //                 (enabled == true
    //                     ? Theme.of(context).colorScheme.primary
    //                     : Theme.of(context).colorScheme.secondary)),
    //         borderRadius: BorderRadius.circular(borderRadius ?? 10),
    //         color: backgroundColor ??
    //             (enabled == true
    //                 ? Theme.of(context).colorScheme.primary
    //                 : Theme.of(context).colorScheme.secondary)),
    //     child: isLoading == true
    //         ? const CircularProgressIndicator()
    //         : Text(
    //             buttonText,
    //             textAlign: TextAlign.center,
    //             style: Theme.of(context).textTheme.displayMedium!.copyWith(
    //                 color: foregroundColor ??
    //                     // (enabled == true
    //                     // ?
    //                     Theme.of(context).colorScheme.tertiary,
    //                 // : Theme.of(context).textTheme.bodySmall!.color),
    //                 fontSize: fontSize ??
    //                     Theme.of(context).textTheme.bodyMedium!.fontSize!),
    //           ),
    //   ),
    // );
  }
}
