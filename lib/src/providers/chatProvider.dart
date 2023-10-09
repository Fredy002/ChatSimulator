// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/getYesNoAnswer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

//Notifica cuando hay cambios
class ChatProvider extends ChangeNotifier {
  /// controla el scroll cuando hay demasiados mensajes lo, este lo
  /// pondrá al final mostrando ese último chat
  final ScrollController chatScrollControler = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Wenas Luffy', fromeWho: FromeWho.me),
    Message(text: 'Ya comiste?', fromeWho: FromeWho.me)
  ];

  Future<void> sendMessage(String text) async {
    // mostraremos el chat del texto que se recibe en el chat
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromeWho: FromeWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) await yourReply();

    //notificamos a flutter que hubo cambios, osea, se paso un nuevo mensaje
    notifyListeners();
    await moveScrollToBotton();
  }

  Future<void> yourReply() async {
    final yourMessage = await getYesNoAnswer.getAnswer();
    //hacemos que se muestre el mensaje
    messageList.add(yourMessage);
    notifyListeners();
    await moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async {
    /// tendrá una experiencia que se está enviando el mensaje lentamente
    /// y que que se envíe de manera que el usuario no lo note
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollControler.animateTo(chatScrollControler.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
