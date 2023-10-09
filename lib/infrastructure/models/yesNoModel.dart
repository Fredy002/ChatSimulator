// ignore_for_file: file_names
import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  //mapeamos la peticion
  Message toMessageEntity() => Message(
    text: answer == 'yes'? 'si': 'no',
    fromeWho: FromeWho.your,
    imageUrl: image
    );
}
