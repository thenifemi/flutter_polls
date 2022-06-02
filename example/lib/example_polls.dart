import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';

class ExamplePolls extends StatefulWidget {
  const ExamplePolls({Key? key}) : super(key: key);

  @override
  State<ExamplePolls> createState() => _ExamplePollsState();
}

class _ExamplePollsState extends State<ExamplePolls> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Flutter Polls')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: FlutterPolls(
              pollId: 'Example',
              onVoted: (PollOption pollOption, int newTotalVotes) {
                // ignore: avoid_print
                print('Voted: ${pollOption.id}');
              },
              pollTitle: const Text('Example Polls'),
              pollOptions: [
                PollOption(title: const Text('Option 1'), votes: 1),
                PollOption(title: const Text('Option 2'), votes: 1),
                PollOption(title: const Text('Option 3'), votes: 1),
              ],
            ),
          ),
        ),
      );
}
