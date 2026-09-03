import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return  Material(
                  elevation: 4,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.search),
                      hintText: "Search",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                )
               ;
  }
}