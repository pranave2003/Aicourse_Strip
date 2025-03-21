import 'package:course_connect/Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Accept_Landloard_wrapper extends StatelessWidget {
  const Accept_Landloard_wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LandloardAuthBloc>(
      create: (context) => LandloardAuthBloc()
        ..add(
          FetchLandloards(searchQuery: null, status: "1"),
        ),
      child: Accept_Landloard(),
    );
  }
}

class Accept_Landloard extends StatefulWidget {
  const Accept_Landloard({super.key});

  @override
  State<Accept_Landloard> createState() => _Accept_LandloardState();
}

class _Accept_LandloardState extends State<Accept_Landloard> {
  @override
  Widget build(BuildContext context) {
    return _buildLandlordTable();
  }

  Widget _buildLandlordTable() =>
      BlocConsumer<LandloardAuthBloc, LandloardAuthState>(
        listener: (context, state) {
          if (state is Acceptorrejectstate) {
            context
                .read<LandloardAuthBloc>()
                .add(FetchLandloards(searchQuery: null, status: "1"));
          }
        },
        builder: (context, state) {
          if (state is LandloardessLoading) {
            return Center(child: Loading_Widget());
          } else if (state is Landloardfailfailerror) {
            return Text("${state.error.toString()}");
          }
          if (state is Landloaredloaded) {
            if (state.landloareds.isEmpty) {
              // Return "No data found" if txhe list is empty
              return Center(
                child: Text(
                  "No data found",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey.shade300),
                columnSpacing: 45,
                dataRowMaxHeight: 100,
                decoration: BoxDecoration(color: Colors.white),
                columns: [
                  _buildColumn('S/NO'),
                  _buildColumn('Name'),
                  _buildColumn('Email'),
                  _buildColumn('Phone number'),
                  _buildColumn('Address'),
                  _buildColumn('Gender'),
                  _buildColumn('ID proof'),
                  _buildColumn('Action'),
                ],
                rows: List.generate(
                  state.landloareds.length,
                  (index) {
                    final landlord = state.landloareds[index];
                    return DataRow(
                      cells: [
                        DataCell(Text("${index + 1}",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text(landlord.name.toString())),
                        DataCell(Text(landlord.email.toString())),
                        DataCell(Text(landlord.phone.toString())),
                        DataCell(SizedBox(
                          width: 200,
                          child:
                              Text(landlord.Adress.toString(), softWrap: true),
                        )),
                        DataCell(Text(landlord.gender.toString())),
                        DataCell(Text(landlord.Onesignal_id.toString())),
                        DataCell(Row(
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.red, width: 2),
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                              ),
                              onPressed: () {
                                context.read<LandloardAuthBloc>().add(
                                    AcceptOrRejectLandloard(
                                        Landloaredid: landlord.uid,
                                        Status: "2"));
                              },
                              child: Text(
                                "Reject",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                      ],
                    );
                  },
                ),
              ),
            );
          }
          return SizedBox();
        },
      );

  DataColumn _buildColumn(String label) {
    return DataColumn(
      label: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
