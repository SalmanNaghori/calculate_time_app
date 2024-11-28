import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:calculate_time_app/app_utils/common_widgets/common_appbar.dart';
import 'package:calculate_time_app/app_utils/constants/date_formats.dart';
import 'package:calculate_time_app/app_utils/storage/shared_pref_utils.dart';
import 'package:calculate_time_app/app_utils/utils/enum.dart';
import 'package:calculate_time_app/app_utils/utils/logger_util.dart';
import 'package:calculate_time_app/feature/calculate_time/model/calculate_time_model.dart';
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
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    onChange: (value) {
      // debugPrint('onChange $value')
    },
    onChangeRawSecond: (value) {
      debugPrint('onChangeRawSecond $value');
    },
    onChangeRawMinute: (value) {
      debugPrint('onChangeRawMinute $value');
    },
    onStopped: () {
      debugPrint('onStop');
    },
    onEnded: () {
      debugPrint('onEnded');
    },
  );

  // Variable
  int _storedDuration = 0; // Store duration in milliseconds
  final List<CalculateTimeModel> listOfTime = [];
  CheckStatus? checkTimeStatus;

  // ValueNotifier
  final ValueNotifier<bool> isScreenRefresh = ValueNotifier(false);

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
      final difference = now.difference(storedTime).inMilliseconds;

      // Convert the difference to milliseconds for the stopwatch
      _storedDuration = difference;

      // Convert milliseconds to a Duration
      final duration = Duration(milliseconds: _storedDuration);

      // Format the duration as hours:minutes:seconds
      final formattedTime = [
        duration.inHours,
        duration.inMinutes.remainder(60),
        duration.inSeconds.remainder(60),
      ].map((seg) => seg.toString().padLeft(2, '0')).join(':');

      // Print the formatted time
      debugPrint("Stored Duration: $formattedTime");
      logger.f("Stored Duration: $formattedTime");
      // Start the stopwatch from the stored duration
      _stopWatchTimer.setPresetTime(mSec: _storedDuration);
      _stopWatchTimer.onStartTimer();
      checkTimeStatus = CheckStatus.checkOut;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isScreenRefresh,
        builder: (_, value, __) {
          return Scaffold(
            appBar: CommonAppbar(
              title: "Data".textView(),
              actions: [
                GestureDetector(onTap: () {}, child: const Icon(Icons.history))
              ],
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
                      final adjustedValue = value;
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
                                            AppDateFormats
                                                .dateFormatYYYYMMSSHHMMSS,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () async {
          if (checkTimeStatus == CheckStatus.checkIn ||
              checkTimeStatus == null) {
            // Start action
            _stopWatchTimer.onStartTimer();
            final now = DateTime.now();
            SharedPrefUtils.setTime(now);

            CalculateTimeModel calculateTimeModel = CalculateTimeModel()
              ..date = now.toString()
              ..id = now.millisecondsSinceEpoch.toString()
              ..status = CheckStatus.checkIn;
            listOfTime.add(calculateTimeModel);

            checkTimeStatus = CheckStatus.checkOut;
          } else if (checkTimeStatus == CheckStatus.checkOut) {
            // Stop action
            _stopWatchTimer.onStopTimer();
            final now = DateTime.now();
            CalculateTimeModel calculateTimeModel = CalculateTimeModel()
              ..date = now.toString()
              ..id = now.millisecondsSinceEpoch.toString()
              ..status = CheckStatus.checkOut;

            SharedPrefUtils.setTime(now);
            listOfTime.add(calculateTimeModel);

            checkTimeStatus = CheckStatus.checkIn;
          }
          isScreenRefresh.value = !isScreenRefresh.value; // Refresh the screen
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Container(
            key: ValueKey(checkTimeStatus),
            height: Dimensions.screenHeight() * 0.07,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: (checkTimeStatus == CheckStatus.checkIn ||
                      checkTimeStatus == null)
                  ? AppColor.blueColor
                  : AppColor.cancelRedColor,
              borderRadius: BorderRadius.circular(Dimensions.r8),
            ),
            child: Text(
              (checkTimeStatus == CheckStatus.checkIn ||
                      checkTimeStatus == null)
                  ? 'Start'
                  : 'Stop',
              style:
                  context.fontStyleBold18?.copyWith(color: AppColor.whiteColor),
            ),
          ),
        ),
      ),
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
