import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../provider/provider_setting.dart';
import '../../styles/colors.dart';

class Widget_TextFormFiled extends StatelessWidget {
  final int length;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final String? initialValue;
  final IconData? icon;
  final TextInputType? keyboardType;

  const Widget_TextFormFiled(
      {required this.length,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.keyboardType,
      this.icon,
      this.maxLines,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    var setting = Provider.of<SettingProvider>(context);
    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: [
        LengthLimitingTextInputFormatter(length),
      ],
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: MASTERCOLOR2),
        prefixIcon: Icon(icon,color: setting.colorSystem[setting.colorNumber],),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: MASTERCOLOR,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: MASTERCOLOR,
            width: 2,
          ),
        ),
      ),
    );
  }
}
