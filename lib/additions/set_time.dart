


// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, override_on_non_overriding_member, unused_import, unnecessary_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

 set_time() {

  DateTimePicker(
    type: DateTimePickerType.dateTimeSeparate,
    dateMask: 'd MMM, yyyy',
    initialValue: DateTime.now().toString(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    icon: Icon(Icons.event),
    dateLabelText: 'Date',
    timeLabelText: "Hour",
    selectableDayPredicate: (date) {
// Disable weekend days to select from the calendar
      if (date.weekday == 6 || date.weekday == 7) {
        return false;
      }

      return true;
    },
    onChanged: (val) => print(val),
    validator: (val) {
      print(val);
      return null;
    },
    onSaved: (val) => print(val),
  );
}






/*
class set_time extends StatelessWidget {
  TextEditingController dateinput=TextEditingController as TextEditingController;
   set_time({ Key? key }) : super(key: key);
@override
  void initState() {
    dateinput.text = "000"; //set the initial value of text field
    //super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  TextField(
    controller: dateinput, //editing controller of this TextField
    decoration: InputDecoration(
        icon: Icon(Icons.calendar_today), //icon of text field
        labelText: "Enter Date" //label text of field
    ),
    readOnly: true, //set it true, so that user will not able to edit text
    onTap: () async {
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
//DateTime.now() - not to allow to choose before today.
          lastDate: DateTime(2101));

      if (pickedDate != null) {
        print(
            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
        String formattedDate =
        DateFormat('yyyy-MM-dd').format(pickedDate);
        print(
            formattedDate); //formatted date output using intl package =>  2021-03-16
//you can implement different kind of Date Format here according to your requirement

        /*setState(() {
          dateinput.text =
              formattedDate; //set output date to TextField value.
        }
        );*/
      }
       else {
        print("Date is not selected");
      }
    },
  );

}
 
  }
*/

/*
class set_time extends StatelessWidget {
   set_time({Key? key}) : super(key: key);
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    //_initialValue = DateTime.now().toString();
    _controller3 = TextEditingController(text: DateTime.now().toString());

    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
   // _controller4 = TextEditingController(text: '$lsHour:$lsMinute');

    _getValue();
  }
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  late TextEditingController _controller3;
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = '2000-10-22 14:30';
        _controller3.text = '2002-11-22';

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/