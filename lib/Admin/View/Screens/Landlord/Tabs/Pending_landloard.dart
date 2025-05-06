import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_connect/Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pending_Landloard_wrapper extends StatelessWidget {
  const Pending_Landloard_wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LandloardAuthBloc>(
      create: (context) => LandloardAuthBloc()
        ..add(
          FetchLandloards(searchQuery: null, status: "0"),
        ),
      child: PendingLandloard(),
    );
  }
}

class PendingLandloard extends StatefulWidget {
  const PendingLandloard({super.key});

  @override
  State<PendingLandloard> createState() => _PendingLandloardState();
}

class _PendingLandloardState extends State<PendingLandloard> {
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
                .add(FetchLandloards(searchQuery: null, status: "0"));
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
                  "No new users registered.",
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
                  _buildColumn('Accept/Reject'),
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
                        DataCell(Text(landlord.phone_number.toString())),
                        DataCell(SizedBox(
                          width: 200,
                          child:
                          Text(landlord.Adress.toString(), softWrap: true),
                        )),
                        DataCell(Text(landlord.gender.toString())),
                        DataCell(
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: GestureDetector(
                                  onTap: () {
                                    _showProofDialog(context, landlord.idproofimage.toString());
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: landlord.idproofimage.toString(),
                                    width: 100,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      width: 50,
                                      height: 50,
                                      color: Colors.grey[300],
                                      child: Center(child: Loading_Widget()),
                                    ),
                                    errorWidget: (context, url, error) => Container(
                                      width: 50,
                                      height: 50,
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 50,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        DataCell(Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.read<LandloardAuthBloc>().add(
                                      AcceptOrRejectLandloard(
                                          Landloaredid: landlord.uid,
                                          Status: "1"));
                                },
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.green,
                                )),
                            SizedBox(
                              width: 50,
                            ),
                            IconButton(
                                onPressed: () {
                                  context.read<LandloardAuthBloc>().add(
                                      AcceptOrRejectLandloard(
                                          Landloaredid: landlord.uid,
                                          Status: "2"));
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                )),
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
void _showProofDialog(BuildContext context, String imageUrl) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('View Proof Image'),
          content: Container(
            width: 600, // Adjust the width
            height: 900, // Adjust the height
            child: InteractiveViewer(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => Center(child: Loading_Widget()),
                errorWidget: (context, url, error) => Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 60,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );},
      );
  }
