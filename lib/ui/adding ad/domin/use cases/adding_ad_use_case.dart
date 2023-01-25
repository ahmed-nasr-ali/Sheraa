import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/adding%20ad/domin/repository/adding_ad_repository.dart';

class AddingAdUseCase {
  AddingAdRepository addingAdRepository;

  AddingAdUseCase({
    required this.addingAdRepository,
  });

  Future<bool> call(BuildContext context, Map<String, dynamic> body) async {
    return await addingAdRepository.addingAdMethod(context, body);
  }
}
