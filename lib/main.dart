import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/appThem.dart';
import 'package:yes_no_app/src/providers/chatProvider.dart';
import 'package:yes_no_app/src/screens/chat/chatScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // se pone el "_", para ignorar lo que se pasa en el argumento
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
          title: 'Yes No+ App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 1).theme(),
          home: const ChatScreen()),
    );
  }
}
