import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  final Map<String, String> selectedShoe;

  const CartScreen({super.key, required this.selectedShoe});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;

  void onIncrement() {
    setState(() {
      quantity++;
    });
  }

  void onDecrement() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final shoe = widget.selectedShoe;
    final String imageUrl = shoe['image'] ??'assets/images/shoe_detail_assets/nike_shoes_sneakers.png';
    final String title = shoe['name'] ?? 'Unknown Shoe';
    final String priceString = shoe['price'] ?? '\$0.00';
    final String color = shoe['color'] ?? 'Unknown';
    final String size = shoe['size'] ?? 'Unknown';
    final double price = double.tryParse(priceString.replaceAll("\$", "")) ?? 0.0;
    final double subtotal = price * quantity;
    final double shipping = 40.90;
    final double total = subtotal + shipping;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB9FBF6), Color(0xFF61FFF5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: 10.h,
            left: 20.w,
            right: 20.w,
            top: 10.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(
                    colors: [
                      // ignore: deprecated_member_use
                      Colors.blueGrey.withOpacity(0.3),
                      // ignore: deprecated_member_use
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                  // ignore: deprecated_member_use
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: onDecrement,
                              child: Icon(
                                Icons.remove_circle,
                                size: 26.sp,
                                color: Colors.blue,
                                shadows: [
                                  Shadow(
                                    blurRadius: 5,
                                    // ignore: deprecated_member_use
                                    color: Colors.blue.withOpacity(0.3),
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              '$quantity',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            GestureDetector(
                              onTap: onIncrement,
                              child: Icon(
                                Icons.add_circle,
                                size: 26.sp,
                                color: Colors.blue,
                                shadows: [
                                  Shadow(
                                    blurRadius: 5,
                                    // ignore: deprecated_member_use
                                    color: Colors.blue.withOpacity(0.3),
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 8,
                                  title: Row(
                                    children: [
                                      Lottie.asset(
                                        'images/card_assets/remove_cart.json',
                                        width: 90,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Remove Item',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  content: Text(
                                    'Are you sure you want to remove this item from the cart?',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.normal,
                                      height: 1.4,
                                    ),
                                  ),
                                  actionsPadding: EdgeInsets.only(
                                    right: 12,
                                    bottom: 10,
                                  ),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.grey[700],
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 18,
                                          vertical: 10,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Remove',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          );
                        },
                        icon: Icon(Icons.delete_outline, color: Colors.black),
                        label: Text(
                          'Remove',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 8.h),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(
                    colors: [
                      // ignore: deprecated_member_use
                      Colors.blueGrey.withOpacity(0.3),
                      // ignore: deprecated_member_use
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                  // ignore: deprecated_member_use
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildPriceRow(
                      'Subtotal',
                      '\$${subtotal.toStringAsFixed(2)}',
                      color: Colors.grey.shade700,
                    ),
                    SizedBox(height: 6.h),
                    _buildPriceRow(
                      'Shipping',
                      '\$${shipping.toStringAsFixed(2)}',
                      color: Colors.grey.shade700,
                    ),
                    SizedBox(height: 10.h),
                    Divider(thickness: 1, color: Colors.grey.shade300),
                    SizedBox(height: 10.h),
                    _buildPriceRow(
                      'Total Cost',
                      '\$${total.toStringAsFixed(2)}',
                      isBold: true,
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                        ),
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                      child: _boxIcon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 250.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 10.h,
                                  left: 20.w,
                                  child: Image.asset(
                                    'images/shoe_detail_assets/nike_text3.png',
                                    height: 180.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Positioned(
                                  top: 30.h,
                                  left: 40.w,
                                  child: Image.asset(
                                    imageUrl,
                                    height: 135.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "PRICE",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            Text(
                              priceString,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "COLOUR",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            Text(
                              color,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "BRAND",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            Text(
                              "NIKE",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "SIZE",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            Text(
                              size,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //price row widget
  Widget _buildPriceRow(
    String label,
    String amount, {
    bool isBold = false,
    Color? color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            color: color ?? Colors.black,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            color: color ?? Colors.black,
          ),
        ),
      ],
    );
  }

  //box icon widget
  Widget _boxIcon(IconData iconData) {
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
