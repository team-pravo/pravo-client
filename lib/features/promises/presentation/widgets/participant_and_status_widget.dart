import 'package:flutter/material.dart';
import 'package:pravo_client/features/promises/presentation/widgets/image_and_text_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/participation_status_label_widget.dart';

class ParticipantAndStatusWidget extends StatelessWidget {
  final bool isAttending;

  const ParticipantAndStatusWidget({super.key, required this.isAttending});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ImageAndTextWidget(),
        ParticipationStatusLabelWidget(
          isAttending: isAttending,
        ),
      ],
    );
  }
}
