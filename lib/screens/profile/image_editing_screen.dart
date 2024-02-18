import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:nuncare/services/user_service.dart';

class ImageEditScreen extends StatefulWidget {
  const ImageEditScreen({super.key});

  @override
  State<ImageEditScreen> createState() => _ImageEditScreenState();
}

class _ImageEditScreenState extends State<ImageEditScreen> {
  File? _selectedImage;
  var _isGallery = false;
  var _isLoading = false;

  void _takePicture() async {
    final imagePicker = ImagePicker();

    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _isGallery = false;
      _selectedImage = File(pickedImage.path);
    });
  }

  void _pickPicture() async {
    final imagePicker = ImagePicker();

    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _isGallery = true;
      _selectedImage = File(pickedImage.path);
    });
  }

  void _uploadPicture() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final url = Uri.parse('https://api.cloudinary.com/v1_1/dhc0siki5/upload');

      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = 'uzbfy5aa'
        ..files.add(
          await http.MultipartFile.fromPath(
            'file',
            _selectedImage!.path,
          ),
        );

      final response = await request.send();

      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      final imgUrl = jsonMap['url'];

      BasicResponse responseApi = await UserService().editProfileImage(imgUrl);

      if (!context.mounted) {
        return;
      }

      if (responseApi.success) {
        setState(() {
          _isLoading = false;
        });

        Navigator.of(context).pop(true);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green.shade200,
          content: Text(responseApi.message),
          duration: const Duration(seconds: 4),
        ),
      );
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

  void _reinitValues() {
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: _takePicture,
          icon: const Icon(
            Icons.camera,
            color: primarygreen,
          ),
          label: Text(
            "Prenez une photo",
            style: GoogleFonts.poppins(
              color: primarygreen,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextButton.icon(
          onPressed: _pickPicture,
          icon: const Icon(
            Icons.camera,
            color: primarygreen,
          ),
          label: Text(
            "Choisissez une image",
            style: GoogleFonts.poppins(
              color: primarygreen,
            ),
          ),
        )
      ],
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _isGallery ? _pickPicture : _takePicture,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Modification de l'image de profil",
        ),
        backgroundColor: primarygreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 52, 51, 51),
                ),
                "Modifiez votre image de profil",
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: primarygreen,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                height: 250,
                width: double.infinity,
                alignment: Alignment.center,
                child: content,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _isLoading ? null : _uploadPicture,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primarygreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      "Enregistrer",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: _reinitValues,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red.shade300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      "Réinitialiser",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
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
