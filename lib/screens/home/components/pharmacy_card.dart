import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/instance.dart';

import 'package:nuncare/screens/detail/pharmacy_details_screen.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({
    required this.pharmacy,
    super.key,
  });

  final Instance pharmacy;

  @override
  Widget build(BuildContext context) {
    String finalPosition = '${pharmacy.position} km';

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PharmacyDetailsScreen(
            pharmacy: pharmacy,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Image.asset(
                pharmacy.img,
                height: 80,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              pharmacy.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(
              height: 3,
            ),
            // Text(
            //   pharmacy.location,
            //   style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
            // ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primarygreen.shade100,
                  ),
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.star,
                        color: primarygreen,
                        size: 18,
                      ),
                      // Text(
                      //   pharmacy.stars.toString(),
                      //   style: GoogleFonts.poppins(
                      //       color: primarygreen, fontSize: 12),
                      // ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.grey.shade300,
                        size: 18,
                      ),
                      Text(
                        finalPosition,
                        style: GoogleFonts.poppins(
                            color: Colors.grey.shade300, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
