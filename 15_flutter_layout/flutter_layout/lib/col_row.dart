import 'package:flutter/material.dart';

class ColRow extends StatelessWidget {
  const ColRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Container(
            color: Colors.orange[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Container(
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Container(
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 5,
            ),
            color: Colors.amber,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                32,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 100,
                height: 50,
                child: Container(
                  color: Colors.purple,
                  child: const Padding(
                    padding: EdgeInsets.all(
                      8,
                    ),
                    child: Text(
                      'data',
                      style: TextStyle(
                        backgroundColor: Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: Container(
                  color: Colors.green,
                  child: const Padding(
                    padding: EdgeInsets.all(
                      8,
                    ),
                    child: Text(
                      'data',
                      style: TextStyle(
                        backgroundColor: Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: Container(
                  color: Colors.blue,
                  child: const Padding(
                    padding: EdgeInsets.all(
                      8,
                    ),
                    child: Text(
                      'data',
                      style: TextStyle(
                        backgroundColor: Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Container(color: Colors.pink),
        ),
      ],
    );
  }
}
