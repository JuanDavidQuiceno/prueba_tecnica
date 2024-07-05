import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle accepted(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        );
  }

  static TextStyle cancel(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.error,
        );
  }
}
