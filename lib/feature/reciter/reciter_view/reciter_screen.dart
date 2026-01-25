import 'package:bloc_clean_coding/config/component/internet_exception_widget.dart';
import 'package:bloc_clean_coding/core/bloc/reciter_bloc/reciter_bloc.dart';
import 'package:bloc_clean_coding/core/bloc/reciter_bloc/reciter_event.dart';
import 'package:bloc_clean_coding/core/bloc/reciter_bloc/reciter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/enum.dart';
import '../../../main.dart';

class ReciterScreen extends StatefulWidget {
  const ReciterScreen({super.key});

  @override
  State<ReciterScreen> createState() => _ReciterScreenState();
}


class _ReciterScreenState extends State<ReciterScreen> {
  late ReciterBloc reciterBloc;

  @override
  void initState() {
    reciterBloc = ReciterBloc(reciterRepository: getIt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (_)=> reciterBloc..add(ReciterFetched()),
        child: BlocBuilder<ReciterBloc, ReciterState>(
            builder: (context, state) {

              switch(state.reciterList.status){
                case Status.loading:
                  return Center(child: CircularProgressIndicator());
                case Status.error:
                  if(state.reciterList.message == 'No Internet Connection'){
                    return InternetExceptionWidget(onPressed: (){
                      reciterBloc.add(ReciterFetched());
                    },);
                  }else{
                    return Center(child: Text(state.reciterList.message.toString()),);
                  }

                case Status.completed:
                  if(state.reciterList.data == null){
                    return Text("No data found");
                  }
                  final reciterList = state.reciterList.data;
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount:  reciterList?.length,
                        itemBuilder: (context, index) {
                        final reciter = reciterList?[index];
                          return Card(
                            child: ListTile(
                              title: Text(reciter!.name.toString()),
                              subtitle: Text(reciter.arName),
                              trailing: CircleAvatar(child:Center(child: Text((reciter.id +1).toString() ,)),
                            ),

                          ));
                          },
                    ),
                  );



                default:

                  return SizedBox();
              }

            },
        ),
      ),

    );
  }
}
