// ignore_for_file: file_names
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      // para que el boton mostrado tenga una interaccion(hacer clic)
      suffixIcon: IconButton(
        // el icono de mandar mensaje
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
        focusNode: focusNode,

        ///cuando presionas en cualquier lugar que no sea el
        ///widget seleccionado, cerrará el teclado que tine activo
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          textController.clear();
          //para que el teclado no desaparesca cuando se le da clic
          focusNode.requestFocus();
          onValue(value);
        });
  }
}
