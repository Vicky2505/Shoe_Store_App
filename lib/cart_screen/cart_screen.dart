import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  final Map<String, String> selectedShoe;

  const CartScreen({super.key, required this.selectedShoe});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final shoe = widget.selectedShoe;
    final double price = double.tryParse(shoe['price']!.replaceAll("\$", "")) ?? 0.0;
    final double subtotal = price * quantity;
    final double shipping = 40.90;
    final double total = subtotal + shipping;

    return Scaffold(
      backgroundColor: const Color(0xFFEFFFFE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 60.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: _boxIcon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              children: [
                _buildCartItem(
                  imgPath: shoe['image']!,
                  title: shoe['name']!,
                  size: shoe['size']!,
                  color: shoe['color']!,
                  brand: shoe['brand'] ?? 'Nike',
                  price: shoe['price']!,
                  quantity: quantity,
                  onIncrement: () => setState(() => quantity++),
                  onDecrement: () {
                    if (quantity > 1) setState(() => quantity--);
                  },
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
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
                        backgroundColor: const Color(0xFF3E7BFA),
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
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem({
    required String title,
    required String size,
    required String price,
    required String color,
    required String brand,
    required String imgPath,
    required int quantity,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.grey.shade200,
              ),
              child: Image.asset(imgPath, fit: BoxFit.contain),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'PRICE',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'COLORS: $color',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Text(
                    'Brand: $brand',
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  ),
                  Text(
                    'Size: $size',
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('Remove Item'),
                            content: const Text(
                              'Are you sure you want to remove this item from the cart?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text('Remove'),
                              ),
                            ],
                          ),
                    );
                  },
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.grey,
                    size: 24.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onDecrement,
                      child: Icon(Icons.remove_circle_outline, size: 22.sp),
                    ),
                    SizedBox(width: 6.w),
                    Text('$quantity', style: TextStyle(fontSize: 14.sp)),
                    SizedBox(width: 6.w),
                    GestureDetector(
                      onTap: onIncrement,
                      child: Icon(
                        Icons.add_circle,
                        size: 22.sp,
                        color: const Color(0xFF3E7BFA),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
