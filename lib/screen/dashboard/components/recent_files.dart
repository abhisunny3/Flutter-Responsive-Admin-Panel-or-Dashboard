import 'package:admin_panel_dashboard/models/RecentFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(label: Text("File name")),
                  DataColumn(label: Text("Date")),
                  DataColumn(label: Text("Size")),
                ],
                rows: List.generate(demoRecentFiles.length,
                    (index) => recentFileDataRow(demoRecentFiles[index]))),
          )
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile info) {
  return DataRow(cells: [
    DataCell(Row(
      children: [
        SvgPicture.asset(
          info.icon,
          height: 30,
          width: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(info.title),
        )
      ],
    )),
    DataCell(Text(info.date)),
    DataCell(Text(info.size)),
  ]);
}
