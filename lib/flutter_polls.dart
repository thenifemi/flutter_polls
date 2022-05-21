library flutter_polls;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// FlutterPolls widget.
// This widget is used to display a poll.
// It can be used in any way and also in a [ListView] or [Column].
class FlutterPolls extends HookWidget {
  const FlutterPolls({
    super.key,
    required this.pollId,
    this.hasVoted = false,
    this.userVotedOptionId,
    required this.onVoted,
    required this.pollTitle,
    this.heightBetweenTitleAndOptions = 10,
    required this.pollOptions,
    this.heightBetweenOptions,
    this.votesText = 'Votes',
    this.votesTextStyle,
    this.metaWidget,
    this.createdBy,
    this.userToVote,
    this.pollStartDate,
    this.pollEndDate,
    this.pollOptionsHeight = 40,
    this.pollOptionsWidth,
    this.pollOptionsBorderRadius,
    this.pollOptionsFillColor,
    this.pollOptionsSplashColor = Colors.grey,
    this.pollOptionsBorder,
    this.votedPollOptionsRadius,
    this.votedBackgroundColor = Colors.grey,
    this.votedProgressColor = Colors.blue,
    this.votedCheckmark,
    this.votedPercentageTextStyle,
    this.votedAnimationDuration = 1000,
  });

  /// The id of the poll.
  /// This id is used to identify the poll.
  /// It is also used to check if a user has already voted in this poll.
  final String? pollId;

  /// Checks if a user has already voted in this poll.
  /// If this is set to true, the user can't vote in this poll.
  /// Default value is false.
  final bool? hasVoted;

  /// If a user has already voted in this poll, you must provide the voted poll option id.
  /// It is ignored if [hasVoted] is set to false or not set at all.
  final int? userVotedOptionId;

  /// Called when the user votes for an option.
  /// The index of the option that the user voted for is passed as an argument.
  /// If the user has already voted, this callback is not called.
  /// If the user has not voted, this callback is called.
  final void Function(PollOption pollOption, int newTotalVotes) onVoted;

  /// The title of the poll. Can be any widget with a bounded size.
  final Widget pollTitle;

  /// Data format for the poll options.
  /// Must be a list of [PollOptionData] objects.
  /// The list must have at least two elements.
  /// The first element is the option that is selected by default.
  /// The second element is the option that is selected by default.
  /// The rest of the elements are the options that are available.
  /// The list can have any number of elements.
  ///
  /// Poll options are displayed in the order they are in the list.
  /// example:
  ///
  /// pollOptions = [
  ///
  ///  PollOption(id: 1, title: Text('Option 1'), votes: 2),
  ///
  ///  PollOption(id: 2, title: Text('Option 2'), votes: 5),
  ///
  ///  PollOption(id: 3, title: Text('Option 3'), votes: 9),
  ///
  ///  PollOption(id: 4, title: Text('Option 4'), votes: 2),
  ///
  /// ]
  ///
  /// The [id] of each poll option is used to identify the option when the user votes.
  /// The [title] of each poll option is displayed to the user.
  /// [title] can be any widget with a bounded size.
  /// The [votes] of each poll option is the number of votes that the option has received.
  final List<dynamic> pollOptions;

  /// The height between the title and the options.
  /// The default value is 10.
  final double? heightBetweenTitleAndOptions;

  /// The height between the options.
  /// The default value is 0.
  final double? heightBetweenOptions;

  /// Votes text. Can be "Votes", "Votos", "Ibo" or whatever language.
  /// If not specified, "Votes" is used.
  final String? votesText;

  /// [votesTextStyle] is the text style of the votes text.
  /// If not specified, the default text style is used.
  /// Styles for [totalVotes] and [votesTextStyle].
  final TextStyle? votesTextStyle;

  /// [metaWidget] is displayed at the bottom of the poll.
  /// It can be any widget with an unbounded size.
  /// If not specified, no meta widget is displayed.
  /// example:
  /// metaWidget = Text('Created by: $createdBy')
  final Widget? metaWidget;

  /// Who started the poll.
  final String? createdBy;

  /// Current user about to vote.
  final String? userToVote;

  /// The date the poll was created.
  final DateTime? pollStartDate;

  /// The date the poll will closed.
  final DateTime? pollEndDate;

  /// Height of a [PollOption].
  /// The height is the same for all options.
  /// Defaults to 40.
  final double? pollOptionsHeight;

  /// Width of a [PollOption].
  /// The width is the same for all options.
  /// If not specified, the width is set to the width of the poll.
  /// If the poll is not wide enough, the width is set to the width of the poll.
  /// If the poll is too wide, the width is set to the width of the poll.
  final double? pollOptionsWidth;

  /// Border radius of a [PollOption].
  /// The border radius is the same for all options.
  /// Defaults to 0.
  final BorderRadius? pollOptionsBorderRadius;

