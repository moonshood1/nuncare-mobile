import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/instance.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/screens/annuary/components/research_map.dart';
import 'package:nuncare/services/annuary_service.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class AnnuaryRootScreen extends StatefulWidget {
  const AnnuaryRootScreen({super.key});

  @override
  State<AnnuaryRootScreen> createState() => _AnnuaryRootScreenState();
}

class _AnnuaryRootScreenState extends State<AnnuaryRootScreen> {
  var annuaryService = AnnuaryService();

  final _searchTextController = TextEditingController();
  var _errorText;

  List<User> doctors = [];
  List<Instance> instances = [];

  void _showMapDialog() async {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const ResearchMap(),
    );
  }

  void _searchInstance() async {
    try {
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
      final response = await annuaryService.searchInstance(
        _searchTextController.text.trim(),
      );

      print(response);
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
                    onPressed: _showMapDialog,
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
                      onSubmitted: (value) => _searchInstance(),
                      controller: _searchTextController,
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        hintText: "Recherchez un hopital ou une pharmacie",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: primarygreen,
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
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
