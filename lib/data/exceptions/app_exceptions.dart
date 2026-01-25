class AppException implements Exception {
  final  _message;
  final  _prefix;
  AppException([this._message,this._prefix]);


  @override
  String toString(){
    if(_message != null){
      return'$_message';
    }else{
      return'$_prefix';
    }

  }
}

class NoInternetException extends AppException{


  NoInternetException([String? message]):super(message,'No Internet Connection');
}



class RequestTimeOutException extends AppException{


  RequestTimeOutException([String? message]):super(message,'Request Time out');
}



class UnAuthorisedException extends AppException{


  UnAuthorisedException([String? message]):super(message,"Yo don't have access to this");
}


class FetchDataException extends AppException{


  FetchDataException([String? message]):super(message,"");
}


