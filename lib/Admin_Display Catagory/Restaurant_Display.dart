import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app_nileswaram_test/Main_Files/Admin_HomPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'Restaurant_Detail.dart';
// import 'Textile_Detail.dart';


class Display_Restaurant_Data extends StatefulWidget {
  @override
  _Display_Restaurant_DataState createState() => new _Display_Restaurant_DataState();
}

class _Display_Restaurant_DataState extends State<Display_Restaurant_Data> {
//Applying get request.

  Future<List> getData() async {
    final response = await http.get(Uri.parse( "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Main_Restaurant_Display.php"));
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink.shade800,
          title: Text(
            "Restaurant",
            style: GoogleFonts.prompt(fontSize: 22),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          // padding: EdgeInsets.all(16.0),
          child: new FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? new ItemList(
                // list: snapshot.data,
                list: snapshot.data??[],
              )
                  : new Center(
                child: new CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () =>
                Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new Restaurant_Detail(list: list, index: i,)
                    )
                ),

            child:  ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red.shade900),
                    image: DecorationImage(
                      image: NetworkImage(list[i]['image']),
                    ),
                  ),
                ),
                title: Text(
                  list[i]['name'],
                  style: GoogleFonts.lora(
                      fontSize: 20, color: Colors.pink.shade700),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return Restaurant_Detail(list: list, index: i,);
                      }));
                }
            ),
          ),
        );
      },
    );

  }
}
















// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:open_mail_app/open_mail_app.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:maps_launcher/maps_launcher.dart';
//
//
//
//
// //Creating a class user to store the data;
// class User {
//   // final String id;
//   final String name;
//   final String address;
//   final String phone;
//   final String mobile;
//   final String watsap;
//   final String email;
//   final String website;
//   final String insta;
//   final String facebook;
//   final String blood;
//   final String other_pro;
//   final String image;
//
//   User({
//     // required this.id,
//     required this.name,
//     required this.address,
//     required this.phone,
//     required this.mobile,
//     required this.watsap,
//     required this.email,
//     required this.website,
//     required this.insta,
//     required this.facebook,
//     required this.blood,
//     required this.other_pro,
//     required this.image,
//   });
// }
//
//
//
// class Display_Textile_Data extends StatefulWidget {
//   @override
//   _Display_Textile_DataState createState() => _Display_Textile_DataState();
// }
//
// class _Display_Textile_DataState extends State<Display_Textile_Data> {
//
//
// //Applying get request.
//
//   Future<List<User>> getRequest() async {
//     //replace your restFull API here.
//     String url =
//     //"https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Catagory_Display/Textile/textiledisplayoriginal.php";
//         "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Main_Textile_Display.php";
//
//     final response = await http.get(Uri.parse(url));
//
//     var responseData = json.decode(response.body);
//
//     //Creating a list to store input data;
//     List<User> users = [];
//     for (var singleUser in responseData) {
//       User user = User(
//         //id:  singleUser["id"].toString(),
//         name: singleUser["name"].toString(),
//         address: singleUser["address"].toString(),
//         phone: singleUser["phone"].toString(),
//         mobile: singleUser["mobile"].toString(),
//         blood: singleUser["blood"].toString(),
//         insta: singleUser["insta"].toString(),
//         website: singleUser["website"].toString(),
//         facebook: singleUser["facebook"].toString(),
//         email: singleUser["email"].toString(),
//         watsap: singleUser["watsap"].toString(),
//         other_pro: singleUser["other_pro"].toString(),
//         image: singleUser["image"].toString(),
//       );
//
//       //Adding user to the list.
//       users.add(user);
//     }
//     return users;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.pink.shade800,
//           title: Text(
//             "Textile Shops",
//             style: GoogleFonts.prompt(fontSize: 22),
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_rounded),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(16.0),
//           child: FutureBuilder(
//             future: getRequest(),
//             builder: (BuildContext ctx, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return Container(
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircularProgressIndicator(
//                           color: Colors.red.shade900,
//                           strokeWidth: 5,
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Text(
//                           "Data Loading Please Wait!",
//                           style: TextStyle(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               } else {
//                 return ListView.builder(
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (ctx, index) =>
//                         SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.all(10),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 8),
//                                 decoration: BoxDecoration(
//                                   // border: Border.all(color: Colors.blueAccent),
//                                   color: Colors.blueGrey.shade100,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 height:
//                                 MediaQuery
//                                     .of(context)
//                                     .size
//                                     .height / 1.5,
//                                 width: MediaQuery
//                                     .of(context)
//                                     .size
//                                     .width / 1,
//                                 child: SingleChildScrollView(
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                         snapshot.data[index].name,
//                                         style: GoogleFonts.lora(
//                                             fontSize: 25,
//                                             color: Colors.pink.shade700),
//                                       ),
//                                       SizedBox(height: 10,),
//                                       Container(
//                                         height: 100,
//                                         //  width: 300,
//                                         width: MediaQuery.of(context).size.width/1.4,
//                                         decoration: BoxDecoration(
//                                           border: Border.all(color: Colors.red.shade900),
//                                           borderRadius: BorderRadius.circular(15),
//                                           image: DecorationImage(
//                                             image: NetworkImage(snapshot.data[index].image),
//                                             fit: BoxFit.fill,
//                                           ),
//
//                                         ),
//                                       ),
//                                       // Text(
//                                       //   snapshot.data[index].name,
//                                       //   style: GoogleFonts.lora(
//                                       //       fontSize: 25,
//                                       //       color: Colors.pink.shade700),
//                                       // ),
//                                       Text(
//                                         snapshot.data[index].address,
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 6,
//                                         style: GoogleFonts.prompt(
//                                             color: Colors.deepOrange.shade400,
//                                             fontSize: 13),
//                                       ),
//                                       SizedBox(height: 15,),
//                                       Row(
//                                         children: [
//                                           GestureDetector(
//                                             onTap: () async => !await launch('sms:' + snapshot.data[index].phone),
//                                             child: Image.asset(
//                                               "assets/tele.png",
//                                               height: 30,
//                                               width: 20,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//                                           GestureDetector(
//                                               onTap: () async => !await launch('sms:' + snapshot.data[index].phone),
//                                               child: Text(
//                                                   snapshot.data[index].phone)),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           GestureDetector(
//                                             // onTap: _launchPhone,
//                                             child: Image.asset(
//                                               "assets/mobile.png",
//                                               height: 30,
//                                               width: 20,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//                                           GestureDetector(
//                                               onTap: () async => !await launch('sms:' + snapshot.data[index].mobile),
//                                               child: Text(
//                                                   snapshot.data[index].mobile)),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           Image.asset(
//                                             "assets/internet.png",
//                                             height: 20,
//                                             width: 18,
//                                           ),
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//                                           Text(
//                                             snapshot.data[index].website,
//                                             style: GoogleFonts.prompt(
//                                               fontSize: 15,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           Image.asset(
//                                             "assets/email.png",
//                                             height: 20,
//                                             width: 18,
//                                           ),
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//                                           GestureDetector(
//                                             onTap: ()async {
//                                               var result = await OpenMailApp.openMailApp();
//                                               if (!result.didOpen && !result.canOpen) {
//                                                 showNoMailAppsDialog(context);
//                                               } else if (!result.didOpen && result.canOpen) {
//                                                 showDialog(
//                                                   context: context,
//                                                   builder: (_) {
//                                                     return MailAppPickerDialog(
//                                                       mailApps: result.options,
//                                                     );
//                                                   },
//                                                 );
//                                               }
//                                             },
//
//
//                                             child: Text(
//                                               snapshot.data[index].email,
//                                               style: GoogleFonts.prompt(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           Image.asset(
//                                             "assets/blood.png",
//                                             height: 30,
//                                             width: 20,
//                                           ),
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//                                           Text("Blood Group:",
//                                             style: GoogleFonts.prompt(),),
//                                           SizedBox(width: 5,),
//                                           Text(snapshot.data[index].blood,
//                                             style: GoogleFonts.prompt(
//                                                 color: Colors.red.shade900),),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 5,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                         children: [
//                                           Column(
//                                             children: [
//                                               GestureDetector(
//                                                 onTap: () async => await launch(
//                                                     "https://wa.me/${snapshot.data[index].watsap}?text=Hello"),
//                                                 child: Image.asset(
//                                                   "assets/watsap.png",
//                                                   height: 50,
//                                                   width: 30,
//                                                 ),
//                                               ),
//                                               // GestureDetector(
//                                               //     onTap: () async => await launch(
//                                               //         "https://wa.me/${snapshot.data[index].watsap}?text=Hello"),
//                                               //  child: Text(snapshot.data[index].watsap)
//                                               // ),
//                                             ],
//                                           ),
//                                           Column(children: [
//                                             GestureDetector(
//                                               onTap: () async => !await launch(snapshot.data[index].facebook),
//                                               //_launchfacebook,
//                                               child: Image.asset(
//                                                 "assets/facebook.png",
//                                                 height: 50,
//                                                 width: 30,
//                                               ),
//                                             ),
//                                             // GestureDetector(
//                                             //      onTap: () async => !await launch(snapshot.data[index].facebook),
//                                             //     //_launchfacebook,
//                                             //     child: Text(snapshot.data[index].facebook)),
//                                           ]),
//                                           Column(children: [
//                                             GestureDetector(
//                                               onTap: () async => !await launch(snapshot.data[index].insta),
//                                               child: Image.asset(
//                                                 "assets/instagram.png",
//                                                 height: 50,
//                                                 width: 30,
//                                               ),
//                                             ),
//                                             // Text(snapshot.data[index].insta),
//                                           ]),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Container(
//                                         alignment: Alignment.center,
//                                         height: 70,
//                                         width: 300,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(
//                                               10), color: Colors.white,),
//                                         child: SingleChildScrollView(
//                                           child: Column(
//                                             children: [
//                                               Text("Other Products:",
//                                                 style: TextStyle(
//                                                     fontSize: 17),),
//                                               Text(
//                                                 snapshot.data[index].other_pro,
//                                                 style: TextStyle(
//                                                     color: Colors.teal.shade400,
//                                                     fontSize: 13),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 10,),
//                                       ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                               primary: Colors.red.shade900,
//                                               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
//                                               textStyle: TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.bold)),
//                                           onPressed: () => MapsLauncher.launchQuery(
//                                               snapshot.data[index].name + snapshot.data[index].address),
//                                           child: Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text('Location'),
//                                               Icon(Icons.location_on_rounded),
//                                             ],
//                                           )
//
//
//                                       ),
//
//                                       // Container(
//                                       //   height: 100,
//                                       // //  width: 300,
//                                       //   width: MediaQuery.of(context).size.width/1.5,
//                                       //   decoration: BoxDecoration(
//                                       //     borderRadius: BorderRadius.circular(15),
//                                       //     image: DecorationImage(
//                                       //       image: NetworkImage(snapshot.data[index].image),
//                                       //       fit: BoxFit.fill,
//                                       //     ),
//                                       //
//                                       // ),
//                                       // ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ));
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   void showNoMailAppsDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Open Mail App"),
//           content: Text("No mail apps installed"),
//           actions: <Widget>[
//             FlatButton(
//               child: Text("OK"),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             )
//           ],
//         );
//       },
//     );
//   }
// }
//
