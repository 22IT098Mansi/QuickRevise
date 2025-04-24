// lib/widgets/flashcard_widget.dart
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/flashcard_data.dart';

class FlashcardWidget extends StatelessWidget {
  final Flashcard flashcard;
  final GlobalKey<FlipCardState> cardKey;

  const FlashcardWidget({
    Key? key,
    required this.flashcard,
    required this.cardKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FlipCard(
        key: cardKey,
        direction: FlipDirection.HORIZONTAL,
        speed: 300,
        front: _buildCardSide(
          context: context,
          title: "Question",
          content: flashcard.question,
          isQuestion: true,
        ),
        back: _buildCardSide(
          context: context,
          title: "Answer",
          content: flashcard.answer,
          isQuestion: false,
        ),
      ),
    );
  }

  Widget _buildCardSide({
    required BuildContext context,
    required String title,
    required String content,
    required bool isQuestion,
  }) {
    Color backgroundColor = isQuestion
        ? _getSubjectColor(flashcard.subject).withOpacity(0.1)
        : _getSubjectColor(flashcard.subject).withOpacity(0.2);

    Color borderColor = _getSubjectColor(flashcard.subject);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: borderColor, width: 1.5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Tap to flip",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getSubjectColor(String subject) {
    switch (subject) {
      case "Data Structures and Algorithms":
        return Colors.blue;
      case "Mobile App Development using Flutter":
        return Colors.purple;
      case "Operating Systems":
        return Colors.green;
      case "Computer Networking":
        return Colors.orange;
      default:
        return Colors.teal;
    }
  }
}
