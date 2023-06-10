import 'package:flutter/material.dart';


class WidgetOption extends StatefulWidget {
  final List<String> optionList;
  final ValueChanged<int> onOptionSelected;

  WidgetOption({required this.optionList, required this.onOptionSelected});

  @override
  _WidgetOptionState createState() => _WidgetOptionState();
}

class _WidgetOptionState extends State<WidgetOption> {
  int selectedOptionIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.optionList.map((option) {
        int optionIndex = widget.optionList.indexOf(option);
        return ListTile(
          title: Text(option),
          leading: Radio<int>(
            value: optionIndex,
            groupValue: selectedOptionIndex,
            onChanged: (value) {
              setState(() {
                selectedOptionIndex = value!;
              });
              widget.onOptionSelected(value!);
            },
          ),
        );
      }).toList(),
    );
  }
}


// class OptionWidget extends StatelessWidget {
//   final String optionText;
//   final bool isSelected;
//   final VoidCallback onTap;

//   OptionWidget({required this.optionText, required this.isSelected, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Text(optionText),
//       ),
//     );
//   }
// }
