import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/medecine.dart';
import 'package:nuncare/screens/home/components/medoc_card.dart';
import 'package:nuncare/services/resource_service.dart';

class MedecinesScreen extends StatefulWidget {
  const MedecinesScreen({super.key});

  @override
  State<MedecinesScreen> createState() => _MedecinesScreenState();
}

class _MedecinesScreenState extends State<MedecinesScreen> {
  List<Medecine> medecines = [];
  var resourceService = ResourceService();
  var _isLoading = false;

  @override
  void initState() {
    getMedecines();
    super.initState();
  }

  void getMedecines() async {
    try {
      setState(() {
        _isLoading = true;
      });
      List<Medecine> response = await resourceService.getMedecines();

      setState(() {
        _isLoading = false;
        medecines = response;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget contentWidget = Align(
      alignment: Alignment.center,
      child: Text(
        "Aucun médicament assuré",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w200,
        ),
      ),
    );

    if (_isLoading && medecines.isEmpty) {
      contentWidget = const Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: primarygreen,
        ),
      );
    }

    if (medecines.isNotEmpty) {
      contentWidget = ListView.builder(
        itemCount: medecines.length,
        itemBuilder: (BuildContext ctx, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: MedocCard(
            medecine: medecines[index],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarygreen,
        centerTitle: false,
        elevation: 4,
        title: Text(
          "Les médicaments assurés",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: contentWidget,
      ),
    );
  }
}
