// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  // con esta variable mostraremos los mensajes del provider 
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      // mueve a la columna en la parte final (derecha)
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        // brinda un espacio entre los widgets pasados
        const SizedBox(height: 5)
      ],
    );
  }
}
