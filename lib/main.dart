import 'package:flutter/material.dart';
import 'package:spravochnik/data_for_fill.dart';

void main() {
  runApp(MaterialApp(home: MainScreen(), theme: ThemeData(primarySwatch: Colors.amber),));
}

class MainScreen extends StatelessWidget{
  MainScreen({Key? key}) : super(key: key);

  @override Widget build(BuildContext){

    return Scaffold(appBar: AppBar(title: Text("Пицца", textDirection: TextDirection.ltr,),),
      body: Directionality(textDirection: TextDirection.ltr, child:

        SingleChildScrollView(child: 

          Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [

          Row(crossAxisAlignment: CrossAxisAlignment.start, textDirection: TextDirection.ltr, children: [

            Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),

            Column(mainAxisAlignment: MainAxisAlignment.start ,crossAxisAlignment: CrossAxisAlignment.start, textDirection: TextDirection.ltr, children: [

              Padding(padding: EdgeInsets.all(20)),

              Text("Cправочник", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),

              Padding(padding: EdgeInsets.all(20)),

              SizedBox(height: 75, width: 200, child: ElevatedButton(child: Text("О справочнике", textDirection: TextDirection.ltr,), onPressed: () {
                Navigator.push(BuildContext, MaterialPageRoute(builder: (context) => about_d()));
              }),),

              Padding(padding: EdgeInsets.all(20)),

              SizedBox(height: 75, width: 200, child: ElevatedButton(child: Text("О разработчике", textDirection: TextDirection.ltr,), onPressed: () {
                Navigator.push(BuildContext, MaterialPageRoute(builder: (context) => about()));
              }),),

              Padding(padding: EdgeInsets.all(20)),

              SizedBox(height: 75, width: 200, child: ElevatedButton(child: Text("Просто кнопка", textDirection: TextDirection.ltr,), onPressed: () {
                Navigator.push(BuildContext, MaterialPageRoute(builder: (context) => about_d()));
              }),),
            ],),


            grid_data()

            ],)

          ],)
        ,)

        )
    );
  }
}


//  Переход с кликабельной картинки
class InfoScreen extends StatelessWidget{

  InfoScreen({Key? key, this.title, this.pictureName, this.text}) : super(key: key);

  String? title = "";
  String? pictureName = "";
  String? text = "";

  @override Widget build(BuildContext){

    return Scaffold(appBar: AppBar(title: Text(this.title!, textDirection: TextDirection.ltr,),),
        body: Directionality(textDirection: TextDirection.ltr, child: SingleChildScrollView(child: Center(child: Column(textDirection: TextDirection.ltr, children: [

          Padding(padding: EdgeInsets.only(top: 20)),
          
          ConstrainedBox(constraints: BoxConstraints.loose(Size(600, 600)), child: Image.asset(pictureName!, fit: BoxFit.scaleDown,),),
          Padding(padding: EdgeInsets.only(top: 30)),

          Text(title!, textDirection: TextDirection.ltr, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          
          Padding(padding: EdgeInsets.only(top: 10)),

          ConstrainedBox(constraints: BoxConstraints.loose(Size(1500, 1000000)), child: Text(text!, textDirection: TextDirection.ltr, style: TextStyle(fontSize: 20),),)
         
        ],),),))
    );
  }
}



// Элемент с кликабельной картинкой и отступами
class Kartinka extends StatelessWidget{

  kartinka_data? kdat;

  Kartinka(this.kdat);

  @override Widget build(BuildContext){

    return Column(textDirection: TextDirection.ltr, children: [

      Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),

      Row(textDirection: TextDirection.ltr, children: [

        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),),

        howerbutton(kdat!.height, kdat!.width, kdat!.pictureName, kdat!.title, kdat!.text),

        Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0),),
      ],),

      ConstrainedBox(constraints: BoxConstraints(maxHeight: 40, maxWidth: 200), child: Text(kdat!.title, textDirection: TextDirection.ltr),),

      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),),

    ],);
  }
}


// Кнопка и картинка
class howerbutton extends StatefulWidget{

  double scalex = 00;
  double scaley = 300;
  String pictureName;
  String title;
  String text;

  howerbutton(this.scalex, this.scaley, this.pictureName, this.title, this.text);

  _howerbutton createState() => _howerbutton();
}
class _howerbutton extends State<howerbutton>{

  @override Widget build(BuildContext){

    return SizedBox(height: widget.scalex, width: widget.scaley, child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromARGB(0, 255, 254, 254), elevation: 0, shadowColor: Color.fromARGB(0, 255, 254, 254)), onPressed: (){Navigator.push(BuildContext, MaterialPageRoute(builder: (context) => InfoScreen(title: widget.title, text: widget.text, pictureName: widget.pictureName,)));}, 
            child: ConstrainedBox(constraints: BoxConstraints.loose(Size(400, 400)), child: Image.asset(widget.pictureName),), onHover: (value) {
      setState(() {
        if(value){
          widget.scalex *= 1.1;
          widget.scaley *= 1.1;
        }
        else{
          widget.scalex /= 1.1;
          widget.scaley /= 1.1;
        }
      });

    },),);

  }
}

class grid_data extends StatelessWidget{

  int rowsCount = 0;

  @override Widget build(BuildContext){

    rowsCount = data_for_fill.data.length ~/ 7;
    double b = data_for_fill.data.length % 7;
    if(b != 0) rowsCount++; 


    return Column(children: [

      for(int i = 0; i <= rowsCount; i++) grid_row()

    ],);
  }
}


//Алгоритм полная шляпа
class grid_row extends StatelessWidget{

  static int lastElementInRow = 0;
  static int until = 0;

  //return increment
  Widget ret_inc(int index){

    until = lastElementInRow + 6;

    if(index == until){

      lastElementInRow += 7;
    }

    if(index < data_for_fill.data.length){
      print("index: $index, lastElement: $lastElementInRow, until: $until");
      return Kartinka(data_for_fill.data[index]);
    }
    else{
      print("null index: $index");
      return Container(color: Color.fromARGB(0, 255, 254, 254), height: 100, width: 100,);
    }
  }

  @override Widget build(BuildContext){

    //Обновление значения until, чтобы цикл по завершению начался снова,
    //иначе until < lastElementInRow и цикл не начинается
    until = lastElementInRow + 7;

    return Row(children: [
      for(int j = lastElementInRow; j <= until; j++) ret_inc(j)
    ], mainAxisAlignment: MainAxisAlignment.start,);
  }
}

class about extends StatelessWidget{

  @override Widget build(BuildContext){
    return Scaffold(appBar: AppBar(title: Text("О разработчике", textDirection: TextDirection.ltr,),),
      body: Center(child: Text("ООО Kostyl & co.  2022", textDirection: TextDirection.ltr,),));
  }
}

class about_d extends StatelessWidget{

  @override Widget build(BuildContext){

    return Scaffold(appBar: AppBar(title: Text("О справочнике", textDirection: TextDirection.ltr,),),
      body: Center(child: Text("Этот справочник содержит информацию о разных видах пиццы, а именно виды, описание и иллюстрации.", textDirection: TextDirection.ltr,),));
  }
}