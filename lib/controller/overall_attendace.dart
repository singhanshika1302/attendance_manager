import 'package:edumarshals/Model/student_attendance_data_model.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/repository/overall_attendance_repository.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  final AttendanceRepository _repository = AttendanceRepository();
  List<StudentAttendanceData>? _attendanceDataList;
  int _totalClasses = 0;
  int _totalPresentClasses = 0;
  // List<> responseData = ''.obs; // Using Observable to update UI when data changes

  //.............calling attendance repository ...................................//
  Future<void> _fetchAttendanceData() async {
    List<StudentAttendanceData>? attendanceDataList =
        await _repository.fetchAttendance();
    int totalClasses = 0;
    int totalPresentClasses = 0;
//...............function to store total present and total classes .............//
    if (attendanceDataList != null) {
      for (var data in attendanceDataList) {
        totalClasses += data.totalClasses ?? 0;
        totalPresentClasses += data.totalPresent ?? 0;
        _attendanceDataList = attendanceDataList;
      _totalClasses = totalClasses;
      print('totalclasses${_totalClasses}');
      // PreferencesManager.totalclasses=_totalClasses;
      // print('totalPresentClasses${_totalPresentClasses}');
      _totalPresentClasses = totalPresentClasses;

      PreferencesManager().totalclasses = _totalClasses;
      PreferencesManager().presentclasses = _totalPresentClasses;

      print('totalPresentClasses${_totalPresentClasses}');
      }
    }
    // setState(() {
    //   _attendanceDataList = attendanceDataList;
    //   _totalClasses = totalClasses;
    //   print('totalclasses${_totalClasses}');
    //   // PreferencesManager.totalclasses=_totalClasses;
    //   // print('totalPresentClasses${_totalPresentClasses}');
    //   _totalPresentClasses = totalPresentClasses;

    //   PreferencesManager().totalclasses = _totalClasses;
    //   PreferencesManager().presentclasses = _totalPresentClasses;

    //   print('totalPresentClasses${_totalPresentClasses}');

    //   // print('dfghj $attendanceDataList');
    //   // PreferencesManager.totalclasses=_totalClasses;
    // });
  }
}
