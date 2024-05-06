import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/text_custom_field.dart';

class OutlinedTextFormField extends TextCustomField {
  const OutlinedTextFormField({
    Key? key,
    super.label,
    super.controller,
    super.focusNode,
    super.validator,
    super.secret = false,
    super.autofocus = false,
    super.suffixIcon,
    super.prefixIcon,
    super.hint,
    super.maxLength,
    super.maxLine,
    super.minLine,
    super.type,
    super.enable,
    super.onTap,
    super.initialInput,
    super.floatingLabelBehavior = FloatingLabelBehavior.auto,
    super.contentPadding = EdgeInsets.zero,
    super.isDense,
    super.prefixIconConstraints,
    super.labelStyle,
    super.floatingLabelStyle,
    super.errorText,
    super.required,
    super.prefixText,
    super.onDone,
    super.inputFormat,
    super.canClearFirstClick,
    super.textAlignVertical,
    super.onChanged,
    this.errorStyle,
    this.counterStyle,
    this.borderSide,
  }) : super(key: key);
  final TextStyle? errorStyle;
  final TextStyle? counterStyle;
  final BorderSide? borderSide;
  @override
  State<OutlinedTextFormField> createState() => _OutlinedTextFormFieldState();
}

class _OutlinedTextFormFieldState extends State<OutlinedTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 20,
        height: 1,
        letterSpacing: -0.16,
      ),
      onTapOutside: (e) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        errorStyle: widget.errorStyle,
        counterStyle: widget.counterStyle,
        filled: true,
        fillColor: AppColors.white,
        counter: const Offstage(),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: widget.suffixIcon,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: widget.borderSide ??
                const BorderSide(width: 1.5, color: AppColors.green),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: widget.borderSide ??
                const BorderSide(width: 1.5, color: AppColors.red),
            borderRadius: BorderRadius.circular(10)),
        hintText: widget.hint,
        hintStyle: TextStyle(
            color: AppColors.black.withOpacity(0.25),
            fontSize: 20,
            height: 0,
            letterSpacing: -0.2),
      ),
      cursorHeight: 20,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: AppColors.black,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.type,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      maxLines: 1,
      maxLength: widget.maxLength,
      minLines: widget.minLine,
      enabled: widget.enable,
      showCursor: true,
      obscureText: widget.secret,
    );
  }
}
