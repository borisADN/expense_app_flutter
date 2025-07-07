import 'package:application/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoBalance extends StatelessWidget {
  const InfoBalance({super.key, required this.isIncome, required this.balance});

  final bool isIncome;
  final String balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isIncome ? appGreen : appRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: appWhite,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Image.asset(
              isIncome ? 'assets/icons/in.png' : 'assets/icons/out.png',
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  isIncome ? 'Revenu' : 'Dépenses',
                  style: TextStyle(color: appWhite),
                ),
                SizedBox(height: 5),
                FittedBox(
                  child: Text(
                    balance,
                    style: TextStyle(
                      color: appWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
