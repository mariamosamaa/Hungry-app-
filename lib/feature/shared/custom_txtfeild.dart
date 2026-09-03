import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTxtfeild extends StatefulWidget {
  const CustomTxtfeild({
    super.key,
    required this.hint,
    required this.sec,
    required this.controller,
    this.validator, // ✅ لو محددة، بتستخدم دي بدل الشرط الافتراضي (مش فاضي بس)
    this.keyboardType, // ✅ لوحة مفاتيح مناسبة (أرقام/إيميل..)
    this.maxLength, // ✅ حد أقصى للحروف/الأرقام (مفيد لرقم الموبايل)
  });
  final String hint;
  final bool sec;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  State<CustomTxtfeild> createState() => _CustomTxtfeildState();
}

class _CustomTxtfeildState extends State<CustomTxtfeild> {
  late bool _obstext;
  @override
  void initState() {
    _obstext = widget.sec;
    super.initState();
  }

  void toggle() {
    setState(() {
      _obstext = !_obstext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorHeight: 18,
      obscureText: _obstext,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'please fill ${widget.hint}';
            }
            return null;
          },
      cursorColor: Colors.black,
      decoration: InputDecoration(
        counterText: '', // يخفي عداد الحروف اللي بيظهر تحت لما نحدد maxLength
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hint,
        suffixIcon: widget.sec
            ? GestureDetector(
                onTap: toggle,
                child: Icon(CupertinoIcons.eye, color: Colors.white),
              )
            : null,
        fillColor: Colors.transparent,
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
      ),
    );
  }
}