import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isEdit = !isEdit;
                  });
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Slidable(
                  key:  ValueKey(isEdit),
                  isAllEdit: isEdit,
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      ///DELETE BUTTON...
                      GestureDetector(
                        onTap: () {

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 2)
                              ],
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // Customize the background color
                            ),

                            ///DELETE
                            child: Center(child: Icon(Icons.delete)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: Container(
                    color: Colors.green,
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerRight,
                  )),
            );
          },
        ));
  }
}

void doNothing(BuildContext context) {}
