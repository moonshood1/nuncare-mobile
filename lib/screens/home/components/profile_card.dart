import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/screens/detail/profile_details_screen.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    required this.doctor,
    super.key,
  });

  final User doctor;

  @override
  Widget build(BuildContext context) {
    String finalPosition = '5 km';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsRootScreen(
              doctor: doctor,
            ),
          ),
        );
      },
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
                doctor.img,
                height: 80,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "${doctor.firstName} ${doctor.lastName}",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              doctor.speciality,
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
            ),
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
                      //   doctor.stars.toString(),
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
