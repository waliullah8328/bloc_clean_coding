import 'package:bloc_clean_coding/core/data/response/api_response.dart';
import 'package:bloc_clean_coding/feature/reciter/model/reciter.dart';
import 'package:equatable/equatable.dart';


class ReciterState extends Equatable {
  final ApiResponse<List<ReciterModel>> reciterList;

  const ReciterState({required this.reciterList});

  ReciterState copyWith({
    ApiResponse<List<ReciterModel>>? reciterList,
}){
    return ReciterState(
        reciterList: reciterList?? this.reciterList
    );

}

  @override
  List<Object> get props => [reciterList];
}