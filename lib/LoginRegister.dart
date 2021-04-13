// import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_quiz_app/Services/SharedPref.dart';
// import 'package:flutter_quiz_app/Services/UserService.dart';
// import 'package:flutter_quiz_app/screens/Home/home_page.dart';
// import 'package:flutter_quiz_app/screens/button.dart';
// import 'package:sizer/sizer.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_quiz_app/const.dart';
// import 'package:toast/toast.dart';

// class LoginRegisterScreen extends StatefulWidget {
//   @override
//   _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
// }

// class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
//   double tw, th;
//   ConfirmationResult confirmationResult;
//   bool otpSent = false;
//   int otpValid = -1;
//   bool confirmProgress = false;
//   bool enableNumberEdit = true;
//   bool submitProgress = false;
//   String uid;
//   TextEditingController fname = new TextEditingController();
//   TextEditingController lname = new TextEditingController();
//   TextEditingController email = new TextEditingController();
//   TextEditingController code = new TextEditingController();
//   TextEditingController phone = new TextEditingController();
//   UserService us = new UserService();

//   void sendOTP() async {
//     try {
//       confirmationResult = await us.sendOtp(phone.text);
//       setState(() {
//         otpSent = true;
//       });
//     } catch (e) {
//       print('sign in failed $e');
//     }
//   }

//   void confirmOTP() async {
//     try {
//       UserCredential userCredential =
//           await us.confirmOtp(code.text, confirmationResult);

//       if (userCredential.user.uid != null) {
//         uid = userCredential.user.uid;
//         setState(() {
//           otpValid = 1;
//           otpSent = false;
//           enableNumberEdit = false;
//         });
//       } else {
//         Toast.show("All fields required !", context,
//             duration: Toast.LENGTH_SHORT,
//             gravity: Toast.BOTTOM,
//             textColor: Colors.white,
//             backgroundColor: Colors.deepOrange);
//       }
//     } catch (e) {
//       print("error occur  in code confirm $e");
//       Toast.show("Entered otp is invalid!", context,
//           duration: Toast.LENGTH_SHORT,
//           gravity: Toast.BOTTOM,
//           textColor: Colors.white,
//           backgroundColor: Colors.deepOrange);
//     }
//   }

//   Future<void> submit() async {
//     if (email.text.isEmpty || fname.text.isEmpty || lname.text.isEmpty) {
//       Toast.show("All fields required !", context,
//           duration: Toast.LENGTH_SHORT,
//           gravity: Toast.BOTTOM,
//           textColor: Colors.white,
//           backgroundColor: Colors.deepOrange);
//       return;
//     }
//     setState(() {
//       submitProgress = true;
//     });
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     String token = await messaging.getToken(
//       vapidKey:
//           "BDmonxttCiTBvhIIJznJjy-1jTevx1IGenVI9rOVFX-g718Ihg9NS6MrtTyE_LhYrnST_JLqbpIH5p0MzPCjd2k",
//     );
//     try {
//       var dio = Dio();
//       var response =
//           await dio.post('http://35.237.33.104:80/api/v1/user', data: {
//         "appVersion": "0.1",
//         "phone": phone.text,
//         "firstName": fname.text,
//         "lastName": lname.text,
//         "email": email.text,
//         "googleKey": uid,
//         "fireBaseKey": token
//       });
//       print("resonpne is $response");
//       Map<String, dynamic> res = jsonDecode(response.toString());
//       SharedPref sharedPref = new SharedPref();
//       await sharedPref.remove('user');
//       await sharedPref.save("user", res);
//       Map<String, dynamic> u = await sharedPref.read('user');
//       print("token = ${u['token']}");
//       setState(() {
//         submitProgress = false;
//       });
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );
//     } catch (e) {
//       print("got error submitting form i.e $e");
//       Toast.show("Failed to register!", context,
//           duration: Toast.LENGTH_SHORT,
//           gravity: Toast.BOTTOM,
//           textColor: Colors.white,
//           backgroundColor: Colors.deepOrange);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     tw = MediaQuery.of(context).size.width;
//     th = MediaQuery.of(context).size.height;

//     return Dialog(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: kBeigeColor,
//         ),
//         width: .55 * tw,
//         height: .4 * tw,
//         child: Row(
//           children: [
//             Container(
//               width: 30.0.w,
//               height: 50.0.w,
//               decoration: BoxDecoration(),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Image(
//                   image: AssetImage('assets/images/congrats.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: tw * 0.15,
//                       height: 50,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 8.0, horizontal: 20.0),
//                         child: Container(
//                           child: TextField(
//                             controller: fname,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintStyle: TextStyle(color: Colors.black),
//                               prefixIcon: Padding(
//                                 padding: const EdgeInsets.only(left: 0.0),
//                                 child: Icon(
//                                   Icons.person_outline_sharp,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               // contentPadding: EdgeInsets.only(left: 0.0),

//                               hintText: 'First Name',
//                               //labelText: 'Email',
//                               //border: UnderlineInputBorder(),
//                             ),
//                             textAlign: TextAlign.left,
//                             style: TextStyle(fontSize: 16.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     SizedBox(
//                       width: tw * 0.15,
//                       height: 50,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 8.0, horizontal: 20.0),
//                         child: Container(
//                           child: TextField(
//                             controller: lname,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintStyle: TextStyle(color: Colors.black),
//                               prefixIcon: Padding(
//                                 padding: const EdgeInsets.only(left: 0.0),
//                                 child: Icon(
//                                   Icons.person_outline_sharp,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               // contentPadding: EdgeInsets.only(left: 0.0),

