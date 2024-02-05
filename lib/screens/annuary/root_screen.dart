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
                    child: CustomTextField(
                      controller: _searchTextController,
                      hintText: "Recherchez un hopital ou une pharmacie",
                      icon: Icons.search,
                      isHidden: false,
                      isDate: false,
                      validator: (value) {
                        if ((value ?? '').length < 3) {
                          return 'Le texte de recherche doit avoir au moins 3 caractères';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _searchInstance,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: primarygreen,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
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
