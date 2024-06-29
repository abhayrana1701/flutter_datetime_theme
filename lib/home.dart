import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  final VoidCallback changeTheme;
  final ThemeMode themeMode;
  Home({super.key,required this.changeTheme,required this.themeMode});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String selectedDate="Select Date";
  String selectedTime="Select Time";
  var dateFormat=DateFormat("dd-MM-yyyy");
  var timeFormat=DateFormat("hh:mm");
  String data="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date And Time Picker And Theme"),
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: ()  async{
                    var date=await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030)
                    );
                    setState(() {
                      selectedDate=dateFormat.format(date??DateTime.now());
                    });
                  },
                  child: Text(selectedDate),
              ),

              SizedBox(height:4),
              OutlinedButton(
                  onPressed: ()async{
                    var time=await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                    );
                    setState(() {
                      selectedTime=timeFormat.format(DateTime(2024,1,1,time?.hour ??0,time?.minute ??0));
                    });
                  },
                  child: Text(selectedTime),
              ),
              SizedBox(height:4),
              TextButton(
                  onPressed: (){
                    selectedDate="Select Date";
                    selectedTime="Select Time";
                    setState(() {

                    });
                  },
                  child: Text("Reset Date and Time")
              ),
              SizedBox(height:4),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  labelText: "Enter data",
                ),
                onChanged: (value){
                  setState(() {
                    data=value;
                  });
                },
              ),
              SizedBox(height:4),
              Text("Data entered: $data"),
              SizedBox(height:15),
              Text("Note: The application uses the theme of system by default. However, we can toggle the theme of application by clicking floating action button.")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.changeTheme,
        child:Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
