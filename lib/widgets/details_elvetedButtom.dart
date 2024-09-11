import 'package:flutter/material.dart';

class DetailsCustomElvetedButtom extends StatelessWidget {
  DetailsCustomElvetedButtom({
    super.key,
    required this.sizeText,
    required this.isSelected,
    required this.onPressed,
  });
  final String sizeText;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(173, 29, 27, 27),
          fixedSize: const Size(110, 20),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            side: isSelected
                ? const BorderSide(color: Color.fromARGB(255, 212, 108, 22))
                : BorderSide.none,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          sizeText,
          style: const TextStyle(
              color: Color.fromARGB(255, 182, 177, 177), fontSize: 17),
        ),
      ),
    );
  }
}
