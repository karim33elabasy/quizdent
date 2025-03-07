abstract class DateTimeFormatter{
  static String formatDate(DateTime date) {
    // Extract day, month, and year
    String day = date.day.toString().padLeft(2, '0'); // Ensure 2 digits
    String month = date.month.toString().padLeft(2, '0'); // Ensure 2 digits
    String year = date.year.toString();

    return "$day/$month/$year"; //28/02/2025
  }

  static String formatTime(DateTime date) {
    // Extract hour and minute
    String hour = date.hour.toString().padLeft(2, '0'); // Ensure 2 digits
    String minute = date.minute.toString().padLeft(2, '0'); // Ensure 2 digits

    return "$hour:$minute"; //21:00
  }

  static String getMonthName(DateTime date) {
    List<String> months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];

    return months[date.month - 1]; //Get the month name
  }

}