import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/teachers/Salary_Screen/model/salary_model.dart';

class DetailedSalaryScreen extends StatelessWidget {
  final SalaryData salaryData;

  const DetailedSalaryScreen({Key? key, required this.salaryData})
      : super(key: key);

  static const routeName = 'DetailedSalaryScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Details'),
        centerTitle: true,
      ),
      backgroundColor: kOtherColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Receipt No', salaryData.receiptNo, isBold: true),
            _buildDetailRow('Month', salaryData.month),
            _buildDetailRow('Payment Date', salaryData.date),
            _buildDetailRow('Total Amount', '₹ ${salaryData.totalAmount}',
                isBold: true),
            const Divider(height: 2),
            _buildDetailRow('Salary Breakdown', '', isBold: true),
            _buildDetailRow('Basic Salary', '₹ ${salaryData.basicSalary}'),
            _buildDetailRow('Allowances', '₹ ${salaryData.allowances}'),
            _buildDetailRow('Deductions', '₹ ${salaryData.deductions}'),
            // Add other salary breakdown details
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,color: kTextBlackColor),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 18,color: kTextBlackColor),
          ),
        ],
      ),
    );
  }
}
