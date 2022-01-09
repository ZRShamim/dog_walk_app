import 'package:dog_walk_app/models/doginfodata.dart';
import 'package:dog_walk_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            dogList[0]['img'],
            width: ScreenUtil().screenWidth,
            height: 360,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            top: 25,
            child: Container(
              width: ScreenUtil().screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.turned_in_not_outlined),
                    color: white,
                  )
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
