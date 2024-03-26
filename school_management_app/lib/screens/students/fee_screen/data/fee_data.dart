class FeeData {
  final String receiptNo;
  final String month;
  final String date;
  final String paymentStatus;
  final String totalAmount;
  final String btnStatus;

  FeeData(this.receiptNo, this.month, this.date, this.paymentStatus,
      this.totalAmount, this.btnStatus);
}

List<FeeData> fee = [
  FeeData('51', 'May', "5 May 2020", "Pending", '56000', "Pay Now"),
  FeeData('51', 'May', "5 April 2020", "Paid", '56000', "Download"),
  FeeData('51', 'May', "5 March 2020", "Paid", '56000', "Download"),
];
