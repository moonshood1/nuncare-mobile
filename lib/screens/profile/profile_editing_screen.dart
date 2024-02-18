import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/services/user_service.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({super.key, required this.user});

  final User user;

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _orderNumberController = TextEditingController();
  final _medicalCenterController = TextEditingController();
  final _regionController = TextEditingController();
  final _specialityController = TextEditingController();
  final _cityController = TextEditingController();
  final _emailController = TextEditingController();
  var _isLoading = false;

  @override
  void initState() {
    _firstNameController.text = widget.user.firstName;
    _lastNameController.text = widget.user.lastName;
    _phoneController.text = widget.user.phone;
    _orderNumberController.text = widget.user.orderNumber;
    _medicalCenterController.text = widget.user.hospital;
    _regionController.text = widget.user.region;
    _specialityController.text = widget.user.speciality;
    _cityController.text = widget.user.city;
    _emailController.text = widget.user.email;
    super.initState();
  }

  void editProfile() async {
    try {
      setState(() {
        _isLoading = true;
      });
      Map<String, String> userData = {
        'firstName': _firstNameController.text.trim(),
        'lastName': _lastNameController.text.trim(),
        'phoneNumber': _phoneController.text.trim(),
        'orderNumber': _orderNumberController.text.trim(),
        'region': _regionController.text.trim(),
        'city': _cityController.text.trim(),
        'speciality': _specialityController.text.trim(),
        'medialCenter': _medicalCenterController.text.trim(),
        'email': _emailController.text.trim(),
      };

      BasicResponse response = await UserService().editProfile(userData);

      if (!context.mounted) {
        return;
      }

      if (response.success) {
        setState(() {
          _isLoading = false;
        });

        Navigator.of(context).pop(true);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green.shade200,
          content: Text(response.message),
          duration: const Duration(seconds: 4),
        ),
      );

      return;
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade500,
          content: Text(e.toString()),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Modification du profil",
        ),
        backgroundColor: primarygreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 52, 51, 51),
                ),
                "Modifiez les informations que vous souhaitez et validez",
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: _lastNameController,
                hintText: "Nom",
                icon: Icons.person,
                isHidden: false,
                isDate: false,
                validator: (value) {
                  if ((value ?? '').length < 3) {
                    return 'Le nom doit avoir au moins 3 caractères';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _firstNameController,
                hintText: "Prénoms",
                icon: Icons.person,
                isHidden: false,
                isDate: false,
                validator: (value) {
                  if ((value ?? '').length < 3) {
                    return 'Le prénom doit avoir au moins 3 caractères';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _phoneController,
                hintText: "Numéro de téléphone",
                icon: Icons.phone,
                isHidden: false,
                isDate: false,
                validator: (value) {
                  const phonePattern = r'^\+\d{13}$';
                  final regExp = RegExp(phonePattern);
                  if (!regExp.hasMatch(value ?? '')) {
                    return 'Format invalide (Ex: +2250101010101)';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _emailController,
                hintText: "Email",
                icon: Icons.email,
                isDate: false,
                isHidden: false,
                validator: (value) {
                  const emailPattern =
                      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                  final regExp = RegExp(emailPattern);
                  if (!regExp.hasMatch(value ?? '')) {
                    return 'Adresse e-mail invalide';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _orderNumberController,
                hintText: "Numéro d'ordre",
                icon: Icons.file_copy,
                isHidden: false,
                isDate: false,
                maxLength: 5,
                validator: (value) {
                  if (value == '') {
                    return 'Le numéro doit avoir au moins 1 caractères';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _regionController,
                hintText: "Région d'exercice",
                icon: Icons.map,
                isHidden: false,
                isDate: false,
                validator: (value) {
                  if ((value ?? '').length < 3) {
                    return 'Le numéro doit avoir au moins 3 caractères';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _cityController,
                hintText: "Ville d'exercice",
                icon: Icons.location_city,
                isHidden: false,
                isDate: false,
                validator: (value) {
                  if ((value ?? '').length < 3) {
                    return 'La ville doit avoir au moins 3 caractères';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _medicalCenterController,
                hintText: "Centre de santé d'exercice",
                icon: Icons.medical_services,
                isHidden: false,
                isDate: false,
                validator: (value) {
                  if ((value ?? '').length < 3) {
                    return 'Le centre de santé doit avoir au moins 3 caractères';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _specialityController,
                hintText: "Spécialité",
                icon: Icons.file_copy,
                isHidden: false,
                isDate: false,
                validator: (value) {
                  if ((value ?? '').length < 5) {
                    return 'La specialité doit avoir au moins 5 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: _isLoading ? null : editProfile,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primarygreen,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  "Modifier",
                  style: GoogleFonts.poppins(fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
