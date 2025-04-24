// lib/screens/flashcard_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flip_card/flip_card.dart';
import '../data/flashcard_data.dart';
import '../widgets/flashcard_widget.dart';

class FlashcardScreen extends StatefulWidget {
  final String initialSubject;

  const FlashcardScreen({
    Key? key,
    required this.initialSubject,
  }) : super(key: key);

  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  late String currentSubject;
  late List<Flashcard> currentFlashcards;
  int currentIndex = 0;
  final cardKey = GlobalKey<FlipCardState>();

  @override
  void initState() {
    super.initState();
    currentSubject = widget.initialSubject;
    currentFlashcards = getFlashcardsBySubject(currentSubject);
  }

  void _nextCard() {
    if (currentIndex < currentFlashcards.length - 1) {
      // Reset flip state before moving to next card
      if (cardKey.currentState?.isFront == false) {
        cardKey.currentState?.toggleCard();
      }
      setState(() {
        currentIndex++;
      });
    }
  }

  void _previousCard() {
    if (currentIndex > 0) {
      // Reset flip state before moving to previous card
      if (cardKey.currentState?.isFront == false) {
        cardKey.currentState?.toggleCard();
      }
      setState(() {
        currentIndex--;
      });
    }
  }

  void _changeSubject(String newSubject) {
    if (newSubject != currentSubject) {
      setState(() {
        currentSubject = newSubject;
        currentFlashcards = getFlashcardsBySubject(currentSubject);
        currentIndex = 0;
      });
      // Reset flip state when changing subjects
      if (cardKey.currentState?.isFront == false) {
        cardKey.currentState?.toggleCard();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QuickRevise',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.subject),
            tooltip: 'Select Subject',
            onSelected: _changeSubject,
            itemBuilder: (BuildContext context) {
              return getSubjects().map((String subject) {
                return PopupMenuItem<String>(
                  value: subject,
                  child: Text(
                    subject,
                    style: GoogleFonts.poppins(),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Subject display
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              currentSubject,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: _getSubjectColor(currentSubject),
              ),
            ),
          ),

          // Progress indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Index indicator
                Text(
                  'Card ${currentIndex + 1} of ${currentFlashcards.length}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          // Flashcard
          Expanded(
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  // Swiped right
                  _previousCard();
                } else if (details.primaryVelocity! < 0) {
                  // Swiped left
                  _nextCard();
                }
              },
              child: FlashcardWidget(
                flashcard: currentFlashcards[currentIndex],
                cardKey: cardKey,
              ),
            ),
          ),

          // Navigation buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: currentIndex > 0 ? _previousCard : null,
                  icon: const Icon(Icons.arrow_back),
                  label: Text('Previous', style: GoogleFonts.poppins()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _getSubjectColor(currentSubject).withOpacity(0.8),
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: currentIndex < currentFlashcards.length - 1
                      ? _nextCard
                      : null,
                  icon: const Icon(Icons.arrow_forward),
                  label: Text('Next', style: GoogleFonts.poppins()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _getSubjectColor(currentSubject).withOpacity(0.8),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
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
