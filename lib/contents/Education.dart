import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/contents/personal.dart';
import 'package:resume_maker/utils/variables.dart';

class education extends StatefulWidget {
  const education({super.key});

  @override
  State<education> createState() => _educationState();
}

GlobalKey educationKey = GlobalKey();

class _educationState extends State<education> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: educationKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 3), blurRadius: 3)
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "hi",
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Text(
                        "helo",
                        style: GoogleFonts.lato(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            Text(
                              "Delete",
                              style: GoogleFonts.lato(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "hi",
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Text(
                        "helo",
                        style: GoogleFonts.lato(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                            Text(
                              "Edit",
                              style: GoogleFonts.lato(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
          )
        ],

        // children: [
        //   Text(
        //     "COURSE / DEGREE",
        //     style: GoogleFonts.lato(
        //         color: Colors.grey.shade600,
        //         fontWeight: FontWeight.w500,
        //         fontSize: 15),
        //   ),
        //   const SizedBox(
        //     height: 10,
        //   ),
        //   Container(
        //     height: 55,
        //     child: TextFormField(
        //       controller: skillsControllerHandlerList![0]['course'],
        //       onTapOutside: (event) {
        //         FocusManager.instance.primaryFocus!.unfocus();
        //       },
        //       decoration: InputDecoration(
        //           enabledBorder: OutlineInputBorder(
        //               borderSide: BorderSide(color: Colors.grey.shade400)),
        //           focusedBorder: const OutlineInputBorder(
        //               borderSide: BorderSide(color: Color(0xffFF6F6E)))),
        //     ),
        //   ),
        //   const SizedBox(
        //     height: 20,
        //   ),
        //   Text(
        //     "SCHOOL / COLLEGE / UNIVERSITY",
        //     style: GoogleFonts.lato(
        //         color: Colors.grey.shade600,
        //         fontWeight: FontWeight.w500,
        //         fontSize: 15),
        //   ),
        //   const SizedBox(
        //     height: 10,
        //   ),
        //   Container(
        //     height: 55,
        //     child: TextFormField(
        //       controller: skillsControllerHandlerList![0]['school'],
        //       onTapOutside: (event) {
        //         FocusManager.instance.primaryFocus!.unfocus();
        //       },
        //       decoration: InputDecoration(
        //         enabledBorder: OutlineInputBorder(
        //             borderSide: BorderSide(color: Colors.grey.shade400)),
        //         focusedBorder: const OutlineInputBorder(
        //           borderSide: BorderSide(color: Color(0xffFF6F6E)),
        //         ),
        //         // hintText: "https://example.com",
        //         // hintStyle: GoogleFonts.lato(
        //         //     color: Colors.grey.shade400,
        //         //     fontWeight: FontWeight.w400)
        //         errorBorder: const OutlineInputBorder(
        //             borderSide: BorderSide(color: Colors.red)),
        //       ),
        //     ),
        //   ),
        //   const SizedBox(
        //     height: 20,
        //   ),
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         "EDUCATION PERIOD",
        //         style: GoogleFonts.lato(
        //             color: Colors.grey.shade600,
        //             fontWeight: FontWeight.w500,
        //             fontSize: 15,
        //             letterSpacing: -0.5),
        //       ),
        //       Row(
        //         children: [
        //           Checkbox(
        //             side: BorderSide(color: Colors.grey.shade600, width: 2),
        //             activeColor: const Color(0xffFF6F6E),
        //             value: presentlyStudying,
        //             onChanged: (value) {
        //               setState(() {
        //                 presentlyStudying = value!;
        //               });
        //             },
        //           ),
        //           Text(
        //             "Presently Studying",
        //             style: GoogleFonts.lato(
        //                 color: Colors.grey.shade600,
        //                 fontWeight: FontWeight.w500,
        //                 fontSize: 15,
        //                 letterSpacing: -0.5),
        //           ),
        //         ],
        //       )
        //     ],
        //   ),
        //   const SizedBox(
        //     height: 10,
        //   ),
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             "START",
        //             style: GoogleFonts.lato(
        //                 color: Colors.grey.shade600,
        //                 fontWeight: FontWeight.w500,
        //                 fontSize: 15),
        //           ),
        //           const SizedBox(
        //             height: 10,
        //           ),
        //           Container(
        //             height: 55,
        //             width: 165,
        //             child: TextFormField(
        //               controller: skillsControllerHandlerList![0]['startYear'],
        //               keyboardType: TextInputType.datetime,
        //               onTapOutside: (event) {
        //                 FocusManager.instance.primaryFocus!.unfocus();
        //               },
        //               decoration: InputDecoration(
        //                 enabledBorder: OutlineInputBorder(
        //                     borderSide:
        //                         BorderSide(color: Colors.grey.shade400)),
        //                 focusedBorder: const OutlineInputBorder(
        //                   borderSide: BorderSide(color: Color(0xffFF6F6E)),
        //                 ),
        //                 errorBorder: const OutlineInputBorder(
        //                     borderSide: BorderSide(color: Colors.red)),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Text(
        //             "END",
        //             style: GoogleFonts.lato(
        //                 color: Colors.grey.shade600,
        //                 fontWeight: FontWeight.w500,
        //                 fontSize: 15),
        //           ),
        //           const SizedBox(
        //             height: 10,
        //           ),
        //           Container(
        //             height: 55,
        //             width: 165,
        //             child: TextFormField(
        //               controller: skillsControllerHandlerList![0]['endYear'],
        //               keyboardType: TextInputType.datetime,
        //               onTapOutside: (event) {
        //                 FocusManager.instance.primaryFocus!.unfocus();
        //               },
        //               decoration: InputDecoration(
        //                 enabledBorder: OutlineInputBorder(
        //                     borderSide:
        //                         BorderSide(color: Colors.grey.shade400)),
        //                 focusedBorder: const OutlineInputBorder(
        //                   borderSide: BorderSide(color: Color(0xffFF6F6E)),
        //                 ),
        //                 errorBorder: const OutlineInputBorder(
        //                     borderSide: BorderSide(color: Colors.red)),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        //   const SizedBox(
        //     height: 30,
        //   ),
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Container(
        //         height: 50,
        //         width: 120,
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //             color: Colors.orange,
        //             borderRadius: BorderRadius.circular(50),
        //             gradient: const LinearGradient(
        //                 begin: Alignment.topLeft,
        //                 end: Alignment.bottomRight,
        //                 colors: [
        //                   Color(0xffFF6F6E),
        //                   Color(0xffFFAF70),
        //                 ]),
        //             boxShadow: [
        //               BoxShadow(
        //                   color: Colors.grey,
        //                   offset: Offset(0, 7),
        //                   blurRadius: 10)
        //             ]),
        //         child: Text(
        //           "Add",
        //           style: GoogleFonts.lato(
        //               color: Colors.white,
        //               fontWeight: FontWeight.w500,
        //               fontSize: 18),
        //         ),
        //       )
        //     ],
        //   )
        // ],
      ),
    );
  }
}
