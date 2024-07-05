import 'package:flutter/material.dart';

class CustomButtonStyle {
  static ButtonStyle accepted(BuildContext context) {
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        Theme.of(context).colorScheme.primary,
      ),
    );
  }

  static ButtonStyle cancel(BuildContext context) {
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        Theme.of(context).colorScheme.error.withOpacity(0.1),
      ),
      foregroundColor:
          MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.error),
    );
  }
}
