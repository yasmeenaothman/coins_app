import 'package:coins_app/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_fake.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key, required this.searchOperation}) : super(key: key);
  Function searchOperation;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        style: AppTextStyles.swissraBoldBlack8.copyWith(fontSize: 11),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: 'البحث',
          hintStyle: AppTextStyles.swissraBoldWhite10.copyWith(color: Colors.grey),
        ),
        onChanged: (text)=>searchOperation(text)

      ),
    );
  }
}
