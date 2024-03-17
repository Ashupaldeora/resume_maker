import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class certification extends StatefulWidget {
  const certification({super.key});

  @override
  State<certification> createState() => _certificationState();
}

class _certificationState extends State<certification> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "CERTIFICATION NAME",
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
            "ISSUING ORGANIZATION",
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
            "ISSUED DATE",
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
              keyboardType: TextInputType.datetime,
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
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 7),
                          blurRadius: 10)
                    ]),
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
