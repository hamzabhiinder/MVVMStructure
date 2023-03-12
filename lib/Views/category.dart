import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: 
          [ 
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(25),
                shrinkWrap: true,
                
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2 ,
                  
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return contBox(txt: "Electronics", img: "assets/abc.png")  ;
                },
              ),
            ),
                      ]
      ),
    );
  }

  contBox({txt, img}) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        // Get.to(() => ElectronicsScreen(
        //       categoryname: txt,
        //     ));
        // if (txt == "Electronics") {
        //   Get.to(() => ElectronicsScreen(
        //         categoryname: txt,
        //       ));
        // }
        
      },
      child: Padding(
        padding: const EdgeInsets.all(5.5),
        child: Column(
          children: [
            Container(
              width: res_width * 0.2,
              height: res_height * 0.1,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                color:const Color(0xffffb039),
                borderRadius:const BorderRadius.all(
                  Radius.circular(18),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(2, 1), // Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  '$img',
                  // height: 10,
                  // width: 10,
                ),
              ),
            ),
           const SizedBox(
              height: 6,
            ),
            Text(
              "$txt",
              style: TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }

}