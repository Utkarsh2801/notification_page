import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'NotificationModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Notification());
  }
}

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

List<NotificationData> data = [
  NotificationData('New Connection', 'Mohamed Wazil',
      ' wants to connect with you 12th Feb 2021, 08:08 AM'),
  NotificationData('Congratulations!', 'Mohamed Wazil',
      ' awarded you two SVC\'s 12th Feb, 2021 08:08 AM'),
  NotificationData('New Connection', 'Mohamed Wazil',
      ' wants to connect with you 12th Feb 2021, 08:08 AM'),
  NotificationData('New Connection', 'Mohamed Wazil',
      ' wants to connect with you 12th Feb 2021, 08:08 AM'),
  NotificationData('Congratulations!', 'Mohamed Wazil',
      ' awarded you two SVC\'s 12th Feb, 2021 08:08 AM'),
];

class _NotificationState extends State<Notification> {
  Widget getNotification(context, index) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
          color: index == 2 || index == 5 ? Colors.white : Color(0xffEEEEEE)),
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (index != 2 && index != 5)
              Icon(
                Icons.circle,
                size: 10.0,
                color: Colors.black,
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
            ),
            if (index != 1 && index != 4)
              Icon(Icons.person)
            else
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/icons/security.svg'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '3 SVC',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        title: Text(data[index].title,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.0),
            ),
            Flexible(
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 13.0, color: Colors.black),
                        children: [
                  TextSpan(
                      text: data[index].from,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: data[index].data,
                      style:
                          TextStyle(fontSize: 13.0, color: Color(0xff949494)))
                ])))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications", style: TextStyle(color: Colors.black)),
          backgroundColor: Color(0xffEEEEEE),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: getNotification,
          ),
        ));
  }
}
