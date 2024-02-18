import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/instance.dart';
import 'package:nuncare/services/annuary_service.dart';

class InstanceAnnuaryScreen extends StatefulWidget {
  const InstanceAnnuaryScreen({super.key});

  @override
  State<InstanceAnnuaryScreen> createState() => _InstanceAnnuaryScreenState();
}

class _InstanceAnnuaryScreenState extends State<InstanceAnnuaryScreen> {
  var annuaryService = AnnuaryService();
  final _searchTextController = TextEditingController();

  var _errorText;
  List<Instance> instances = [];

  void _searchInstance() async {
    try {
      print('Appel de la fonction de recherche');

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
          "Pharmacies et Hopitaux",
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
                      "Trouvez les pharmacies et les hopitaux",
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
                      onSubmitted: (value) => () {},
                      controller: _searchTextController,
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        hintText:
                            "Entrez le nom d'une pharmacie ou d'un hopital...",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        suffixIcon: InkWell(
                          onTap: _searchInstance,
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
            ],
          ),
        ),
      ),
    );
  }
}
