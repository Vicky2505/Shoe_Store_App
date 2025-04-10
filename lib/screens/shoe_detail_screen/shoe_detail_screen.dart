import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoeDetailScreen extends StatefulWidget {
  const ShoeDetailScreen({super.key});

  @override
  State<ShoeDetailScreen> createState() => _ShoeDetailScreenState();
}

class _ShoeDetailScreenState extends State<ShoeDetailScreen> {
  int _selectedSizeIndex = 2;
  int selectedColorIndex = 0;

  final List<double> sizes = [38.5, 40.5, 41.5, 42.5];
  final List<Color> colors = [Colors.blue, Colors.redAccent, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF5EFC8D), Color(0xFF61FC5F)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            top: 10.h,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 55.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50.r),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: 34.w),
                  Text(
                    'Add to cart',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: const Color(0xFFD9F7E6),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding: EdgeInsets.all(11.r),
                    decoration: const BoxDecoration(
                      color: Color(0xFF61FC5F),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "images/home_assets/shopping_bag_add_icon.png",
                      height: 28.h,
                      width: 28.w,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: _circularIcon(Icons.arrow_back_ios_new_rounded),
                    ),
                    _circularIcon(Icons.favorite),
                  ],
                ),
                SizedBox(height: 15.h),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Nike Shoes Sneakers',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "Men's shoes",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 250.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'images/shoe_detail_assets/nike_text.png',
                          height: 260.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'images/shoe_detail_assets/nike_shoes_sneakers.png',
                          height: 225.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PRICE',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            '\$189.99',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'COLORS',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: List.generate(
                              colors.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: 7.w),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColorIndex = index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(1.r),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            selectedColorIndex == index
                                                ? Colors.white
                                                : Colors.transparent,
                                        width: 2.5,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 10.r,
                                      backgroundColor: colors[index],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    sizes.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSizeIndex = index;
                        });
                      },
                      child: Container(
                        width: 65.w,
                        height: 30.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color:
                              index == _selectedSizeIndex
                                  ? Colors.transparent
                                  // ignore: deprecated_member_use
                                  : Colors.white.withOpacity(0.3),
                          border: Border.all(
                            color:
                                index == _selectedSizeIndex
                                    ? Colors.black
                                    : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          sizes[index].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Widget to create a circular icon with a border
  Widget _circularIcon(IconData iconData) {
    return Container(
      width: 42.w,
      height: 45.w,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF1D1D1D), width: 2.2.w),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Icon(iconData, size: 20.sp, color: const Color(0xFF1D1D1D)),
    );
  }
}
