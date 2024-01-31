import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    required this.hintText,
    required this.icon,
    required this.isHidden,
    required this.validator,
    required this.isDate,
    required this.controller,
    this.maxLength,
    this.maxLines,
    super.key,
  });

  final IconData icon;
  final String hintText;
  final bool isHidden;
  int? maxLength;
  int? maxLines;

  final bool isDate;
  final String? Function(String?) validator;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextField(
        onChanged: (value) => setState(() {
          _errorText = widget.validator(value);
        }),
        controller: widget.controller,
        style: GoogleFonts.poppins(),
        obscureText: widget.isHidden,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines ?? 1,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          prefixIcon: Icon(
            widget.icon,
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
    );
  }
}

class CustomRadioItem {
  final String text;
  final String value;

  CustomRadioItem({required this.text, required this.value});
}

class CustomRadioGroup extends StatefulWidget {
  final List<CustomRadioItem> radioItems;
  final ValueChanged<String> onChanged;

  const CustomRadioGroup({
    Key? key,
    required this.radioItems,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomRadioGroup> createState() => _CustomRadioGroupState();
}

class _CustomRadioGroupState extends State<CustomRadioGroup> {
  String _selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final item in widget.radioItems)
          Row(
            children: [
              Radio<String>(
                value: item.value,
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    _selectedValue = value!;
                    widget.onChanged(_selectedValue);
                  });
                },
              ),
              Text(
                item.text,
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
      ],
    );
  }
}

class CustomSelectField extends StatefulWidget {
  const CustomSelectField(
      {super.key,
      required this.selectedValue,
      required this.items,
      required this.hintText});

  final String hintText, selectedValue;

  final List<String> items;

  @override
  State<CustomSelectField> createState() => _CustomSelectFieldState();
}

class _CustomSelectFieldState extends State<CustomSelectField> {
  @override
  Widget build(BuildContext context) {
    String selectedValue = widget.selectedValue;
    List<String> items = widget.items;
    String hintText = widget.hintText;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primarygreen, width: 0.7),
      ),
      child: DropdownButton<String>(
        style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
        isExpanded: true,
        focusColor: primarygreen,
        underline: const SizedBox(),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: primarygreen,
        ),
        hint: Text(hintText),
        value: selectedValue,
        items: items
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
      ),
    );
  }
}
