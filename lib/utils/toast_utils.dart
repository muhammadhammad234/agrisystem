import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'app_colors.dart';

class ToastUtils {
  static showSuccessToast({String? title, required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Get.theme.colorScheme.primary,
        textColor: Get.theme.colorScheme.secondary,
    fontSize: 16.0);
    // Get.snackbar(title ?? "Success", message,
    //     backgroundColor: Colors.white,
    //     titleText: Text(
    //       title ?? "Success",
    //       style:
    //           const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //     ),
    //     messageText: Text(message, style: const TextStyle(color: Colors.black)),
    //     icon: const Icon(
    //       Icons.check_circle,
    //       color: Colors.green,
    //     ));
    // toastification.show(
    //   // context: context, // optional if you use ToastificationWrapper
    //   type: ToastificationType.info,
    //   style: ToastificationStyle.minimal,
    //   autoCloseDuration: const Duration(seconds: 5),

    //   // title: Text(
    //   //   'Success',
    //   //   style: Get.theme.textTheme.displayMedium,
    //   // ),
    //   // you can also use RichText widget for title and description parameters
    //   description: RichText(
    //       text: TextSpan(text: message, style: Get.theme.textTheme.bodySmall)),
    //   alignment: Alignment.topCenter,
    //   direction: TextDirection.ltr,
    //   animationDuration: const Duration(milliseconds: 300),
    //   animationBuilder: (context, animation, alignment, child) {
    //     return FadeTransition(
    //       opacity: animation,
    //       child: child,
    //     );
    //   },
    //   icon: const Icon(Icons.check),
    //   // primaryColor: Colors.green,
    //   backgroundColor: Get.theme.colorScheme.primary,
    //   foregroundColor: Get.theme.colorScheme.primary,
    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    //   borderRadius: BorderRadius.circular(12),
    //   boxShadow: const [
    //     BoxShadow(
    //       color: Color(0x07000000),
    //       // blurRadius: 16,
    //       offset: Offset(0, 16),
    //       spreadRadius: 0,
    //     )
    //   ],
    //   showProgressBar: true,
    //   closeButtonShowType: CloseButtonShowType.onHover,
    //   closeOnClick: true,
    //   pauseOnHover: true,
    //   dragToClose: true,
    //   applyBlurEffect: true,
    //   callbacks: ToastificationCallbacks(
    //     onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
    //     onCloseButtonTap: (toastItem) =>
    //         print('Toast ${toastItem.id} close button tapped'),
    //     onAutoCompleteCompleted: (toastItem) =>
    //         print('Toast ${toastItem.id} auto complete completed'),
    //     onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    //   ),
    // );
  
  }

  static showErrorToast({String? title, required String message}) {
    // Get.snackbar(title ?? "Error", message,
    //     backgroundColor: Colors.white,
    //     titleText: Text(
    //       title ?? "Error",
    //       style:
    //           const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //     ),
    //     messageText: Text(message, style: const TextStyle(color: Colors.black)),
    //     icon: const Icon(
    //       Icons.cancel,
    //       color: Colors.red,
    //     ));
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
       backgroundColor: Get.theme.colorScheme.primary,
        textColor: Get.theme.colorScheme.secondary,
        fontSize: 16.0);
  
