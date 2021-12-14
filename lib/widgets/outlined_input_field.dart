import 'package:flutter/material.dart';

class OutlinedInputField extends StatefulWidget {
  const OutlinedInputField({
    Key? key,
    this.hintText,
    this.prefixIcon,
    @required this.onChanged,
    this.isPassword = false,
    this.suffixIcon,
    this.enabled = true,
  }) : super(key: key);

  final String? hintText;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final Widget? suffixIcon;
  final bool enabled;

  @override
  _OutlinedInputFieldState createState() => _OutlinedInputFieldState();
}

class _OutlinedInputFieldState extends State<OutlinedInputField> {
  bool _isPasswordVisible = false;
  IconData passwordVisibilityIcon = Icons.visibility;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.isPassword;
  }

  void _togglePasswordView() {
    setState(() {
      if (_isPasswordVisible) {
        passwordVisibilityIcon = Icons.visibility_off;
      } else {
        passwordVisibilityIcon = Icons.visibility;
      }
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        enabled: widget.enabled,
        obscureText: _isPasswordVisible,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          icon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(passwordVisibilityIcon),
                  onPressed: _togglePasswordView,
                )
              : null,
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
