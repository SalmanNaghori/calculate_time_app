import 'package:calculate_time_app/app_utils/utils/enum.dart';

class CalculateTimeModel {
  String? id;
  String? date;
  CheckStatus? status;

  CalculateTimeModel({
    this.date,
    this.status,
    this.id,
  });

  @override
  String toString() {
    return 'CalculateTimeModel(id: $id, date: $date, status: $status)';
  }
}
