import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              child: Column(
            children: [
              Container(
                child: Icon(
                  Icons.account_circle,
                  size: size.height * 0.2,
                  color: Colors.redAccent,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Bob Smith",
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Modulator since Jan 15, 2021",
                    style: TextStyle(fontSize: size.height * 0.03),
                  ),
                ),
              ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: size.height * 0.2,
                width: size.height * 0.2,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.lightGreen, Colors.blue],
                  ),
                ),
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: CardView(
                    size: size,
                    count: 5,
                    accomplishment: "Tracks Completed",
                  ),
                ),
              ),
              Container(
                height: size.height * 0.2,
                width: size.height * 0.2,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.lightBlue, Colors.purpleAccent],
                  ),
                ),
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: CardView(
                    size: size,
                    count: 2,
                    accomplishment: "Tracks Created",
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({this.size, this.count, this.accomplishment});

  final Size size;
  final int count;
  final String accomplishment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: size.width * 0.1,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            accomplishment,
            style: TextStyle(
              fontSize: size.width * 0.05,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