  /// Border of a [PollOption].
  /// The border is the same for all options.
  /// Defaults to null.
  /// If null, the border is not drawn.
  final BoxBorder? pollOptionsBorder;

  /// Color of a [PollOption].
  /// The color is the same for all options.
  /// Defaults to [Colors.blue].
  final Color? pollOptionsFillColor;

  /// Splashes a [PollOption] when the user taps it.
  /// Defaults to [Colors.grey].
  final Color? pollOptionsSplashColor;

  /// Radius of the border of a [PollOption] when the user has voted.
  /// Defaults to Radius.circular(8).
  final Radius? votedPollOptionsRadius;

  /// Color of the background of a [PollOption] when the user has voted.
  /// Defaults to [Colors.grey].
  final Color? votedBackgroundColor;

  /// Color of the progress bar of a [PollOption] when the user has voted.
  /// Defaults to [Colors.blue].
  final Color? votedProgressColor;

  /// Widget for the checkmark of a [PollOption] when the user has voted.
  /// Defaults to [Icons.check_circle_outline_rounded].
  final Widget? votedCheckmark;

  /// TextStyle of the percentage of a [PollOption] when the user has voted.
  final TextStyle? votedPercentageTextStyle;

  /// Animation duration of the progress bar of the [PollOption]'s when the user has voted.
  /// Defaults to 1000 milliseconds.
  /// If the animation duration is too short, the progress bar will not animate.
  /// If you don't want the progress bar to animate, set this to 0.
  final int votedAnimationDuration;

  @override
  Widget build(BuildContext context) {
    final userHasVoted = useState<bool>(hasVoted ?? false);
    final votedOption = useState<PollOption?>(hasVoted == false
        ? null
        : pollOptions
            .where(
              (pollOption) => pollOption.id == userVotedOptionId,
            )
            .toList()
            .first);
    final totalVotes = useState<int>(pollOptions.fold(
      0,
      (acc, option) => acc + option.votes as int,
    ));

    return Column(
      key: ValueKey(pollId),
      children: [
        pollTitle,
        SizedBox(height: heightBetweenTitleAndOptions),
        if (pollOptions.length < 2)
          throw ('>>>Flutter Polls: Poll must have at least 2 options.<<<')
        else
          ...pollOptions.map(
            (pollOption) {
              if (hasVoted == true && userVotedOptionId == null) {
                throw ('>>>Flutter Polls: User has voted but [userVotedOption] is null.<<<');
              } else {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: userHasVoted.value
                      ? Container(
                          key: UniqueKey(),
                          margin: EdgeInsets.only(
                            bottom: heightBetweenOptions ?? 8,
                          ),
                          child: LinearPercentIndicator(
                            width: pollOptionsWidth,
                            lineHeight: pollOptionsHeight!,
                            barRadius: votedPollOptionsRadius ??
                                const Radius.circular(
                                  8,
                                ),
                            padding: EdgeInsets.zero,
                            percent: pollOption.votes / totalVotes.value,
                            animation: true,
                            animationDuration: votedAnimationDuration,
                            backgroundColor: votedBackgroundColor,
                            progressColor: votedProgressColor,
                            center: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: Row(
                                children: [
                                  pollOption.title,
                                  const SizedBox(width: 10),
                                  if (votedOption.value != null &&
                                      votedOption.value?.id == pollOption.id)
                                    votedCheckmark ??
                                        const Icon(
                                          Icons.check_circle_outline_rounded,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                  const Spacer(),
                                  Text(
                                    '${(pollOption.votes / totalVotes.value * 100).toStringAsFixed(1)}%',
                                    style: votedPercentageTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          key: UniqueKey(),
                          margin: EdgeInsets.only(
                            bottom: heightBetweenOptions ?? 8,
                          ),
                          child: InkWell(
                            onTap: () {
                              userHasVoted.value = true;
                              votedOption.value = pollOption;
                              totalVotes.value++;
                              onVoted(votedOption.value!, totalVotes.value);
                            },
                            splashColor: pollOptionsSplashColor,
                            borderRadius: pollOptionsBorderRadius ??
                                BorderRadius.circular(
                                  8,
                                ),
                            child: Container(
                              height: pollOptionsHeight,
                              width: pollOptionsWidth,
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                color: pollOptionsFillColor,
                                border: pollOptionsBorder ??
                                    Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                borderRadius: pollOptionsBorderRadius ??
                                    BorderRadius.circular(
                                      8,
                                    ),
                              ),
                              child: Center(
                                child: pollOption.title,
                              ),
                            ),
                          )),
                );
              }
            },
          ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '${totalVotes.value} $votesText',
              style: votesTextStyle ??
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Expanded(
              child: metaWidget ?? Container(),
            ),
          ],
        ),
      ],
    );
  }
}

class PollOption {
  PollOption({
    this.id,
    required this.title,
    required this.votes,
  });

  final int? id;
  final Widget title;
  final int votes;
}
