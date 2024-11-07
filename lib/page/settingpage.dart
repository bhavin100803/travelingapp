import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbuddy/page/Terms&conditionpage.dart';
import 'package:travelbuddy/page/aboutus.dart';
import 'package:travelbuddy/page/login.dart';
import 'package:travelbuddy/page/privacypolicy.dart';
import 'package:travelbuddy/page/savepost.dart';
import 'package:travelbuddy/page/showticket.dart';
import 'package:travelbuddy/thame.dart';
import 'package:travelbuddy/widget/auth.dart';
import 'package:travelbuddy/widget/login_info.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {

  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    var theme = context.watch<UiProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // backgroundColor: Colors.blue.shade200,
        // foregroundColor: Colors.white,
      ),
      body: Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text("Display",style: TextStyle(color: Colors.grey,fontSize: 18),)
                ],
              ),
            ),
            ListTile(
               leading: Icon(Icons.light_mode_outlined),
              title: Text(
                "Dark Mode",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Switch(
                  value: notifier.isDark,
                  onChanged: (value) => theme.changeTheme()),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Text("About",style: TextStyle(fontSize: 18,color: Colors.grey),)
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Termsconditionpage()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.description_outlined,size: 30,),
                          // Image.asset("assets/terms.png",height: 40,),
                          SizedBox(width: 10,),
                          Text(
                            "Terms & Conditons",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Privacypolicy()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.privacy_tip_outlined,size: 30,),
                          SizedBox(width: 10,),
                          Text(
                            "Privacy Policy",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Aboutus()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.info_outline,size: 30,),
                          SizedBox(width: 10,),
                          Text(
                            "About Us",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        signOut();
                        LocalDataSaver.saveLoginData(false);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => Login()));
                      },
                      child: Row(
                        children: [
                         Icon(Icons.power_settings_new,size: 30,),
                          SizedBox(width: 15,),
                          Text(
                            "Log Out",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
            Divider(),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Other",style: TextStyle(fontSize: 18,color: Colors.grey)),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Savepost()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.bookmark_border,size: 30,),
                          SizedBox(width: 10,),
                          Text(
                            "Save post",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>Showticket()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.airplane_ticket_outlined,size: 30,),
                          SizedBox(width: 10,),
                          Text(
                            "Your Ticket",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider()
          ],
        );
      }),
    );
  }
}
