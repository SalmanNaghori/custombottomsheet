import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomBottomSheetScreen(),
    );
  }
}

class CustomBottomSheetScreen extends StatefulWidget {
  @override
  State<CustomBottomSheetScreen> createState() =>
      _CustomBottomSheetScreenState();
}

class _CustomBottomSheetScreenState extends State<CustomBottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomBottomSheet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                child: const Text('Click'),
                onPressed: () {
                  BottomSheet();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void BottomSheet() {
    var screenSize = MediaQuery.of(context).size;

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0,
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setSheetState) => Container(
            height: screenSize.height * 0.85,
            margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.006),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 12.43),
                Container(
                  width: 45,
                  height: 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffcbcdcc)),
                ),
                const SizedBox(height: 23.01),
                const Text(
                  'Demo',
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff292929),
                      fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: 10,
                    itemBuilder: (ctx, i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://picsum.photos/200/300/?image=$i',
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                  ),
                ),
                bottomButtonBar(
                  'Close',
                  () {
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  bottomButtonBar(String text, VoidCallback onPress) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 77,
        color: const Color(0xff3f7ccd),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),
        )),
      ),
    );
  }
}
