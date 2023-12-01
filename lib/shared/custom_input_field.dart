import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    required this.hintText,
    required this.icon,
    required this.isHidden,
    required this.validator,
    required this.isDate,
    super.key,
  });

  final IconData icon;
  final String hintText;
  bool isHidden;

  final bool isDate;
  final String? Function(String?) validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextField(
        onChanged: (value) => setState(() {
          _errorText = widget.validator(value);
        }),
        controller: _controller,
        style: GoogleFonts.poppins(),
        obscureText: widget.isHidden,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
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
            borderSide: BorderSide(color: primarygreen.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorText: _errorText,
          // suffixIcon: widget.isHidden
          //     ? InkWell(
          //         onTap: () {
          //           setState(() {
          //             widget.isHidden = !widget.isHidden;
          //           });
          //         },
          //         child: Icon(
          //           widget.isHidden ? Icons.visibility : Icons.visibility_off,
          //           color: primarygreen,
          //         ),
          //       )
          //     : null,
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
      children: widget.radioItems
          .map(
            (item) => Row(
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
                Text(item.text),
              ],
            ),
          )
          .toList(),
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
