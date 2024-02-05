import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class ResearchMap extends StatefulWidget {
  const ResearchMap({super.key});

  @override
  State<ResearchMap> createState() => _ResearchMapState();
}

class _ResearchMapState extends State<ResearchMap> {
  final _positionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recherche sur la map",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Indiquez votre position sur la map ou entrez un lieu",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: "Ex : Playce Palmeraie",
              icon: Icons.map,
              isHidden: false,
              validator: (value) {},
              isDate: false,
              controller: _positionTextController,
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Image.asset('assets/images/map_sample.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
