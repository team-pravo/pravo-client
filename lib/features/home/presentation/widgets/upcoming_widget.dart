import 'package:flutter/material.dart';

class UpcomingWidget extends StatelessWidget {
  const UpcomingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 24,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "다가오는 약속",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("금요일"),
                    SizedBox(
                      width: 24,
                    ),
                    Text("아보카도 수확하기"),
                  ],
                ),
                Row(
                  children: [
                    Text("토요일"),
                    SizedBox(
                      width: 24,
                    ),
                    Text("아보카도 저녁 파티"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
