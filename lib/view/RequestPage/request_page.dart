import 'package:dog_walk_app/models/doginfodata.dart';
import 'package:dog_walk_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RequestPage extends StatelessWidget {
  RequestPage({required this.dogInfo, Key? key}) : super(key: key);
  Map dogInfo ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            GestureDetector(
              child: Hero(
                tag: 'Dog',
                child: Image.network(
                  dogInfo['img'],
                  width: ScreenUtil().screenWidth,
                  height: 470,
                  fit: BoxFit.fitWidth,
                ),
              ),
              onTap: () {},
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: ScreenUtil().screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
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
            Container(
              margin: const EdgeInsets.only(top: 100),
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
                        const Text(
                          'Please complete and confirm the information below.',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'LOCATION',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        const Text(
                          'Kastanienallee, Berlin',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'SERVICE TYPE',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg_icons/footprints.svg',
                              width: 25,
                            ),
                            Text(
                              dogInfo['service_type'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'SERVICE HOURS',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: List.generate(
                            dogInfo['service_hours'].length,
                            (index) {
                              if (!dogInfo['service_hours'][index]
                                  ['is_booked']) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.check_box,
                                        color: black,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: Text(
                                          dogInfo['service_hours'][index]
                                              ['day'],
                                          style: const TextStyle(
                                              color: black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 130,
                                        child: Text(
                                          dogInfo['service_hours'][index]
                                              ['service_hour'],
                                          style: const TextStyle(
                                              color: black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg_icons/info.svg',
                              width: 18,
                              color: yellow,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: ScreenUtil().screenWidth - 120,
                              child: dogInfo['is_cycled_week']
                                  ? const Text(
                                      'Please note that, this service is not one-time. It will occur in every week.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : const Text(
                                      'Please note that, this service is one-time. It will not occur in every week.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'SERVICE FEE',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        Text(
                          '\$${dogInfo['service_fee']} / hr',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: List.generate(
                            dogInfo['service_hours'].length,
                            (index) {
                              if (!dogInfo['service_hours'][index]
                                  ['is_booked']) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 40,
                                            child: Text(
                                              dogInfo['service_hours'][index]
                                                  ['day'],
                                              style: const TextStyle(
                                                  color: black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: 130,
                                            child: Text(
                                              dogInfo['service_hours'][index]
                                                  ['service_hour'],
                                              style: const TextStyle(
                                                  color: black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '\$${dogInfo['service_fee']}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        const Divider(
                          color: offWhite,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '\$ 36',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg_icons/info.svg',
                              width: 18,
                              color: yellow,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: ScreenUtil().screenWidth - 120,
                              child: const Text(
                                'Your wage will be transfer to your account as soon as you complete your daily service.\n\nYou will be earned \$ 36  per week.',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'YOUR PROFILE',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1614436163996-25cee5f54290?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=442&q=80',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Liza Kimberley',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: yellow,
                                      size: 16,
                                    ),
                                    Text('4.9 (543 votes)')
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'ANY NOTE?',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Hi David, I am Liza and I would love to join Gnocchi morning walk. I have good references on my profile. Please check it out before you decide.\n\nI am looking forward to meet you both!\n\nLiza.',
                        ),
                        const Divider(
                          color: offWhite,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: const Text(
                            '125 / 500',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            alignment: Alignment.center,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                            child: const Text(
                              'Send the Request',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: white),
                            ),
                          ),
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
