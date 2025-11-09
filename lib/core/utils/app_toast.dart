import 'package:flutter/material.dart';

class Toast {
  static void showToast({
    required BuildContext context,
    required String msg,
    Color? backgroundColor,
    Color? textColor,
    TextAlign? textAlign,
    TextStyle? textStyle,
    Alignment? gravity,
    int? seconds = 3,
  }) {
    final OverlayEntry toast = OverlayEntry(
      builder: (context) {
        return Align(
          alignment: gravity ?? Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.black.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Text(
                msg,
                textAlign: textAlign ?? TextAlign.center,
                style:
                    textStyle ??
                    TextStyle(fontSize: 16, color: textColor ?? Colors.white),
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(toast);
    Future.delayed(Duration(seconds: seconds!), () {
      toast.remove();
    });
  }

  /// Show or hide a modal loading overlay.
  ///
  /// Call with `isLoading: true` to show the loader, and with
  /// `isLoading: false` to remove it. This uses a single shared
  /// overlay entry to avoid multiple stacked loaders.
  static void showLoading({
    required BuildContext context,
    required bool isLoading,
    Color backgroundColor = const Color(0x30000000),
    Color progressColor = Colors.blue,
    String? message,
  }) {
    if (isLoading) {
      // Already showing
      if (_loadingEntry != null) return;

      _loadingEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            ModalBarrier(dismissible: false, color: backgroundColor),

            Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: 80,
                    minHeight: 80,
                    maxWidth: 220,
                  ),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          progressColor,
                        ),
                      ),
                      if (message != null) ...[
                        SizedBox(height: 16),
                        Text(
                          message,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      final overlay = Overlay.of(context);
      overlay.insert(_loadingEntry!);
    } else {
      _loadingEntry?.remove();
      _loadingEntry = null;
    }
  }

  static OverlayEntry? _loadingEntry;
}
