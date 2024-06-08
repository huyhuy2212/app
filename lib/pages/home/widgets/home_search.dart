import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Tìm kiếm ...',
        enabledBorder: customBorder(),
        focusedBorder: customBorder(),
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
    );
  }

  OutlineInputBorder customBorder() => OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(10.0),
      );
}
