import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final int accountNumber;
  const ContactCard({
    Key? key,
    required this.name,
    required this.accountNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/default-profile.jpeg'),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.mulish(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              accountNumber.toString(),
              style: GoogleFonts.mulish(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
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
