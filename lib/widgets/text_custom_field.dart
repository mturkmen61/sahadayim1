import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextCustomField extends StatefulWidget {
  const TextCustomField({
    Key? key,
    this.controller,
    this.initialInput,
    this.focusNode,
    this.label,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.secret = false,
    this.labelStyle,
    this.floatingLabelStyle,
    this.inputStyle,
    this.hintStyle,
    this.hint,
    this.onTap,
    this.minLine,
    this.suffix,
    this.fillColor,
    this.contentPadding,
    this.maxLength,
    this.inputFormat,
    this.errorBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.prefixIconConstraints,
    this.errorText,
    this.required = false,
    this.isDense = false,
    this.prefixText,
    this.onDone,
    this.canClearFirstClick = false,
    this.textAlignVertical,
    bool? showSuffixIcon,
    TextInputType? type,
    bool? enable,
    bool? defaultValidator,
    int? maxLine,
    bool? clearButtonEnable,
    FloatingLabelBehavior? floatingLabelBehavior,
  })  : assert(
          defaultValidator == null || validator == null || suffix == null,
          'Cannot provide both a default Validator , validator and suffix',
        ),
        assert(
          suffixIcon == null || clearButtonEnable == null,
          'Cannot provide both a suffix Icon and a clear button Enable',
        ),
        assert(
          !required || validator != null,
          "You cannot leave the validator blank if it is required",
        ),
        showSuffixIcon = showSuffixIcon ?? true,
        type = type ?? TextInputType.text,
        clearButtonEnable = clearButtonEnable ?? false,
        enable = enable ?? true,
        defaultValidator = defaultValidator ?? false,
        maxLine = maxLine ?? 1,
        floatingLabelBehavior =
            floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        super(key: key);

  /// Input controller [TextEditingController].
  final TextEditingController? controller;

  /// Input focusnode
  final FocusNode? focusNode;

  /// Input auto focus [bool]
  /// default false.
  final bool autofocus;

  /// The label display above of input.
  final String? label;

  /// The label style [TextStyle]
  final TextStyle? labelStyle;

  /// The floating label style
  final TextStyle? floatingLabelStyle;

  /// Input style [TextStyle].
  final TextStyle? inputStyle;

  /// Hint style [TextStyle]
  final TextStyle? hintStyle;

  /// Input prefix icon [Widget].
  /// The display head.
  final Widget? prefixIcon;

  /// Input suffix icon [Widget].
  /// The display queu
  final Widget? suffixIcon;

  /// Input suffix [Widget]
  final Widget? suffix;

  /// Input validator.
  final String? Function(String? input)? validator;

  /// Changed input values [Function]<String>
  final ValueChanged<String?>? onChanged;

  /// If you do not show your input
  /// make it true.
  final bool secret;

  /// Input fill [Color]
  /// default [Colors.transparent].
  final Color? fillColor;

  /// Input suffix icon [Widget] if want to display
  /// set [true] [bool]
  final bool showSuffixIcon;

  /// TextFormField input tyep
  final TextInputType type;

  /// Text field hint text [String]
  final String? hint;

  /// Enable [TextFormField] for edit.
  /// default [true]
  final bool enable;

  /// Default validator enable [bool]
  /// default is [false]
  final bool defaultValidator;

  /// On tap [TextFormField]
  final VoidCallback? onTap;

  /// max line
  final int maxLine;

  /// min line
  final int? minLine;

  /// Initial input [String]
  final String? initialInput;

  /// Clear all field.
  /// button enable [bool] false.
  final bool clearButtonEnable;

  /// Content field padding
  final EdgeInsets? contentPadding;

  /// Input max length
  final int? maxLength;

  /// Label behavior
  /// default [FloatingLabelBehavior.always]
  final FloatingLabelBehavior floatingLabelBehavior;

  /// form field input FORMAT
  final List<TextInputFormatter>? inputFormat;

  /// Enabled border
  final InputBorder? enabledBorder;

  /// Focused border
  final InputBorder? focusedBorder;

  /// Focused error border
  final InputBorder? focusedErrorBorder;

  /// Error border
  final InputBorder? errorBorder;

  /// Disabled border
  final InputBorder? disabledBorder;

  /// Prefix icon constraint
  final BoxConstraints? prefixIconConstraints;

  /// validator error text
  final String? errorText;

  /// Is required field condition
  /// default `false`
  final bool required;

  /// Prefix text
  final String? prefixText;

  /// final is dense
  final bool isDense;

  /// Click on done button
  /// top of the keyboard
  final void Function(String? input)? onDone;

  /// First click clear controller
  final bool canClearFirstClick;

  /// Text align vertical
  final TextAlignVertical? textAlignVertical;

  @override
  State<TextCustomField> createState() => TextCustomFieldState();
}

class TextCustomFieldState extends State<TextCustomField> {
  /// Is first click
  bool isFirstClick = false;

