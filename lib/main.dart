import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',      
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  int fstnum=0;
  int sndnum=0;
  String texttodisplay="";
   String res="";
 String operatortoperform="";
  void btnClicked(String btval){
   if(btval =='C'){
      fstnum=0;
      sndnum=0;
      texttodisplay="";
       res="";
   }
   else if(btval == "+" || btval == "-" || btval=="X" ||btval == "/"){
     fstnum=int.parse(texttodisplay);
     res="";     
     operatortoperform=btval;
   }
   else if(btval=="="){
     sndnum=int.parse(texttodisplay);
     if(operatortoperform=="+"){
       res=(fstnum+sndnum).toString();
     }
      if(operatortoperform=="-"){
       res=(fstnum-sndnum).toString();
     }
      if(operatortoperform=="X"){
       res=(fstnum*sndnum).toString();
     }
      if(operatortoperform=="/"){
       res=(fstnum/sndnum).toString();
     }
   }
   else{
     res=int.parse(btval+texttodisplay).toString();
   }
   setState(() {
     texttodisplay=res;
   });
   
  }  
  Widget customButton(String stvalue)
  {
    return Expanded(      
      child: TextButton(         
        style: TextButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.all(25)
        ),             
        onPressed: ()=>btnClicked(stvalue),child: Text(stvalue,style: const TextStyle(fontSize: 20),),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(title: const Text('Calculator'),backgroundColor:const Color.fromARGB(255, 154, 211, 198),),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Container(              
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child:Text(texttodisplay,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
            )),
            
            Row(
              children: [
                         customButton("9"),
            customButton("8"),
            customButton("7"),
            customButton("+"),    
              ],
            ),
              Row(
              children: [
                         customButton("6"),
            customButton("5"),
            customButton("4"),
            customButton("-"),    
              ],
            ),
              Row(
              children: [
                         customButton("3"),
            customButton("2"),
            customButton("1"),
            customButton("X"),    
              ],
            ),
              Row(
              children: [
                         customButton("C"),
            customButton("0"),
            customButton("="),
            customButton("/"),    
              ],
            ),
                   

          ],
        ),

      
    );
  }
}

