
import 'package:awesome_icons/awesome_icons.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icon star
        Icon(FontAwesomeIcons.solidStar , color: Color(0xffFFDD4F),),
        Gap(6),
        // rating
        Text('4.8' , style: Styles.textStyle16,),
        Gap(5),
        // reviews
        Text('(245)', style: Styles.textStyle14,),
      ],
    );
  }
}