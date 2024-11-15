import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'brain.dart';
import 'result_page.dart';
import 'constant.dart';
enum Gender {
  male,
  female,
empty}

class InputPage extends StatefulWidget {


  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selectedGendeer=Gender.empty;

   int weight = 50;
   int age = 50;

  int Height =183;
  Color MaleBAseColor = UnActiveColor;
  Color FemaleBaseColor = UnActiveColor;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101439),
      appBar: AppBar(
        backgroundColor: Color(0xFF101439),
        title: Text("BMI Calculator"),
      ),
      body: Column(
         children: [
           // Gender Info.
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: ()
                      {
                        setState(()
                        {
                          selectedGendeer = Gender.male;
                        });
                      },
                      child: ReUseableCard(col: selectedGendeer==Gender.male?ActiveColor:UnActiveColor,ChildCard: GenderInfor(GenderName: "Male",IconName: FontAwesomeIcons.mars,),)),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGendeer = Gender.female;

                        });
                      },
                      child: ReUseableCard(col: selectedGendeer==Gender.female?ActiveColor:UnActiveColor,ChildCard:GenderInfor(GenderName: "Female",IconName: FontAwesomeIcons.venus,),)),
                ),
              ],
            ),
          ),

          // Height
          Expanded(
            child: ReUseableCard(col: Color(0xFF1D1E33),ChildCard: Column(children: [
              
              Text("Height",style: LabelStyle,),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [

                Text(Height.toString(),style: LabelStyle),
                Text("Cm",style: Hstyle,)
              ],),

              Slider(min: 50,max: 250,

    value: Height.toDouble(), onChanged: (double NewValue){
setState(() {
  Height = NewValue.toInt();

});
              })


            ],),),
          ),

          //Age + Weight
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseableCard(col: Color(0xFF1D1E33),ChildCard: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                    Text("Weight",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30,color: Colors.white),),
                    Text(weight.toString(),style: LabelStyle,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                      FloatingActionButton(
                        heroTag: '12qw',
                        backgroundColor: Color(0xFF212647),
                        onPressed: (){
                          setState(() {
                            weight++;
                          });

                        },child: Icon(Icons.add),),
                      FloatingActionButton(
                        heroTag: '321qw',
                        backgroundColor: Color(0xFF212647),
                        onPressed: (){
                         setState(() {
                            weight--;
                          });
                        },child: Icon(Icons.remove),)

                    ],)
                  ],),),
                ),
                Expanded(
                  child: ReUseableCard(col: Color(0xFF1D1E33),ChildCard: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                    Text("Age",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30,color: Colors.white),),
                    Text(age.toString(),style: LabelStyle,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                        FloatingActionButton(
                          heroTag: '4ed',
                          backgroundColor: Color(0xFF212647),
                          onPressed: (){
                            setState(() {
                              age++;
                            });

                          },child: Icon(Icons.add),),
                        FloatingActionButton(
                          heroTag: '5rd',
                          backgroundColor: Color(0xFF212647),
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },child: Icon(Icons.remove),)

                      ],)
                  ],),),
                ),
              ],
            ),
          ),

           // Button
           GestureDetector(
             onTap: (){
// Finding BMI results by providing the weight and height values to the Calculate Result class.
               Calculate_Result cal = Calculate_Result(weight: weight,heigh: Height);
// Re-pass the results to the Results Page after that.

               Navigator.push(context, MaterialPageRoute(builder: (Context)=>
                   ResultPage(BMI: cal.calculateBMI(),Result: cal.getResult(),inter: cal.interpretation(),)

               ));

              },
             child: Container(
               color: Color(0xFFEB1555),
               height: 80,
               width: double.infinity,
               margin: EdgeInsets.only(top: 10),
               child: Center(
                   child: Text(
                     "Calculate BMI",
                     style:
                     TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,color: Colors.white),
                   )),
             ),
           )

         ],
      ),
    );
  }
}

class GenderInfor extends StatelessWidget {

  final GenderName;
  final IconName;

  const GenderInfor({required this.GenderName,required this.IconName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(IconName,color: Colors.white,size: 80,),
        SizedBox(height: 20,),
        Text(GenderName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 30),)

      ],);
  }
}
