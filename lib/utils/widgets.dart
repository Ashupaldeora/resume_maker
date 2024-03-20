import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container addButton(String text) {
  return Container(
    height: 50,
    width: 120,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffFF6F6E),
              Color(0xffFFAF70),
            ]),
        boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(0, 7), blurRadius: 10)
        ]),
    child: Text(
      text,
      style: GoogleFonts.lato(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
    ),
  );
}

Container cancelButton() {
  return Container(
    height: 50,
    width: 120,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Text(
      "Cancel",
      style: GoogleFonts.lato(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    ),
  );
}

Container editButton() {
  return Container(
    padding: const EdgeInsets.all(5),
    height: 35,
    width: 100,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(50)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.edit,
          color: Colors.green,
          size: 15,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          "EDIT",
          style: GoogleFonts.lato(
              color: Colors.green, fontWeight: FontWeight.w700, fontSize: 10),
        ),
      ],
    ),
  );
}

Container deleteButton() {
  return Container(
    height: 35,
    width: 100,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(50)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.delete,
          color: Colors.red,
          size: 15,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          "DELETE",
          style: GoogleFonts.lato(
              color: Colors.red, fontWeight: FontWeight.w700, fontSize: 10),
        ),
      ],
    ),
  );
}
