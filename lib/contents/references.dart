import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class reference extends StatefulWidget {
  const reference({super.key});

  @override
  State<reference> createState() => _referenceState();
}

class _referenceState extends State<reference> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "REFERENCE NAME",
            style: GoogleFonts.lato(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            child: TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFF6F6E)))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "REFERENCE DESIGNATION",
            style: GoogleFonts.lato(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            child: TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF6F6E)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "REFERENCE EMAIL ID",
            style: GoogleFonts.lato(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF6F6E)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "REFERENCE PHONE",
            style: GoogleFonts.lato(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF6F6E)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "DETAILS (OPTIONAL)",
            style: GoogleFonts.lato(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 110,
            child: TextFormField(
              maxLines: 5,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF6F6E)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
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
                ),
                child: Text(
                  "SAVE",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
