import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/common/theme/colors.dart';
import 'package:prueba_tecnica/src/common/theme/inputs/input_decoration.dart';

enum IconPosition { left, right }

class StyleTextField {
  static TextStyle style(BuildContext context, {Color? textColor}) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: textColor ?? AppColors.textColor,
        );
  }

  static InputDecoration inputDecoration(
    BuildContext context, {
    bool? filled = false,
    Color? fillColor = AppColors.hintColor,
    String? labelText,
    String? hintText,
    String? helperText,
    EdgeInsets? contentPadding,
    bool? isDense,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool? enabled = true,
  }) {
    return InputDecoration(
      fillColor: fillColor ?? AppColors.transparent,
      labelText: labelText,
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      hintText: hintText,
      errorMaxLines: 3,
      // hoverColor: AppColors.primaryLightColor.withOpacity(0.2),
      hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),
      helperText: helperText,
      helperStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),

      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 10,
          ),
      isDense: isDense ?? false,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: DecorationInput.outline(
        color: enabled! ? AppColors.textColor : AppColors.grey,
      ),
      focusedBorder: DecorationInput.outline(
        color: enabled ? AppColors.primaryColor : AppColors.grey,
      ),
      focusedErrorBorder: DecorationInput.outline(
        color: AppColors.red,
      ),
      disabledBorder: DecorationInput.outline(color: AppColors.textColor),
      enabledBorder: DecorationInput.outline(
        color: enabled ? AppColors.textColor : AppColors.grey,
      ),
    );
  }

  static InputDecoration inputDecorationSecondary(
    BuildContext context, {
    bool? filled = true,
    Color? fillColor = AppColors.transparent,
    String? labelText,
    String? hintText,
    String? helperText,
    EdgeInsets? contentPadding,
    bool? isDense,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      filled: filled,
      fillColor: fillColor,
      labelText: labelText,
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      hintText: hintText,
      errorMaxLines: 3,
      // hoverColor: AppColors.primaryLightColor.withOpacity(0.2),
      hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            // color: AppColors.texto300,
            fontWeight: FontWeight.w400,
          ),
      helperText: helperText,
      helperStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),

      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 10,
          ),
      isDense: isDense ?? false,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hoverColor: AppColors.primaryColor,
      border: DecorationInput.outline(color: AppColors.transparent),
      focusedBorder: DecorationInput.outline(color: AppColors.primaryColor),
      focusedErrorBorder: DecorationInput.outline(
        color: AppColors.red,
      ),
      disabledBorder: DecorationInput.outline(color: AppColors.transparent),
      enabledBorder: DecorationInput.outline(color: AppColors.transparent),
    );
  }

  static InputDecoration inputDecorationUnit(
    BuildContext context, {
    Color? fillColor,
    String? labelText,
    String? hintText,
    String? helperText,
    EdgeInsets? contentPadding,
    bool? isDense,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      fillColor: fillColor ?? AppColors.transparent,
      labelText: labelText,
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      hintText: hintText,
      errorMaxLines: 3,
      // hoverColor: AppColors.primaryLightColor.withOpacity(0.2),
      hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),
      helperText: helperText,
      helperStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 2,
          ),
      isDense: isDense ?? true,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: DecorationInput.outline(
        color: AppColors.hintColor,
        bordeRadius: 0,
      ),
      focusedBorder:
          DecorationInput.outline(color: AppColors.hintColor, bordeRadius: 0),
    );
  }
}
