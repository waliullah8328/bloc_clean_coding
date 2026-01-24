import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/core/bloc/reciter_bloc/reciter_event.dart';
import 'package:bloc_clean_coding/core/bloc/reciter_bloc/reciter_state.dart';
import 'package:bloc_clean_coding/core/data/response/api_response.dart';

class ReciterBloc extends Bloc<ReciterEvent, ReciterState>{
  ReciterState(): super(ReciterState(reciterList: ApiResponse.loading())){

  }
}