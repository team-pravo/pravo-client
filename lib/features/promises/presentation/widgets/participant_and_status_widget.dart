import 'package:flutter/material.dart';
import 'package:pravo_client/features/promises/presentation/widgets/image_and_text_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/participation_status_label_widget.dart';

class ParticipantAndStatusWidget extends StatelessWidget {
  const ParticipantAndStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImageAndTextWidget(),
        ParticipationStatusLabelWidget(),
      ],
    );
  }
}
