import 'package:bytebank/components/title_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/default-profile.jpeg'),
        ),
        const SizedBox(width: 15),
        const TitleText(text: 'Hello,'),
        Text(
          ' Jhon',
          style: GoogleFonts.mulish(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Icon(
          Icons.short_text,
          color: Theme.of(context).iconTheme.color,
        )
      ],
    );
  }
}
