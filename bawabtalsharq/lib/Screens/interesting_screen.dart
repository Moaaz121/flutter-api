import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:flutter/material.dart';

class Interesting extends StatefulWidget {
  @override
  _InterestingState createState() => _InterestingState();
}

class _InterestingState extends State<Interesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/logo1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.89,
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 20.0, bottom: 15.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.deepOrangeAccent.shade100, // button color
                      child: InkWell(
                        splashColor: Colors.red, // inkwell color
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: 10.0),
                  child: Text(
                    Languages.of(context).interesting,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                  ),
                ),
                Flexible(
                  child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 5, bottom: 50),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Card(
                            color: Colors.deepOrangeAccent.withOpacity(0.7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/cold_drinks.png',
                                  fit: BoxFit.fill,
                                  width: 50,
                                  height: 50,
                                ),
                                Text(Languages.of(context).iconText),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          Languages.of(context).btnText,
                          style:
                              TextStyle(fontSize: 19, color: Colors.deepOrange),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.deepOrange, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () => null),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
