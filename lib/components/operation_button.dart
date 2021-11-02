import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OperationButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onMyTap;
  const OperationButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onMyTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            onMyTap();
          },
          child: Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color(0xfff3f3f3),
                  offset: Offset(5, 5),
                  blurRadius: 10,
                )
              ],
            ),
            child: Icon(
              icon,
              size: 35,
            ),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.mulish(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: const Color(0xff76797e),
          ),
        ),
      ],
    );
  }
}
