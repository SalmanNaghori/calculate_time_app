import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:calculate_time_app/app_utils/constants/date_formats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CalculateTimeScreen extends StatefulWidget {
  const CalculateTimeScreen({super.key});

  @override
  CalculateTimeScreenState createState() => CalculateTimeScreenState();
}

class CalculateTimeScreenState extends State<CalculateTimeScreen> {
  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    onChange: (value) => debugPrint('onChange $value'),
    onChangeRawSecond: (value) => debugPrint('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => debugPrint('onChangeRawMinute $value'),
    onStopped: () {
      debugPrint('onStop');
    },
    onEnded: () {
      debugPrint('onEnded');
    },
  );

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // _stopWatchTimer.rawTime.listen(
    //   (value) =>
    //       debugPrint('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'),
    // );

    _stopWatchTimer.records.listen((value) => debugPrint('records $value'));
    _stopWatchTimer.fetchStopped.listen((value) => debugPrint('stopped from stream'));
    // _stopWatchTimer.fetchEnded
    //     .listen((value) => debugPrint('ended from stream'));

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  final ValueNotifier<List<String>> listOfTime = ValueNotifier([]);

  @override
  Future<void> dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up Timer'),
      ),
      bottomNavigationBar: startStopButton(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// Display stop watch time
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data!;
                final displayTime = StopWatchTimer.getDisplayTime(value, hours: _isHours);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        displayTime,
                        style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            // List of time
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: listOfTime,
                builder: (_, List<String> value, __) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listOfTime.value.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: Dimensions.h10),
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.w10,
                          vertical: Dimensions.h15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(Dimensions.r10),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: Dimensions.r20,
                              child: "${index + 1}".textView(
                                style: context.fontStyleBold18,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  changeDateFormat(listOfTime.value[index], AppDateFormats.dateFormatToday, AppDateFormats.dateFormatDDMMYYYYHHMM).textView(
                                    style: context.fontStyleSemiBold18,
                                  ),
                                  Dimensions.h2.verticalSpace,
                                  "in".textView(
                                    style: context.fontStyleSemiBold16,
                                  ),
                                ],
                              ).paddingOnly(left: Dimensions.w10),
                            ),
                            Icon(
                              CupertinoIcons.arrow_down_left,
                              size: Dimensions.w25,
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // bottom
  Widget startStopButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(
              onPressed: () {
                _stopWatchTimer.onStartTimer();
                listOfTime.value.add("${DateTime.now()}");
                listOfTime.notifyListeners();
              },
              child: const Text(
                'Start',
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilledButton(
              onPressed: () {
                _stopWatchTimer.onStopTimer();
                listOfTime.value.add("${DateTime.now()}");
                listOfTime.notifyListeners();
              },
              child: const Text(
                'Stop',
              ),
            ),
          ),
        ),
      ],
    ).paddingOnly(bottom: Dimensions.h10);
  }
}
