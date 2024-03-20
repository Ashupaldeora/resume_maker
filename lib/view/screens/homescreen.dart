import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/utils/icons.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ResumeX",
                    style: GoogleFonts.pacifico(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500)),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/save-instagram.png',
                          height: 25,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/giftbox.png',
                          height: 25,
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/resume');
        },
        child: Container(
            height: 60,
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
                      color: Colors.grey, offset: Offset(0, 7), blurRadius: 10)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/new-document.png',
                  color: Colors.white,
                  height: 25,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Add",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ],
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 2))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                icons.length,
                (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          click_bottomNavigation = index;
                        });
                      },
                      child: Icon(
                        icons[index]['icon'],
                        color: (click_bottomNavigation == index)
                            ? const Color(0xffFF6F6E)
                            : Colors.grey,
                      ),
                    ),
                    Text(
                      icons[index]['name'],
                      style: GoogleFonts.lato(
                          color: (click_bottomNavigation == index)
                              ? const Color(0xffFF6F6E)
                              : Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

int click_bottomNavigation = 0;
