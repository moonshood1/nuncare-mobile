import 'package:flutter/material.dart';
import 'package:nuncare/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/data/doctors.dart';
import 'package:nuncare/data/pharmacies.dart';
import 'package:nuncare/screens/home/components/pharmacy_card.dart';
import 'package:nuncare/screens/home/components/profile_card.dart';

class AnnuaryRootScreen extends StatefulWidget {
  const AnnuaryRootScreen({super.key});

  @override
  State<AnnuaryRootScreen> createState() => _AnnuaryRootScreenState();
}

class _AnnuaryRootScreenState extends State<AnnuaryRootScreen> {
  int _selectedIndex = 0;

  void updateCategory(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              _selectedIndex == 0 ? "Docteurs" : "Pharmacies",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            AnnuaryCategory(updateCategory: updateCategory),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class AnnuaryCategory extends StatefulWidget {
  const AnnuaryCategory({
    super.key,
    required this.updateCategory,
  });

  final Function(int) updateCategory;

  @override
  State<AnnuaryCategory> createState() => _AnnuaryCategoryState();
}

class _AnnuaryCategoryState extends State<AnnuaryCategory> {
  final List<String> categories = [
    "assets/icons/doctor_icon.png",
    "assets/icons/pharmacy_icon.png",
    "assets/icons/medicine_icon.png",
  ];

  int _selectedIndex = 0;

  void setCurrentIndex(int index) {
    setState(() {
      _selectedIndex = index;
      widget.updateCategory(index);
    });
  }

  final List<List<Widget>> dataDisplayed = [
    doctors
        .map(
          (doctor) => ProfileCard(
            doctor: doctor,
          ),
        )
        .toList(),
    pharmacies
        .map(
          (pharmacy) => PharmacyCard(
            pharmacy: pharmacy,
          ),
        )
        .toList(),
    pharmacies
        .map(
          (pharmacy) => PharmacyCard(
            pharmacy: pharmacy,
          ),
        )
        .toList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              decoration: _selectedIndex == index
                  ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: primarygreen, width: 3),
                      ),
                    )
                  : const BoxDecoration(
                      border: Border(
                        bottom: BorderSide.none,
                      ),
                    ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: ElevatedButton(
                  onPressed: () => setCurrentIndex(index),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(70, 70),
                    backgroundColor: primarygreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    categories[index],
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: dataDisplayed[_selectedIndex],
          ),
        )
      ],
    );
  }
}
