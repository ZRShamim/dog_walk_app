import 'package:dog_walk_app/models/doginfodata.dart';
import 'package:dog_walk_app/view/DetailPage/detail_page.dart';
import 'package:dog_walk_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activeTab = 0.obs;
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: white,
            leadingWidth: 40,
            leading: const Icon(
              Icons.location_on_outlined,
              color: black,
              size: 28,
            ),
            titleSpacing: 0,
            title: const Text(
              'Kastanienallee, Berlin',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700, color: black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg_icons/filter.svg',
                      width: 25,
                    ),
                    Positioned(
                      top: 13,
                      left: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(2),
                          color: black,
                          constraints:
                              const BoxConstraints(maxHeight: 15, minWidth: 15),
                          child: const Text(
                            '2',
                            style: TextStyle(
                              color: white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
        body: ListView(
          children: [
            Column(
              children: const [
                FilteredOption(),
                JobList(),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.pets_outlined,
              ),
              label: 'Activities',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: black,
          unselectedItemColor: offWhite,
          currentIndex: activeTab.value,
          onTap: (index) {
            activeTab.value = index;
          },
        ),
      ),
    );
  }
}

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

class FilteredOption extends StatelessWidget {
  const FilteredOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(searchOption.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Chip(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              label: Row(
                children: [
                  Text(
                    searchOption[index],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    'assets/svg_icons/x.svg',
                    width: 18,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
