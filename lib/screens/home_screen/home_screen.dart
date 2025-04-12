// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneakers/shoe_detail_screen/shoe_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;

  List<String> categories = ["All", "Running", "Lifestyle", "Sports"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFFE),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Color(0xFF90CAF9),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: Offset(0, -8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform.translate(
                            offset: Offset(-10.w, 0),
                            child: IconButton(
                              icon: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 3,
                                    width: 30,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 5.h),
                                  Container(
                                    height: 3,
                                    width: 24,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 5.h),
                                  Container(
                                    height: 3,
                                    width: 17,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                // Handle menu button press
                              },
                            ),
                          ),
                          Image.asset(
                            'images/home_assets/nike_logo.png',
                            height: 46.h,
                            width: 50.w,
                            fit: BoxFit.cover,
                          ),
                          CircleAvatar(
                            radius: 20.r,
                            backgroundImage: AssetImage(
                              'images/home_assets/default_profile.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Morning Michel",
                      style: GoogleFonts.poppins(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Experience Fashion with Our Shoe Lineup",
                      style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 39.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5F4FF),
                        borderRadius: BorderRadius.circular(30.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.search, color: Colors.black, size: 23.sp),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "New Collection",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 31.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  itemBuilder: (context, index) {
                    bool isSelected = selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap:
                          () => setState(() => selectedCategoryIndex = index),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.black,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: Colors.black,
                            width: isSelected ? 1 : 0,
                          ),
                        ),
                        child: Text(
                          categories[index],
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 54.h),
              Row(
                children: [
                  _buildShoeCard(
                    color1: Color(0xFF5EFC8D),
                    color2: Color(0xFF61FC5F),
                    imagePath:
                        'images/shoe_detail_assets/nike_shoes_sneakers.png',
                    title: 'Nike Shoes',
                    subtitle: 'Sneakers',
                    price: '\$189.99',
                    favColor: Colors.black,
                    CircleColor: const Color(0xFFD5F7D8),
                  ),
                  SizedBox(width: 16.w),
                  _buildShoeCard(
                    color1: Color(0xFF90CAF9),
                    color2: Color(0xFF90A1F9),
                    imagePath:
                        'images/shoe_detail_assets/nike_kyrie_1_letterman.png',
                    title: 'Nike Kyrie 1',
                    subtitle: 'Letterman',
                    price: '\$160.99',
                    favColor: Colors.black,
                    CircleColor: const Color.fromARGB(255, 213, 216, 247),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build the shoe card
  Widget _buildShoeCard({
    required Color color1,
    required Color color2,
    required String imagePath,
    required String title,
    required String subtitle,
    required String price,
    required Color favColor,
    required Color CircleColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShoeDetailScreen()),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 190.h,
              width: double.infinity,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.20),
                    blurRadius: 25,
                    spreadRadius: 1,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 135),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -50.h,
              left: 10.w,
              right: 10.w,
              child: Image.asset(imagePath, height: 175.h, fit: BoxFit.contain),
            ),
            Positioned(
              bottom: 15.h,
              right: 12.w,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 14.r,
                    backgroundColor: CircleColor,
                    child: Icon(
                      Icons.favorite_border,
                      size: 16.sp,
                      color: favColor,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CircleAvatar(
                    radius: 14.r,
                    backgroundColor: Colors.black,
                    child: Image.asset(
                      "images/home_assets/shopping_bag_add_icon.png",
                      height: 13.h,
                      width: 13.w,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
