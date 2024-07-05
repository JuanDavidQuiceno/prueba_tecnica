import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_tecnica/src/common/theme/inputs/style_text_field.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.focusNode,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.labelText,
    this.helperText,
    this.initialValue,
    this.filled = false,
    this.fillColor,
    this.style,
    this.decoration,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.readOnly = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.onChanged,
    this.onSaved,
    this.onTapOutSide,
    this.validator,
    this.enabled = true,
    this.obscureText = false,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? initialValue;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? style;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final AutovalidateMode? autovalidateMode;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(PointerDownEvent)? onTapOutSide;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: obscureText! ? 1 : maxLines,
      minLines: minLines,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      controller: controller,
      readOnly: readOnly!,
      style: style ?? StyleTextField.style(context),
      decoration: decoration ??
          StyleTextField.inputDecoration(
            context,
            enabled: enabled,
            filled: true,
            labelText: labelText,
            hintText: hintText ?? 'Escribe aquí',
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
      autovalidateMode: autovalidateMode,
      onTap: onTap,
      onChanged: onChanged,
      onSaved: onSaved,
      onTapOutside: onTapOutSide,
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return 'Campo requerido';
            } else {
              return null;
            }
          },
    );
  }
}
