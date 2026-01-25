

import 'package:bloc_clean_coding/config/app_urls/app_urls.dart';
import 'package:bloc_clean_coding/core/repository/reciters/reciter_repository.dart';
import 'package:bloc_clean_coding/data/network/network_services_api.dart';
import 'package:bloc_clean_coding/feature/reciter/model/reciter.dart';

import '../../../data/exceptions/app_exceptions.dart';

class ReciterApiRepository implements ReciterRepository{

  final _apiService = NetworkServicesDio();

  @override
  Future<List<ReciterModel>> fetchReciterList() async {
    final response = await _apiService.getApi(AppUrls.reciter);

    if (response is List) {
      return response
          .map<ReciterModel>(
            (e) => ReciterModel.fromJson(e),
      )
          .toList();
    } else {
      throw FetchDataException('Invalid reciter response');
    }
  }


}