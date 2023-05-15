import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../provider/provider_setting.dart';
import '../../styles/colors.dart';

class My_TextFormFiled extends StatelessWidget {
  final int length;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final String? initialValue;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool TxtDecoration;
  final bool enable;

  const My_TextFormFiled(
      {required this.length,
      required this.controller,
      required this.hintText,
      this.TxtDecoration = true,
      this.validator,
      this.keyboardType,
      this.icon,
      this.maxLines,
      this.enable = true,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    var setting = Provider.of<SettingProvider>(context);
    return TextFormField(
      // autofocus: true,

      maxLines: maxLines,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType,
      enabled: enable,
      inputFormatters: [
        LengthLimitingTextInputFormatter(length),
      ],
      controller: controller,
      textDirection: TxtDecoration ? TextDirection.rtl : TextDirection.ltr,
      decoration: InputDecoration(
        filled: true,
        fillColor:setting.colorSystem[setting.colorNumber].withOpacity(0.2),
        hintText: hintText,
        hintStyle: TextStyle(
          color: MASTERCOLOR2,
        ),
        prefixIcon: Icon(
          icon,
          color: setting.colorSystem[setting.colorNumber],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: setting.colorSystem[setting.colorNumber],
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: setting.colorSystem[setting.colorNumber],
            width: 2,
          ),
        ),
      ),
    );
  }
}
