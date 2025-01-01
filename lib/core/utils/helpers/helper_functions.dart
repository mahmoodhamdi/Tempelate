import 'package:flutter/material.dart';
import 'package:tempelate/core/enums/enums.dart';
import 'package:tempelate/core/utils/constants/colors.dart';
import 'package:tempelate/core/utils/helpers/logger_helper.dart';

class THelperFunctions {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(milliseconds: 900),
  }) {
    Color getColor() {
      switch (type) {
        case SnackBarType.success:
          return success;
        case SnackBarType.error:
          return error;
        case SnackBarType.warning:
          return warning;
        case SnackBarType.info:
          return info;
      }
    }

    IconData getIcon() {
      switch (type) {
        case SnackBarType.success:
          return Icons.check_circle_outline;
        case SnackBarType.error:
          return Icons.error_outline;
        case SnackBarType.warning:
          return Icons.warning_amber_rounded;
        case SnackBarType.info:
          return Icons.info_outline;
      }
    }

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(getIcon(), color: darkText),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: getColor(),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      duration: duration,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showAlert({
    required BuildContext context,
    required String title,
    required String message,
    String? primaryButtonText,
    String? secondaryButtonText,
    VoidCallback? primaryAction,
    VoidCallback? secondaryAction,
  }) {
    LoggerHelper.info(
        "Showing AlertDialog: Title - $title, Message - $message"); // Log Alert action

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            if (secondaryButtonText != null)
              TextButton(
                onPressed: secondaryAction ??
                    () {
                      LoggerHelper.info(
                          "Alert secondary button pressed: $secondaryButtonText");
                      Navigator.of(context).pop();
                    },
                child: Text(
                  secondaryButtonText,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ElevatedButton(
              onPressed: primaryAction ??
                  () {
                    LoggerHelper.info(
                        "Alert primary button pressed: ${primaryButtonText ?? 'OK'}");
                    Navigator.of(context).pop();
                  },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(
                primaryButtonText ?? 'OK',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    LoggerHelper.info("Navigating to screen: ${screen.runtimeType}");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static void popScreen(BuildContext context) {
    LoggerHelper.info("Popping current screen.");
    Navigator.pop(context);
  }

  static void navigateReplacementToScreen(BuildContext context, Widget screen) {
    LoggerHelper.info(
        "Navigating with replacement to screen: ${screen.runtimeType}");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static void navigateAndRemoveUntil(BuildContext context, Widget screen) {
    LoggerHelper.info(
        "Navigating and removing until screen: ${screen.runtimeType}");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
      (route) => false,
    );
  }

  static bool isDarkMode(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    LoggerHelper.info("Is dark mode: $isDark");
    return isDark;
  }

  static Size screenSize(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoggerHelper.debug("Screen size: ${size.width}x${size.height}");
    return size;
  }

  static double screenHeight(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    LoggerHelper.debug("Screen height: $height");
    return height;
  }

  static double screenWidth(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    LoggerHelper.debug("Screen width: $width");
    return width;
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    LoggerHelper.debug("Removing duplicates from list.");
    return list.toSet().toList();
  }

  static void hideKeyboard() {
    LoggerHelper.info("Hiding keyboard");
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
