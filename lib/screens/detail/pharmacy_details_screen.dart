import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/instance.dart';

class PharmacyDetailsScreen extends StatelessWidget {
  const PharmacyDetailsScreen({super.key, required this.pharmacy});

  final Instance pharmacy;

  @override
  Widget build(BuildContext context) {
    double coverHeight = 200;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      pharmacy.img,
                      fit: BoxFit.cover,
                      height: coverHeight,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: coverHeight - (coverHeight * 0.3),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage(pharmacy.img),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            pharmacy.name,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          // Text(
                          //   pharmacy.position.lat,
                          //   style: GoogleFonts.poppins(
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 16,
                          //     color: Colors.grey,
                          //   ),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.star,
                                color: primarygreen,
                                size: 18,
                              ),
                              // Text(
                              //   pharmacy.stars.toString(),
                              //   style: GoogleFonts.poppins(
                              //     color: primarygreen,
                              //     fontSize: 14,
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Text(
                          //   pharmacy.isGuard ? "De garde" : "Pas de garde",
                          //   style: GoogleFonts.poppins(
                          //       color: pharmacy.isGuard
                          //           ? primarygreen
                          //           : Colors.red.withOpacity(0.5),
                          //       fontSize: 12),
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Description",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   pharmacy.description,
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.w300,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 20,
                      children: [
                        PharmacyContactWidget(
                            contactFunction: () {}, icon: Icons.email),
                        PharmacyContactWidget(
                            contactFunction: () {}, icon: Icons.phone),
                        PharmacyContactWidget(
                            contactFunction: () {}, icon: Icons.location_on),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PharmacyContactWidget extends StatelessWidget {
  const PharmacyContactWidget({
    required this.contactFunction,
    required this.icon,
    super.key,
  });

  final void Function() contactFunction;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          color: primarygreen,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
