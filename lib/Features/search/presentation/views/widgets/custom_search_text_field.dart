import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.sarchController, this.onSubmitted});
final TextEditingController sarchController;
final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: sarchController,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: 'Search',
        enabledBorder: bulidOutlineInputBorder(),
        focusedBorder: bulidOutlineInputBorder(),

        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(opacity: .8, child: Icon(Icons.search, size: 22)),
        ),
      ),
    );
  }

  OutlineInputBorder bulidOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
