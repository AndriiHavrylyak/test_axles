import 'package:flutter/material.dart';
import 'package:test_axles/setting/сonfiguration_styles.dart';



class FormSeals extends StatefulWidget {
  FormSeals({Key? key, this.sealsId,this.userSel,this.dataAreaSel,}) : super(key: key);


   late var sealsId;
   late var userSel;
   late var dataAreaSel;


  @override
  _SealsPageState createState() => _SealsPageState();
}

class _SealsPageState extends State<FormSeals> {

  late TextEditingController _sealslController = new TextEditingController(text: widget.sealsId);
  late TextEditingController _usetrController = new TextEditingController(text: widget.userSel);
  late TextEditingController _dataAreaController = new TextEditingController(text: widget.dataAreaSel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StyleFormSealsPage.textNamePage)),
      body: Container(


        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(bottom: 20, top: 20),
                child: Text(
                  StyleFormSealsPage.textBodyNameForm,
                  style: StyleFormSealsPage.textName,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(StyleFormSealsPage.borderRadText),
                  color: Colors.grey,
                ),
                height: StyleFormSealsPage.heightItem,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child:TextField(
                          controller:_sealslController,
                          style:  StyleFormSealsPage.textBody),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: StyleFormSealsPage.heightBetwItem,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(StyleFormSealsPage.borderRadText),
                  color: Colors.grey,
                ),
                height: StyleFormSealsPage.heightItem,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child:
                      TextField(
                          controller: _usetrController,
                          style:  StyleFormSealsPage.textBody),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: StyleFormSealsPage.heightBetwItem,
              ),
              Container(
                height: StyleFormSealsPage.heightItem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(StyleFormSealsPage.borderRadText),
                  color: Colors.grey,
                ),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                          controller:_dataAreaController,
                          style:  StyleFormSealsPage.textBody),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

