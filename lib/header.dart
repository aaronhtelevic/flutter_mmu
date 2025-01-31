import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final VoidCallback onAgendaPressed;
  final VoidCallback onDelegatesPressed;

  const Header(
      {super.key,
      required this.onAgendaPressed,
      required this.onDelegatesPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextButton(
          onPressed: onAgendaPressed,
          child: Text('Agenda'),
        ),
        SizedBox(width: 10),
        TextButton(
          onPressed: onDelegatesPressed,
          child: Text('Delegates'),
        ),
      ],
    );
  }
}
