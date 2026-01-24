import 'package:bloc_clean_coding/feature/reciter/model/reciter.dart';

abstract class ReciterRepository{

  Future<ReciterModel> fetchReciterList();
}