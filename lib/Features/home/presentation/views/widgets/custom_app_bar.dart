import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( top: 20, bottom: 20),
      child: Row(
        children: [
          // logo
          Image.asset(AssetsData.logo, height: 18),
          Spacer(),
          // icons search button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 26),
          ),
        ],
      ),
    );
  }
}
