import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/core/bloc/reciter_bloc/reciter_event.dart';
import 'package:bloc_clean_coding/core/bloc/reciter_bloc/reciter_state.dart';
import 'package:bloc_clean_coding/core/data/response/api_response.dart';
import 'package:bloc_clean_coding/core/repository/reciters/reciter_repository.dart';
import 'package:flutter/cupertino.dart';

class ReciterBloc extends Bloc<ReciterEvent, ReciterState>{
  ReciterRepository reciterRepository;
  ReciterBloc({required this.reciterRepository}): super(ReciterState(reciterList: ApiResponse.loading())){
    on<ReciterFetched>(fetchReciterListApi);
  }


  Future<void> fetchReciterListApi(ReciterFetched event, Emitter<ReciterState> emit)async{
    await reciterRepository.fetchReciterList().then((value){


      emit(state.copyWith(reciterList: ApiResponse.completed(value)));

    }).onError((error, stackTrace){
      debugPrint(error.toString());
      emit(state.copyWith(reciterList: ApiResponse.error(error.toString())));

    });

  }
}