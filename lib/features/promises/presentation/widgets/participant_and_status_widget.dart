import 'package:flutter/material.dart';
import 'package:pravo_client/features/promises/presentation/widgets/image_and_text_widget.dart';
import 'package:pravo_client/assets/constants.dart';

class ParticipantAndStatusWidget extends StatelessWidget {
  const ParticipantAndStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ImageAndTextWidget(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              minimumSize: const Size(67, 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              '참여 완료',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
