// lib/data/flashcard_data.dart
class Flashcard {
  final String subject;
  final String question;
  final String answer;

  Flashcard({
    required this.subject,
    required this.question,
    required this.answer,
  });
}

// All available flashcards
final List<Flashcard> allFlashcards = [
  // Data Structures and Algorithms
  Flashcard(
    subject: "Data Structures and Algorithms",
    question: "What is a Stack?",
    answer:
        "A linear data structure that follows LIFO (Last In First Out) order.",
  ),
  Flashcard(
    subject: "Data Structures and Algorithms",
    question: "What is a Queue?",
    answer: "A linear structure that follows FIFO (First In First Out) order.",
  ),
  Flashcard(
    subject: "Data Structures and Algorithms",
    question: "What is Big O Notation?",
    answer:
        "A mathematical notation that describes the limiting behavior of a function when the argument tends towards a particular value or infinity.",
  ),
  Flashcard(
    subject: "Data Structures and Algorithms",
    question: "What is a Binary Search Tree?",
    answer:
        "A tree data structure in which each node has at most two children, with all nodes to the left having values less than the parent and all nodes to the right having values greater than the parent.",
  ),
  Flashcard(
    subject: "Data Structures and Algorithms",
    question: "What is a Hash Table?",
    answer:
        "A data structure that implements an associative array abstract data type, a structure that can map keys to values using a hash function.",
  ),

  // Mobile App Development using Flutter
  Flashcard(
    subject: "Mobile App Development using Flutter",
    question: "What is Flutter?",
    answer:
        "An open-source UI software development kit created by Google used to develop cross platform applications from a single codebase.",
  ),
  Flashcard(
    subject: "Mobile App Development using Flutter",
    question: "What is a StatefulWidget?",
    answer: "A widget that can change its state during its lifecycle.",
  ),
  Flashcard(
    subject: "Mobile App Development using Flutter",
    question: "What is a StatelessWidget?",
    answer:
        "A widget that does not maintain any mutable state - once built, its properties cannot change.",
  ),
  Flashcard(
    subject: "Mobile App Development using Flutter",
    question: "What is the difference between hot reload and hot restart?",
    answer:
        "Hot reload preserves the state and updates the UI, while hot restart resets the state and rebuilds the app from scratch.",
  ),
  Flashcard(
    subject: "Mobile App Development using Flutter",
    question: "What is the BuildContext?",
    answer:
        "A handle to the location of a widget in the widget tree, used for obtaining theme, media query, and other information from the widget's ancestors.",
  ),

  // Operating Systems
  Flashcard(
    subject: "Operating Systems",
    question: "What is a process?",
    answer: "An instance of a program in execution.",
  ),
  Flashcard(
    subject: "Operating Systems",
    question: "What is a thread?",
    answer:
        "The smallest sequence of programmed instructions that can be managed independently by a scheduler.",
  ),
  Flashcard(
    subject: "Operating Systems",
    question: "What is virtual memory?",
    answer:
        "A memory management technique that provides an idealized abstraction of the storage resources that are actually available on a given machine.",
  ),
  Flashcard(
    subject: "Operating Systems",
    question: "What is a deadlock?",
    answer:
        "A situation where two or more processes are unable to proceed because each is waiting for resources held by the other.",
  ),
  Flashcard(
    subject: "Operating Systems",
    question: "What is a semaphore?",
    answer:
        "A variable or abstract data type used for controlling access to a common resource by multiple processes in a concurrent system.",
  ),

  // Computer Networking
  Flashcard(
    subject: "Computer Networking",
    question: "What is an IP address?",
    answer: "A unique identifier for a device on a network.",
  ),
  Flashcard(
    subject: "Computer Networking",
    question: "What is DNS?",
    answer:
        "Domain Name System - translates domain names to IP addresses so browsers can load Internet resources.",
  ),
  Flashcard(
    subject: "Computer Networking",
    question: "What is the OSI model?",
    answer:
        "Open Systems Interconnection model - a conceptual framework used to describe the functions of a networking system in seven abstract layers.",
  ),
  Flashcard(
    subject: "Computer Networking",
    question: "What is TCP/IP?",
    answer:
        "Transmission Control Protocol/Internet Protocol - a suite of communication protocols used to interconnect network devices on the Internet.",
  ),
  Flashcard(
    subject: "Computer Networking",
    question: "What is a router?",
    answer:
        "A networking device that forwards data packets between computer networks.",
  ),
];

// Get unique subjects
List<String> getSubjects() {
  return allFlashcards.map((card) => card.subject).toSet().toList();
}

// Get cards by subject
List<Flashcard> getFlashcardsBySubject(String subject) {
  return allFlashcards.where((card) => card.subject == subject).toList();
}
