import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  OptionCard({
    this.label,
    this.tap=defaultFunc,
  });

  final String label;
  final Function tap;

  static void defaultFunc() {
    print("the function works!");
  }
   @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: tap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          child:
              Container(
                height: MediaQuery.of(context).size.width*0.38,
                width: MediaQuery.of(context).size.width*0.38,
                decoration: BoxDecoration(
                  color: Colors.orange,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: Colors.orange,
                  width: 0.5,
                ),
              ),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15) ,

                child: 
                     Center(
                       child: Text(label,textAlign: TextAlign.center,style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          )),
                     ),
               
              ),
        ),
      ),
    );
  }

}