    // toastification.show(
    //   // context: context, // optional if you use ToastificationWrapper
    //   type: ToastificationType.info,
    //   style: ToastificationStyle.minimal,
    //   autoCloseDuration: const Duration(seconds: 5),
    //   // title: Text(
    //   //   title ??
    //   //   'Error',
    //   //   style: Get.theme.textTheme.displayMedium,
    //   // ),
    //   // you can also use RichText widget for title and description parameters
    //   description: RichText(
    //       text: TextSpan(text: message, style: Get.theme.textTheme.bodySmall)),
    //   alignment: Alignment.topCenter,
    //   direction: TextDirection.ltr,
    //   animationDuration: const Duration(milliseconds: 300),
    //   animationBuilder: (context, animation, alignment, child) {
    //     return FadeTransition(
    //       opacity: animation,
    //       child: child,
    //     );
    //   },
    //   icon: const Icon(Icons.error),
    //   // primaryColor: Colors.red,
    //   backgroundColor: Get.theme.colorScheme.primary,
    //   foregroundColor: Get.theme.colorScheme.primary,
    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    //   borderRadius: BorderRadius.circular(12),
    //   boxShadow: const [
    //     BoxShadow(
    //       color: Color(0x07000000),
    //       // blurRadius: 16,
    //       offset: Offset(0, 16),
    //       spreadRadius: 0,
    //     )
    //   ],
    //   showProgressBar: true,
    //   closeButtonShowType: CloseButtonShowType.onHover,
    //   closeOnClick: true,
    //   pauseOnHover: true,
    //   dragToClose: true,
    //   applyBlurEffect: true,
    //   callbacks: ToastificationCallbacks(
    //     onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
    //     onCloseButtonTap: (toastItem) =>
    //         print('Toast ${toastItem.id} close button tapped'),
    //     onAutoCompleteCompleted: (toastItem) =>
    //         print('Toast ${toastItem.id} auto complete completed'),
    //     onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    //   ),
    // );
  
  }

  static showWarningToast({String? title, required String message}) {
    // toastification.show(
    //   // context: context, // optional if you use ToastificationWrapper
    //   type: ToastificationType.info,
    //   style: ToastificationStyle.fillColored,
    //   autoCloseDuration: const Duration(seconds: 5),
    //   // title: Text(
    //   //   'Note',
    //   //   style: Get.theme.textTheme.displayMedium,
    //   // ),
    //   // you can also use RichText widget for title and description parameters
    //   description: RichText(
    //       text: TextSpan(text: message, style: Get.theme.textTheme.bodySmall)),
    //   alignment: Alignment.topCenter,
    //   direction: TextDirection.ltr,
    //   animationDuration: const Duration(milliseconds: 300),
    //   animationBuilder: (context, animation, alignment, child) {
    //     return FadeTransition(
    //       opacity: animation,
    //       child: child,
    //     );
    //   },
    //   icon: const Icon(Icons.warning),
    //   // primaryColor: Colors.yellow,
    //   backgroundColor: Get.theme.colorScheme.primary,
    //   foregroundColor: Get.theme.colorScheme.primary,
    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    //   borderRadius: BorderRadius.circular(12),
    //   boxShadow: const [
    //     BoxShadow(
    //       color: Color(0x07000000),
    //       // blurRadius: 16,
    //       offset: Offset(0, 16),
    //       spreadRadius: 0,
    //     )
    //   ],
    //   showProgressBar: true,
    //   closeButtonShowType: CloseButtonShowType.onHover,
    //   closeOnClick: true,
    //   pauseOnHover: true,
    //   dragToClose: true,
    //   applyBlurEffect: true,
    //   callbacks: ToastificationCallbacks(
    //     onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
    //     onCloseButtonTap: (toastItem) =>
    //         print('Toast ${toastItem.id} close button tapped'),
    //     onAutoCompleteCompleted: (toastItem) =>
    //         print('Toast ${toastItem.id} auto complete completed'),
    //     onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    //   ),
    // );

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
    backgroundColor: Get.theme.colorScheme.primary,
        textColor: Get.theme.colorScheme.secondary,
           fontSize: 16.0);

    // Get.snackbar(title ?? "Warning", message,
    //     backgroundColor: Colors.white,
    //     titleText: Text(
    //       title ?? "Warning",
    //       style:
    //           const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //     ),
    //     messageText: Text(message, style: const TextStyle(color: Colors.black)),
    //     icon: const Icon(
    //       Icons.warning,
    //       color: Colors.yellow,
    // ));
  }
  static showBottomToast({String? title, required String message}) {
    // toastification.show(
    //   // context: context, // optional if you use ToastificationWrapper
    //   type: ToastificationType.info,
    //   style: ToastificationStyle.fillColored,
    //   autoCloseDuration: const Duration(seconds: 5),
    //   // title: Text(
    //   //   'Note',
    //   //   style: Get.theme.textTheme.displayMedium,
    //   // ),
    //   // you can also use RichText widget for title and description parameters
    //   description: RichText(
    //       text: TextSpan(text: message, style: Get.theme.textTheme.bodySmall)),
    //   alignment: Alignment.topCenter,
    //   direction: TextDirection.ltr,
    //   animationDuration: const Duration(milliseconds: 300),
    //   animationBuilder: (context, animation, alignment, child) {
    //     return FadeTransition(
    //       opacity: animation,
    //       child: child,
    //     );
    //   },
    //   icon: const Icon(Icons.warning),
    //   // primaryColor: Colors.yellow,
    //   backgroundColor: Get.theme.colorScheme.primary,
    //   foregroundColor: Get.theme.colorScheme.primary,
    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    //   borderRadius: BorderRadius.circular(12),
    //   boxShadow: const [
    //     BoxShadow(
    //       color: Color(0x07000000),
    //       // blurRadius: 16,
    //       offset: Offset(0, 16),
    //       spreadRadius: 0,
    //     )
    //   ],
    //   showProgressBar: true,
    //   closeButtonShowType: CloseButtonShowType.onHover,
    //   closeOnClick: true,
    //   pauseOnHover: true,
    //   dragToClose: true,
    //   applyBlurEffect: true,
    //   callbacks: ToastificationCallbacks(
    //     onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
    //     onCloseButtonTap: (toastItem) =>
    //         print('Toast ${toastItem.id} close button tapped'),
    //     onAutoCompleteCompleted: (toastItem) =>
    //         print('Toast ${toastItem.id} auto complete completed'),
    //     onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    //   ),
    // );

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
    backgroundColor: AppColors.primaryColor,
        textColor: AppColors.textSecondaryColor,
           fontSize: 16.0);

    // Get.snackbar(title ?? "Warning", message,
    //     backgroundColor: Colors.white,
    //     titleText: Text(
    //       title ?? "Warning",
    //       style:
    //           const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //     ),
    //     messageText: Text(message, style: const TextStyle(color: Colors.black)),
    //     icon: const Icon(
    //       Icons.warning,
    //       color: Colors.yellow,
    // ));
  }
}
