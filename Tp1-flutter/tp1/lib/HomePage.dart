import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSmallHeight = MediaQuery.of(context).size.height < 700;
    print(isSmallHeight);
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile Home Page"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: isSmallHeight
                    ? MediaQuery.of(context).size.width * 0.70
                    : MediaQuery.of(context).size.width * 0.70,
                height: isSmallHeight
                    ? MediaQuery.of(context).size.height * 0.25
                    : MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: isSmallHeight
                        ? MediaQuery.of(context).size.width * 0.45
                        : MediaQuery.of(context).size.width * 0.43),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.blue),
                ),

                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_960_720.png'),
                  backgroundColor: Colors.black,
                  radius: 60,

                ),
              ),


              Container(
                margin: EdgeInsets.only(
                    bottom: isSmallHeight
                        ? MediaQuery.of(context).size.width * 0.1
                        : MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  "Hamid Ramdani",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: isSmallHeight
                        ? MediaQuery.of(context).size.width * 0.05
                        : MediaQuery.of(context).size.width * 0.05),
                child: Text(
                  "hamid.ramdani@etu.umontpellier.fr",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: isSmallHeight
                          ? MediaQuery.of(context).size.width * 0.2
                          : MediaQuery.of(context).size.width * 0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      Text(
                        "HamidRam.fr",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }


}
