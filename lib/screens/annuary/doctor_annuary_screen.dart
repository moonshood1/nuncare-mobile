import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/screens/detail/profile_details_screen.dart';
import 'package:nuncare/services/annuary_service.dart';

class DoctorAnnuaryScreen extends StatefulWidget {
  const DoctorAnnuaryScreen({super.key, required this.filteredDoctors});

  final List<User> filteredDoctors;

  @override
  State<DoctorAnnuaryScreen> createState() => _DoctorAnnuaryScreenState();
}

class _DoctorAnnuaryScreenState extends State<DoctorAnnuaryScreen> {
  var annuaryService = AnnuaryService();
  final _searchTextController = TextEditingController();
  var _isLoading = false;

  var _errorText;
  List<User> doctors = [];

  @override
  void initState() {
    doctors = widget.filteredDoctors;
    super.initState();
  }

  void _searchDoctor() async {
    try {
      setState(() {
        _isLoading = true;
      });

      if (_searchTextController.text.trim().length < 3 ||
          _searchTextController.text.trim() == "") {
        setState(() {
          _errorText =
              "Le champ de recherche doit contenir au moins 3 caracteres";
        });
      } else {
        setState(() {
          _errorText = null;
        });
      }
      final response = await annuaryService.searchDoctor(
        _searchTextController.text.trim(),
      );

      setState(() {
        _isLoading = false;
        doctors = response;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        for (final doctor in doctors) UserCardWidget(doctor: doctor),
      ],
    );

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(
          color: primarygreen,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Medecins",
        ),
        backgroundColor: primarygreen,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 52, 51, 51),
                      ),
                      "Trouvez tous les experts de santé",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Center(
                      child: Icon(
                        Icons.location_on,
                        size: 32,
                        color: Color.fromARGB(255, 52, 51, 51),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _searchTextController,
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        hintText: "Entrez le nom d'un docteur",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        suffixIcon: InkWell(
                          onTap: _searchDoctor,
                          child: const Icon(
                            Icons.search,
                            color: primarygreen,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: primarygreen),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: primarygreen),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorText: _errorText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              content
            ],
          ),
        ),
      ),
    );
  }
}

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    required this.doctor,
  });

  final User doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => DetailsRootScreen(doctor: doctor),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(doctor.img), fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Dr ${doctor.lastName}  ${doctor.firstName}",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    doctor.speciality,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    doctor.phone,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
