import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/screens/annuary/doctor_annuary_screen.dart';
import 'package:nuncare/screens/annuary/instance_annuary_screen.dart';
import 'package:nuncare/screens/diary/diary_screen.dart';
import 'package:nuncare/screens/medecines/medecines_screen.dart';
import 'package:nuncare/services/annuary_service.dart';
import 'package:nuncare/services/resource_service.dart';

class AnnuaryRootScreen extends StatefulWidget {
  const AnnuaryRootScreen({super.key});

  @override
  State<AnnuaryRootScreen> createState() => _AnnuaryRootScreenState();
}

class _AnnuaryRootScreenState extends State<AnnuaryRootScreen> {
  var annuaryService = AnnuaryService();
  var resourceService = ResourceService();

  List<User> doctors = [];

  @override
  void initState() {
    getDoctors();
    super.initState();
  }

  void getDoctors() async {
    try {
      List<User> response = await annuaryService.getDoctors();

      setState(() {
        doctors = response;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Annuaire",
        ),
        backgroundColor: primarygreen,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Text(
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 52, 51, 51),
                ),
                "Trouvez les pharmacies , les hopitaux , les médicaments assurés , tous les experts de santé et leurs articles",
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  AnnuaryCard(
                    screenTo: DoctorAnnuaryScreen(
                      filteredDoctors: doctors,
                    ),
                    label: 'Les Docteurs',
                    icon: Icons.people,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const AnnuaryCard(
                    screenTo: InstanceAnnuaryScreen(),
                    label: 'Les hopitaux et pharmacies',
                    icon: Icons.local_hospital,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: <Widget>[
                  AnnuaryCard(
                    screenTo: MedecinesScreen(),
                    label: 'Les Medicaments assurés',
                    icon: Icons.medical_services_outlined,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  AnnuaryCard(
                    screenTo: DiaryScreen(),
                    label: 'Les articles publiés',
                    icon: Icons.folder,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnnuaryCard extends StatelessWidget {
  const AnnuaryCard({
    super.key,
    required this.screenTo,
    required this.label,
    required this.icon,
  });

  final Widget screenTo;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: primarygreen.withOpacity(0.8),
        splashFactory: InkRipple.splashFactory,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => screenTo,
            ),
          );
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: primarygreen,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: const Offset(0, 2),
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
