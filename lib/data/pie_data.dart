import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/item.dart';


class PiEdata extends StatefulWidget {
  final Employee? employee;
  PiEdata({this.employee});
  @override
  _PiEdataState createState() => _PiEdataState();
}

class _PiEdataState extends State<PiEdata> {
   double? _employee_livingCost;
   double? _employee_medicalCost;
   double?_employee_educationCost;
  double?_employee_vacationCost;
  final _docid = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    _docid.value = TextEditingValue(text: widget.employee!.uid.toString());
    _employee_livingCost = widget.employee!.livingCost;
    _employee_medicalCost = widget.employee!.medicalCost;
    _employee_educationCost = widget.employee!.education;
    _employee_vacationCost= widget.employee!.vacationCost;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LongivityIn Time",style: TextStyle(fontSize: 0),)),
      ),
      body: Container(
        height: 800,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Container(
                height: 100,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child:  Center(child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text("Pie Chart",style: TextStyle(fontSize: 50),),
                  )),
                ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                height: 300,
                width: double.infinity,
                child: PieChart(PieChartData(
                    centerSpaceRadius: 100,
                    centerSpaceColor: Colors.yellow,
                    borderData: FlBorderData(show:true),
                    sections: [
                      PieChartSectionData(value: double.parse(_employee_livingCost.toString()), color: Colors.blue),
                      PieChartSectionData(value: double.parse(_employee_medicalCost.toString()), color: Colors.orange),
                      PieChartSectionData(value: double.parse(_employee_educationCost.toString()), color: Colors.red),
                      PieChartSectionData(value: double.parse(_employee_vacationCost.toString()), color: Colors.purple),
                    ]
                )),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text("Blue For Living Cost: "+_employee_livingCost.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text("Orange For Medical Cost: "+_employee_medicalCost.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text("Red For Education Cost: "+_employee_educationCost.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text("Purpel For Vacation Cost: "+_employee_vacationCost.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
      ),
    );
  }
}




