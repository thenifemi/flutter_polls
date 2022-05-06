# Flutter Polls

Customizable Polls for Flutter.
Simple, easy to use and highly customizable.

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  flutter_polls: ^0.0.1
```

Import it:

```dart
import 'package:flutter_polls/flutter_polls.dart';
```

## Example

```dart
FlutterPolls(
    pollId: '1',
    onVoted: (PollOption pollOption, int newTotalVotes) {
      print('Voted: ${pollOption.id}');
    },
    pollOptionsSplashColor: Colors.white(),
    votedProgressColor: Colors.greyDark().withOpacity(0.3),
    votedBackgroundColor: Colors.grey().withOpacity(0.2),
    votesTextStyle: themeData.textTheme.subtitle1,
    votedPercentageTextStyle:
        themeData.textTheme.headline4?.copyWith(
    color: Colors.black(),
    ),
    votedCheckmark: Icon(
        Icons.circle_check,
        color: AppColors.black(),
        height: 18,
        width: 18,
    ),
    pollTitle: Align(
    alignment: Alignment.centerLeft,
    child: AutoSizeText(
        poll['title'],
        style: TextStyle(
            fontSize: 20,
        ),
    ),
    pollOptions: poll['options'].map(
    (option) {
        return PollOption(
        id: option['id'],
        title: AutoSizeText(
            option['title'],
            style: tTextStyle(
            fontSize: 20,
        ),
        ),
        votes: option['votes'],
        );
    },
    ).toList(),
    metaWidget: Row(
    children: [
        const SizedBox(width: 6),
        AutoSizeText(
        '•',
        style: TextStyle(
            fontSize: 20,
        ),
        ),
        const SizedBox(
        width: 6,
        ),
        AutoSizeText(
        '2 weeks left',
        style: TextStyle(
            fontSize: 20,
        ),
        ),
    ],
    ),
),
```

![Flutter Poll](https://media.giphy.com/media/MtsvCKIWV2HJUkClHW/giphy.gif)