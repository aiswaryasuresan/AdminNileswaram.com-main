import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';

class Representative_Detail extends StatelessWidget {
  final passing_data;

  const Representative_Detail(this.passing_data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.pink.shade800,
      //   title: Text(passing_data.name),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            FullScreenWidget(
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2.2,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      passing_data.image,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              //padding: EdgeInsets.symmetric(vertical: 100, horizontal: 25),
              padding: EdgeInsets.only(top: 250),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/7,
                    width: MediaQuery.of(context).size.width/1,
                    decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      //  color: Color(0xB6C33A),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          // padding: EdgeInsets.only(top: 20, right: 150),
                            padding: EdgeInsets.only(
                                right: 30, left: 30, top: 10),
                            child: Text(
                              passing_data.name,
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Padding(
                          // padding: EdgeInsets.only(top: 20, right: 150),
                            padding: EdgeInsets.only(
                                right: 30, left: 30, top: 10),
                            child: Text(
                              passing_data.catagory,
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),



                      ],
                    ),
                  ),
                  SizedBox(height: 40,),

                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 20,
                      ),
                      Container(
                          height: 35,
                          width: 35,
                          child: Icon(
                            Icons.phone,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10))),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 22,
                          ),
                          Container(
                            height: 20,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.pink.shade50,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: GestureDetector(
                                  onTap: () async =>
                                  !await launch('tel:' + passing_data.mobile),
                                  child: Text(
                                    passing_data.mobile,
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink.shade300),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),


                  SizedBox(height: 20,),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 20,
                      ),

                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 100,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.pink.shade50,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                                  passing_data.address,
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink.shade300),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),



                  SizedBox(height: 5,),

                  // Image(
                  //   image: AssetImage('assets/facebook.png')),

                ],
              ),
            ),
          ],
        ),
      ),


    );
  }
}

