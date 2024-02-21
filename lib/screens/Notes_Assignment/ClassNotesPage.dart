import 'package:flutter/material.dart';
import 'package:edumarshals/Utilities/Utilities.dart';

class ClassNotesPage extends StatefulWidget {
  const ClassNotesPage({Key? key}) : super(key: key);

  @override
  State<ClassNotesPage> createState() => _ClassNotesPageState();
}

class _ClassNotesPageState extends State<ClassNotesPage>{

  int current =0;

  @override
  Widget build(BuildContext context){
    final sheight=MediaQuery.of(context).size.height;
    final swidth=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffEBF3FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //top name image row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: (){},
                              child: Image.asset('assets/Group 48065.png',scale: 3,)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset('assets/Ellipse 7.png',scale: 3.5,),
                          ),
                          const Text('Hello...\nTRIPOD',style: TextStyle(
                              fontSize: 15
                          ),),
                        ],
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey
                          ),
                          shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset('assets/Bell.png',scale: 2.5,),
                      ),
                    ),


                  ],
                ),

                SizedBox(height: sheight*0.03,),


                Row(
                  children: <Widget>[
                    ChoiceChip(
                      selected: current == 0,
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('All Class Notes',style: TextStyle(color: current==0? Colors.white : Colors.black,fontSize: 12),),
                      ),
                      selectedColor: Color(0xFF004BB8),
                      backgroundColor: current == 0 ?  Color(0xFF004BB8) : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      onSelected: (selected) {
                        setState(() {
                          current = (selected ? 0 : null)!;
                        });
                      },
                    ),
                    SizedBox(width: 20),
                    ChoiceChip(
                      selected: current == 1,
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Recent Class Notes',style: TextStyle(color: current==1?Colors.white:Colors.black, fontSize: 12),),
                      ),
                      selectedColor: Color(0xFF004BB8),
                      backgroundColor: current == 1 ?  Color(0xFF004BB8) : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onSelected: (selected) {
                        setState(() {
                          current = (selected ? 1 : null)!;
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(height: sheight*0.03,),


                if (current ==0)
                  Column(
                    children: [
                      AllClassNotesBlock('Mathematics - IV', 'By Meenakshi Mam'),
                      AllClassNotesBlock('Discrete Theory of Logic', 'By Chitra Nasa'),
                      AllClassNotesBlock('Data Structure', 'By Sunil Kumar'),
                      AllClassNotesBlock('Python', 'By Meenakshi Mam'),
                      AllClassNotesBlock('Data Structure', 'By Meenakshi Mam'),
                    ],
                  ),
                if(current == 1)
                  Column(
                    children: [
                      notes( 'Mathematics - IV', 'Statical Technique I', 'By Meenakshi Ma`am'),
                      notes( 'Mathematics - IV', 'Statical Technique I', 'By Meenakshi Ma`am'),
                      notes( 'Mathematics - IV', 'Statical Technique I', 'By Meenakshi Ma`am'),
                      notes( 'Mathematics - IV', 'Statical Technique I', 'By Meenakshi Ma`am'),
                      notes( 'Mathematics - IV', 'Statical Technique I', 'By Meenakshi Ma`am'),

                    ],
                  ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}



Widget AllClassNotesBlock(subjectName, teacherName){
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFF004BB8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(subjectName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text('Semester - 3',style: TextStyle(color: Colors.white, fontSize: 13),),
                ),
                Text(teacherName,style: TextStyle(color: Colors.white, fontSize: 14),)
              ],
            ),

            Image.asset('assets/note-2.png', scale: 4,)
          ],
        ),
      ),
    ),
  );
}