  OverlayEntry? overlayEntry;
  late FocusNode _focusNode;
  late TextEditingController _controller;
  AutovalidateMode? autoValidateMode;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        autoValidateMode = AutovalidateMode.onUserInteraction;
        if (widget.onDone != null) {
          removeOverlay();
        }
      }
      if (_focusNode.canRequestFocus && widget.secret) {
        obscureText = true;
      }
      if (_focusNode.hasFocus) {
        if (widget.onDone != null) {
          showOverlay();
        }
      }
      if (mounted) {
        setState(() {});
      }
    });

    if (widget.initialInput != null) {
      _controller.text = widget.initialInput!;
    }
    obscureText = widget.secret;
    super.initState();
  }

  bool _obscureText = false;
  bool get obscureText => _obscureText;
  set obscureText(value) {
    _obscureText = value;
    if (mounted) {
      setState(() {});
    }
  }

  void showOverlay() {
    if (overlayEntry != null) return;
    OverlayState? overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child: _doneButton,
        );
      },
    );
    overlayState.insert(overlayEntry!);
  }

  Widget get _doneButton {
    return Container(
      height: 40.0,
      color: const Color.fromARGB(255, 214, 214, 214),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              _focusNode.unfocus();
              widget.onDone?.call(_controller.text);
            },
            child: const Text('Done'),
          )
        ],
      ),
    );
  }

  void removeOverlay() {
    if (overlayEntry != null) {
      overlayEntry?.remove();
      overlayEntry = null;
    }
  }

  void _onTap() {
    if (widget.canClearFirstClick) {
      if (!isFirstClick) {
        _controller.clear();
        isFirstClick = true;
      }
    }
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;
    return TextFormField(
      onTap: _onTap,
      controller: _controller,
      onChanged: widget.onChanged,
      onEditingComplete: () {
        widget.onDone?.call(_controller.text);
      },
      obscureText: obscureText,
      keyboardType: widget.type,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      enabled: widget.enable,
      autocorrect: false,
      style: widget.inputStyle,
      maxLength: widget.maxLength,
      autovalidateMode: autoValidateMode,
      validator: widget.defaultValidator ? _validator : widget.validator,
      cursorColor: theme.focusColor,
      cursorWidth: 1.5,
      maxLines: widget.maxLine,
      minLines: widget.minLine,
      inputFormatters: widget.inputFormat,
      textInputAction: TextInputAction.done,
      textAlignVertical: widget.textAlignVertical,
      decoration: InputDecoration(
        prefixIconConstraints: widget.prefixIconConstraints,
        label: widget.label != null ? Text(widget.label!) : null,
        labelStyle: widget.labelStyle?.copyWith(
          color: widget.required ? Colors.red : null,
        ),
        alignLabelWithHint: true,
        floatingLabelStyle: widget.floatingLabelStyle?.copyWith(
          color: widget.required ? Colors.red : null,
        ),
        isDense: widget.isDense,
        contentPadding: widget.contentPadding,
        hintText: widget.hint,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _suffixIcon,
        prefixText: widget.prefixText,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        suffix: widget.suffix,
        helperStyle: const TextStyle(height: 0.0, fontSize: 0.0),
        counterStyle: const TextStyle(height: 0.0, fontSize: 0.0),
        fillColor: widget.fillColor,
        enabledBorder: widget.enabledBorder,
        focusedBorder: widget.focusedBorder,
        focusedErrorBorder: widget.focusedErrorBorder,
        errorBorder: widget.errorBorder,
        border: widget.enabledBorder,
        disabledBorder: widget.disabledBorder,
        errorText: widget.errorText,
      ),
    );
  }

  /// Default validator [defaultValidator]
  String? _validator(String? input) {
    if (input == null || input.isEmpty) {
      return "required";
    }
    return null;
  }

  Widget? get _suffixIcon {
    if (!widget.showSuffixIcon) return null;
    if (widget.clearButtonEnable) {
      if (!_focusNode.hasFocus) return null;
      return GestureDetector(
        onTap: _controller.clear,
        child: const Icon(
          Icons.close,
          size: 15.0,
        ),
      );
    }
    if (!widget.secret || widget.suffixIcon != null) {
      return widget.suffixIcon;
    }
    if (widget.secret) return _visibilityButton;
    return null;
  }

  CrossFadeState get _crossFade {
    return obscureText ? CrossFadeState.showSecond : CrossFadeState.showFirst;
  }

  Widget get _visibilityButton {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: () {
          obscureText = !obscureText;
          setState(() {});
        },
        icon: AnimatedCrossFade(
          crossFadeState: _crossFade,
          firstChild: const Icon(Icons.visibility_off),
          secondChild: const Icon(Icons.visibility),
          duration: const Duration(milliseconds: 200),
          firstCurve: Curves.easeIn,
        ),
        iconSize: 20.0,
      ),
    );
  }
}
