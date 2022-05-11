import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_axles/blocs/seals_bloc/seals_bloc.dart';
import 'package:test_axles/models/seals_model.dart';
import 'package:test_axles/pages/form_seals.dart';
import 'package:test_axles/setting/сonfiguration_styles.dart';


class SealsPage extends StatefulWidget {
  @override
  _SealsPageState createState() => _SealsPageState();
}

class _SealsPageState extends State<SealsPage> {
  final SealsBloc _newsBloc = SealsBloc();

  @override
  void initState() {
    _newsBloc.add(GetSealsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(StyleSealsPage.textNamePage), centerTitle: true,),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<SealsBloc, SealsState>(
          listener: (context, state) {
            if (state is SealsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<SealsBloc, SealsState>(
            builder: (context, state) {
              if (state is SealsInitial) {
                return _buildLoading();
              } else if (state is SealsLoading) {
                return _buildLoading();
              } else if (state is SealsLoaded) {
                return _buildCard(context, state.sealsModel);
              } else if (state is SealsError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Objects model) {
    return ListView.builder(
      itemCount: model.results!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
                title:Text("Номер пломби: ${model.results![index].sealNumber}",
                  style: StyleSealsPage.textCard,
                ),
                subtitle: Text("Хто зпрломбував:${model.results![index].user} "
                    "\nОбласть даних:${model.results![index].dataArea} "    ),
                leading: Icon(
                  Icons.qr_code_scanner_sharp,
                ),
                onTap: () =>
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        FormSeals(
                          sealsId : model.results![index].sealNumber,
                          userSel : model.results![index].user,
                          dataAreaSel : model.results![index].dataArea,
                        )
                    ),
                  )
                }
            ),

          ),
        );
      },
    );
  }
  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
