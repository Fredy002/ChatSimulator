// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yesNoModel.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final YesNoModel yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();

    //lanzamos una excepcion de error
    //throw UnimplementedError();
  }
}
