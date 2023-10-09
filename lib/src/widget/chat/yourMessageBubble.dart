// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class YourMessageBubble extends StatelessWidget {
  final Message message;

  //const YourMessageBubble({Key? key}) : super(key: key);
  const YourMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      // mueve a la columna en la parte final (derecha)

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        // brinda un espacio entre los widgets pasados
        const SizedBox(height: 5),

        _ImagenBubble(message.imageUrl!),

        const SizedBox(height: 10),
        // Todo: imagen
      ],
    );
  }
}

class _ImagenBubble extends StatelessWidget {
  final String imageUrl;

  const _ImagenBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // para saber las dimensiones del dispositivo
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        // para que tome solo el 70% de la pantalla
        width: size.width * 0.7,
        height: 150,
        // con las dimensiones que se le esta pasando, la imagen se adapta a ello
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                    height:
                        20), // Añade un poco de espacio entre el indicador y el texto
                Text('Cargando la imagen'),
              ],
            ),
          );
        },
      ),
    );
  }
}
