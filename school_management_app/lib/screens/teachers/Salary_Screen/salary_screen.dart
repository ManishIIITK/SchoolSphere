import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/teachers/Salary_Screen/data/salary_data.dart';
import 'package:school_management_app/screens/teachers/Salary_Screen/detail_salary_screen.dart';
import 'package:school_management_app/screens/teachers/Salary_Screen/widgets/salary_widget.dart';

class SalaryScreen extends StatelessWidget {
  const SalaryScreen({super.key});

  static String routeName = 'SalaryScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  topRight: Radius.circular(kDefaultPadding),
                ),
                color: kOtherColor,
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(kDefaultPadding),
                itemCount: salary.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: kDefaultPadding),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(kDefaultPadding),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: kTextLightColor, blurRadius: 2.0),
                            ],
                          ),
                          child: Column(
                            children: [
                              SalaryDetailsRow(
                                title: "Receipt No",
                                statusValue: salary[index].receiptNo,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                                child: Divider(
                                  thickness: 1.0,
                                ),
                              ),
                              SalaryDetailsRow(
                                title: "Month",
                                statusValue: salary[index].month,
                              ),
                              sizedBox,
                              SalaryDetailsRow(
                                title: "Payment Date",
                                statusValue: salary[index].date,
                              ),
                              sizedBox,
                              const SizedBox(
                                height: kDefaultPadding,
                                child: Divider(
                                  thickness: 1.0,
                                ),
                              ),
                              SalaryDetailsRow(
                                title: "Total Amount",
                                statusValue: "₹ ${salary[index].totalAmount}",
                              ),
                            ],
                          ),
                        ),
                        SalaryButton(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, DetailedSalaryScreen.routeName);
                            },
                            iconData: Icons.arrow_forward_outlined,
                            title: salary[index].btn),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
