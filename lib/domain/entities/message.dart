enum FromeWho { me, your }

class Message {
  final String text;
  final String? imageUrl;
  final FromeWho fromeWho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromeWho
  });
}
