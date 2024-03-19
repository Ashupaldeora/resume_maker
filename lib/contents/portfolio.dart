import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/contents/personal.dart';
import 'package:resume_maker/utils/variables.dart';

class portfolio extends StatefulWidget {
  const portfolio({super.key});

  @override
  State<portfolio> createState() => _portfolioState();
}

GlobalKey portfolioKey = GlobalKey();

class _portfolioState extends State<portfolio> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: portfolioKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LINK TYPE",
              style: GoogleFonts.lato(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 55,
              child: TextFormField(
                controller: resumeController.txtPortfolioLinkType,
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
              "LINK",
              style: GoogleFonts.lato(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 55,
              child: TextFormField(
                controller: resumeController.txtPortfolioLink,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFF6F6E)),
                    ),
                    hintText: "https://example.com",
                    hintStyle: GoogleFonts.lato(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
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
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
