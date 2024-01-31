//? Please note that this is just a dummy data for the purpose of this example.
//? You can use your own data from your API or any other source.
//? This is just an example of how you can use Flutter Polls.

List polls = [
  {
    'id': 1,
    'question':
        'Is Flutter the best framework for building cross-platform applications?',
    'end_date': DateTime(2025, 11, 21),
    'options': [
      {
        'id': 1,
        'title': 'Absolutely',
        'votes': 40,
      },
      {
        'id': 2,
        'title': 'Maybe',
        'votes': 20,
      },
      {
        'id': 3,
        'title': 'Meh!',
        'votes': 10,
      },
    ],
  },
  {
    'id': 2,
    'question': 'Do you think Oranguntans have the ability speak?',
    'end_date': DateTime(2022, 12, 25),
    'options': [
      {
        'id': 1,
        'title': 'Yes, they definitely do',
        'votes': 40,
      },
      {
        'id': 2,
        'title': 'No, they do not',
        'votes': 0,
      },
      {
        'id': 3,
        'title': 'I do not know',
        'votes': 10,
      },
      {
        'id': 4,
        'title': 'Why should I care?',
        'votes': 30,
      }
    ],
  },
  {
    'id': 3,
    'question': 'What is the meaning of life?',
    'end_date': DateTime(2026, 09, 30),
    'options': [
      {
        'id': 1,
        'title': 'To love',
        'votes': 42,
      },
      {
        'id': 2,
        'title': 'To live',
        'votes': 10,
      },
      {
        'id': 3,
        'title': 'To die',
        'votes': 19,
      },
      {
        'id': 4,
        'title': 'To be happy',
        'votes': 25,
      },
    ],
  },
  {
    'id': 4,
    'question':
        'How do you know that your experience of consciousness is the same as other people’s experience of consciousness?',
    'end_date': DateTime(2025, 04, 30),
    'options': [
      {
        'id': 1,
        'title': 'It is certain that it is the same',
        'votes': 1,
      },
      {
        'id': 2,
        'title': 'How am I supposed to know?',
        'votes': 0,
      },
    ],
    'hasVoted': true,
    'userVotedOptionId': 1,
  }
];
