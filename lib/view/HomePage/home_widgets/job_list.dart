import 'package:dog_walk_app/models/doginfodata.dart';
import 'package:dog_walk_app/view/DetailPage/detail_page.dart';
import 'package:dog_walk_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class JobList extends StatelessWidget {
  const JobList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(dogList.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: InkWell(
            onTap: () {
              Get.to(() => DetailPage(dogInfo: dogList[index]));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 250,
                width: ScreenUtil().screenWidth,
                child: Stack(
                  children: [
                    Image.network(
                      dogList[index]['img'],
                      width: ScreenUtil().screenWidth,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.turned_in_not_outlined),
                        color: white,
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dogList[index]['name'],
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                          Text(
                            '${dogList[index]['service_day']} | ${dogList[index]['service_time']}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: ScreenUtil().screenWidth - 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dogList[index]['service_type'],
                                  style: const TextStyle(
                                      fontSize: 18, color: white),
                                ),
                                Text('\$ ${dogList[index]['service_fee']} / hr',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: white,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}