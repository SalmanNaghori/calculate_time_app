import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:calculate_time_app/app_utils/constants/date_formats.dart';
import 'package:calculate_time_app/app_utils/storage/shared_pref_utils.dart';
import 'package:calculate_time_app/app_utils/utils/enum.dart';
import 'package:calculate_time_app/feature/calculate_time/model/calculate_time_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  int _storedDuration = 0; // Store duration in milliseconds
  final ValueNotifier<bool> isScreenRefresh = ValueNotifier(false);
  final List<CalculateTimeModel> listOfTime = [];
  CheckStatus? checkTimeStatus;

  @override
  void initState() {
    super.initState();
    _loadStoredTime();
    _stopWatchTimer.records.listen((value) => debugPrint('records $value'));
    _stopWatchTimer.fetchStopped
        .listen((value) => debugPrint('stopped from stream'));
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }





  Future<void> _loadStoredTime() async {
    final storedTime = SharedPrefUtils.getTime();
    if (storedTime != null) {
      final now = DateTime.now();
      final difference = now.difference(storedTime);

      // Convert the difference to milliseconds for the stopwatch
      _storedDuration = difference.inMilliseconds;


      // Start the stopwatch from the stored duration
      _stopWatchTimer.setPresetTime(mSec: _storedDuration);
      _stopWatchTimer.onStartTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isScreenRefresh,
        builder: (_, value, __) {
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
                      final adjustedValue = value + _storedDuration;
                      final displayTime =
                      StopWatchTimer.getDisplayTime(adjustedValue);

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
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listOfTime.length,
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
                                    changeDateFormat(
                                        listOfTime[index].date,
                                        AppDateFormats.dateFormatToday,
                                        AppDateFormats
                                            .dateFormatDDMMYYYYHHMM)
                                        .textView(
                                      style: context.fontStyleSemiBold18,
                                    ),
                                    Dimensions.h2.verticalSpace,
                                    "${checkStatus(listOfTime[index].status)}"
                                        .textView(
                                      style: context.fontStyleSemiBold16,
                                    ),
                                  ],
                                ).paddingOnly(left: Dimensions.w10),
                              ),
                              Icon(
                                listOfTime[index].status == CheckStatus.checkIn
                                    ? CupertinoIcons.arrow_down_left
                                    : CupertinoIcons.arrow_up_right,
                                size: Dimensions.w25,
                                color: listOfTime[index].status ==
                                    CheckStatus.checkIn
                                    ? AppColor.blueColor
                                    : AppColor.primaryColor,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // bottom
  Widget startStopButton() {
    return Row(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: checkTimeStatus != CheckStatus.checkOut
                  ? () async {
                _stopWatchTimer.onStartTimer();
                final now = DateTime.now();
                SharedPrefUtils.setTime(now);

                CalculateTimeModel calculateTimeModel =
                CalculateTimeModel()
                  ..date = now.toString()
                  ..id =
                  now.millisecondsSinceEpoch.toString()
                  ..status = CheckStatus.checkIn;
                listOfTime.add(calculateTimeModel);
                checkTimeStatus = CheckStatus.checkOut;
                isScreenRefresh.value = !isScreenRefresh.value;
              }
                  : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: Dimensions.screenHeight() * 0.07,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: checkTimeStatus == CheckStatus.checkIn
                      ? AppColor.blueColor
                      : AppColor.greyColor,
                  borderRadius: BorderRadius.circular(
                      checkTimeStatus == CheckStatus.checkIn
                          ? Dimensions.r15
                          : 8),
                ),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: checkTimeStatus != CheckStatus.checkIn
                  ? () {
                _stopWatchTimer.onStopTimer();
                CalculateTimeModel calculateTimeModel =
                CalculateTimeModel()
                  ..date = DateTime.now().toString()
                  ..id =
                  DateTime.now().millisecondsSinceEpoch.toString()
                  ..status = CheckStatus.checkOut;

                SharedPrefUtils.setTime(DateTime.now());
                listOfTime.add(calculateTimeModel);
                checkTimeStatus = CheckStatus.checkIn;

                isScreenRefresh.value = !isScreenRefresh.value;
              }
                  : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: Dimensions.screenHeight() * 0.07,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: checkTimeStatus == CheckStatus.checkOut
                      ? AppColor.blueColor
                      : AppColor.greyColor,
                  borderRadius: BorderRadius.circular(
                      checkTimeStatus == CheckStatus.checkOut
                          ? Dimensions.r15
                          : 8),
                ),
                child: const Text(
                  'Stop',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    )
        .paddingSymmetric(horizontal: Dimensions.w15)
        .paddingOnly(bottom: Dimensions.h10);
  }

  checkStatus(CheckStatus? status) {
    if (status == CheckStatus.checkIn) {
      return "in";
    } else {
      return "out";
    }
  }
}
