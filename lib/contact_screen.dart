import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'contact_card.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List contactList = [];

  Future getContact() async {
    final response = await http.get('https://reqres.in/api/users?per_page=12');
    if (response.statusCode == 200) {
      var contactListFromJson = json.decode(response.body)['data'];
      setState(() {
        contactList = contactListFromJson;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'CONTACT',
        ),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          return ContactCard(
            photoContact: contactList[index]['avatar'],
            nameContact: contactList[index]['first_name'] +
                ' ' +
                contactList[index]['last_name'],
            emailContact: contactList[index]['email'],
          );
        },
      ),
    );
  }
}
