import 'package:flutter/material.dart';

class CustomAuthtextfeild extends StatelessWidget {
  const CustomAuthtextfeild({super.key, required this.controller, required this.label,this.onChanged});
    final TextEditingController controller;
    final String label;
    final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextField(
                controller: controller,
                cursorColor: Colors.white,
                cursorHeight: 20,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText:label,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ) ;
  }
}