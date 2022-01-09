import 'package:dog_walk_app/models/doginfodata.dart';
import 'package:dog_walk_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenUtil().screenHeight,
        child: Stack(
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
            Positioned(
              top: 300,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                child: Container(
                  width: ScreenUtil().screenWidth,
                  color: white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          dogList[0]['name'],
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DogInfo(infoTitle: 'AGE', info: dogList[0]['age'],),
                            DogInfo(infoTitle: 'SIZE', info: dogList[0]['size'],),
                            DogInfo(infoTitle: 'SEX', info: dogList[0]['sex'],),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('LOCATION', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: offWhite),),
                        const Text('Kastanienallee, Berlin', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('SERVICE TYPE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: offWhite),),
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg_icons/footprints.svg', width: 25,),
                            Text(dogList[0]['service_type'], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DogInfo extends StatelessWidget {
  const DogInfo({
    required this.infoTitle,
    required this.info,
    Key? key,
  }) : super(key: key);

  final String infoTitle;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          infoTitle,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: offWhite),
        ),
        Text(info,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