//                               hintText: 'Last Name',
//                               //labelText: 'Email',
//                               //border: UnderlineInputBorder(),
//                             ),
//                             textAlign: TextAlign.left,
//                             style: TextStyle(fontSize: 16.0),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: tw * 0.15,
//                       height: 50,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 8.0, horizontal: 20.0),
//                         child: Container(
//                           child: TextField(
//                             controller: phone,
//                             enabled: enableNumberEdit,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintStyle: TextStyle(color: Colors.black),
//                               prefixIcon: Padding(
//                                 padding: const EdgeInsets.only(left: 0.0),
//                                 child: Icon(
//                                   Icons.phone,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               // contentPadding: EdgeInsets.only(left: 0.0),

//                               hintText: 'Phone number',
//                               //labelText: 'Email',
//                               //border: UnderlineInputBorder(),
//                             ),
//                             textAlign: TextAlign.left,
//                             style: TextStyle(fontSize: 16.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                     !otpSent && otpValid == -1
//                         ? InkWell(
//                             onTap: () {
//                               sendOTP();
//                             },
//                             child: SizedBox(
//                               width: 20,
//                               child: Icon(
//                                 Icons.arrow_forward,
//                                 size: 25,
//                                 color: Colors.green,
//                               ),
//                             ),
//                           )
//                         : Container(),
//                     otpSent
//                         ? SizedBox(
//                             width: tw * 0.11,
//                             height: 50,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 8.0, horizontal: 20.0),
//                               child: Container(
//                                 child: TextField(
//                                   controller: code,
//                                   keyboardType: TextInputType.number,
//                                   decoration: InputDecoration(
//                                     hintStyle: TextStyle(color: Colors.black),
//                                     prefixIcon: Padding(
//                                       padding: const EdgeInsets.only(left: 0.0),
//                                       child: Icon(
//                                         Icons.code,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     // contentPadding: EdgeInsets.only(left: 0.0),

//                                     hintText: 'code',
//                                     //labelText: 'Email',
//                                     //border: UnderlineInputBorder(),
//                                   ),
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(fontSize: 16.0),
//                                 ),
//                               ),
//                             ),
//                           )
//                         : Container(),
//                     otpSent
//                         ? confirmProgress
//                             ? Container(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                     valueColor:
//                                         new AlwaysStoppedAnimation<Color>(
//                                             Colors.deepOrangeAccent)),
//                               )
//                             : Container(
//                                 margin: EdgeInsets.only(top: 15),
//                                 width: tw * 0.06,
//                                 height: 20,
//                                 child: FlatButton(
//                                   onPressed: () async {
//                                     await confirmOTP();
//                                   },
//                                   child: Text('Confirm',
//                                       style: TextStyle(color: Colors.green)),
//                                   textColor: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                       side: BorderSide(
//                                           color: Colors.green,
//                                           width: 1,
//                                           style: BorderStyle.solid),
//                                       borderRadius: BorderRadius.circular(50)),
//                                 ),
//                               )
//                         : Container(),
//                     otpValid == 1
//                         ? Icon(
//                             Icons.check_circle_outline_outlined,
//                             size: 30,
//                             color: Colors.green,
//                           )
//                         : otpValid == 0
//                             ? Icon(
//                                 Icons.sms_failed_outlined,
//                                 size: 30,
//                                 color: Colors.red,
//                               )
//                             : Container(),
//                     SizedBox(
//                       width: 10,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   width: tw * 0.2,
//                   height: 50,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 8.0, horizontal: 20.0),
//                     child: Container(
//                       child: TextField(
//                         controller: email,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           hintStyle: TextStyle(color: Colors.black),
//                           prefixIcon: Padding(
//                             padding: const EdgeInsets.only(left: 0.0),
//                             child: Icon(
//                               Icons.email_outlined,
//                               color: Colors.black,
//                             ),
//                           ),
//                           // contentPadding: EdgeInsets.only(left: 0.0),

//                           hintText: 'Email',
//                           //labelText: 'Email',
//                           //border: UnderlineInputBorder(),
//                         ),
//                         textAlign: TextAlign.left,
//                         style: TextStyle(fontSize: 16.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 otpSent == false && otpValid == 1
//                     ? !submitProgress
//                         ? SizedBox(
//                             width: tw * .30,
//                             child: Center(
//                               child: FlatButton(
//                                 onPressed: () async {
//                                   await submit();
//                                 },
//                                 child: Text('submit',
//                                     style: TextStyle(color: Colors.blue)),
//                                 textColor: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                         color: Colors.blue,
//                                         width: 1,
//                                         style: BorderStyle.solid),
//                                     borderRadius: BorderRadius.circular(50)),
//                               ),
//                             ),
//                           )
//                         : SizedBox(
//                             width: tw * .30,
//                             child: Center(
//                               child: Container(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                     valueColor:
//                                         new AlwaysStoppedAnimation<Color>(
//                                             Colors.deepOrangeAccent)),
//                               ),
//                             ),
//                           )
//                     : Container()
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
