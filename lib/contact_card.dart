import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String nameContact;
  final String emailContact;
  final String photoContact;
  ContactCard(
      {@required this.nameContact,
      @required this.emailContact,
      @required this.photoContact});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(photoContact),
            ),
          ),
        ),
        title: Text(
          nameContact,
        ),
        subtitle: Text(
          emailContact,
        ),
        trailing: Wrap(
          spacing: 10.0,
          children: <Widget>[
            Icon(Icons.phone),
            Icon(Icons.messenger_outline),
          ],
        ),
      ),
    );
  }
}
