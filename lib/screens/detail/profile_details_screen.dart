import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/data/articles.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/screens/profile/components/article_widget.dart';
import 'package:nuncare/screens/profile/profile_details_screen.dart';

class DetailsRootScreen extends StatelessWidget {
  const DetailsRootScreen({super.key, required this.doctor});

  final User doctor;

  @override
  Widget build(BuildContext context) {
    double coverHeight = 200;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
        backgroundColor: primarygreen,
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
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/cover_2.png",
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
                            backgroundImage: AssetImage(doctor.img),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                Icons.star,
                                color: primarygreen,
                                size: 18,
                              ),
                              // Text(
                              //   doctor.stars.toString(),
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
                          //   doctor.isActive ? "Disponible" : "Indisponible",
                          //   style: GoogleFonts.poppins(
                          //       color: doctor.isActive
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "${doctor.firstName} ${doctor.lastName}",
                              style: GoogleFonts.poppins(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(
                              doctor.speciality,
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${doctor.years.toString()} ans',
                              style: GoogleFonts.poppins(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(
                              "D'expérience",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "A Propos",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      doctor.about,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Articles redigés",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 10,
                        children: <Widget>[
                          ...articles
                              .sublist(0, 2)
                              .map((e) => ProfileArticleCard(article: e))
                              .toList()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      spacing: 20,
                      children: [
                        ProfileContactWidget(
                            contactFunction: () {}, icon: Icons.email),
                        ProfileContactWidget(
                            contactFunction: () {}, icon: Icons.phone),
                        ProfileContactWidget(
                            contactFunction: () {}, icon: Icons.location_on),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileContactWidget extends StatelessWidget {
  const ProfileContactWidget({
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
