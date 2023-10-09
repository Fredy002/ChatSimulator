// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/src/providers/chatProvider.dart';
import 'package:yes_no_app/src/widget/chat/myMessageBubble.dart';
import 'package:yes_no_app/src/widget/chat/yourMessageBubble.dart';
import 'package:yes_no_app/src/widget/shared/messageFieldBox.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.dexerto.com/cdn-cgi/image/width=1080,quality=75,format=auto/https://editors.dexerto.com/wp-content/uploads/2023/08/13/one-piece-gear-5.jpeg'),
          ),
        ),
        title: const Text('Luffy'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // hacemos la referencia al providers
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // el expanded, abarca el espacio restante del widget
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollControler,
              //para poder hacer scroll con el tamaño de la lista
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromeWho == FromeWho.your)
                    ?  YourMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),
            //Caja de Texto
            MessageFieldBox(
              //para que se muestre el mensaje que se recibe por el teclado y se muestre en la pantalla
              //onValue: (value)=> chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
