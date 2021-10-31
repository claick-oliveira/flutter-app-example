import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .22,
        color: Colors.blue.shade300,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Total Balance,',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '\$',
                      style: GoogleFonts.mulish(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    const Text(
                      ' 1,000',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Positioned(
              left: -170,
              top: -170,
              child: CircleAvatar(
                radius: 140,
                backgroundColor: Colors.blue.shade200,
              ),
            ),
            Positioned(
              left: -160,
              top: -190,
              child: CircleAvatar(
                radius: 140,
                backgroundColor: Colors.blue.shade100,
              ),
            ),
            Positioned(
              right: -170,
              bottom: -170,
              child: CircleAvatar(
                radius: 140,
                backgroundColor: Colors.blue.shade200,
              ),
            ),
            Positioned(
              right: -160,
              bottom: -190,
              child: CircleAvatar(
                radius: 140,
                backgroundColor: Colors.blue.shade100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
