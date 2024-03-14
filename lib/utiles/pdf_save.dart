import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'global_var.dart';

void pdf() async {
  var pdf = pw.Document();
  var image = pw.MemoryImage(File("${g1.image}").readAsBytesSync());

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                "About Shop : ",
                style: pw.TextStyle(
                    color: PdfColors.black,
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 20),
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Text(
                "Shop Owner Name : Robbert Tall ",
                style: pw.TextStyle(
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              pw.Text(
                "E-mail : Dmart@.gmail.com ",
                style: pw.TextStyle(
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              pw.Text(
                "Address Name :  ",
                style: pw.TextStyle(
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              pw.Text(
                "Singanpur,Surat,Gujarat ",
                style: pw.TextStyle(
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              pw.Divider(
                thickness: 2,
                height: 20,
                color: PdfColors.black,
              ),
              pw.Divider(
                thickness: 2,
                height: 3,
                color: PdfColors.black,
              ),
              pw.Text(
                "Customer Details : ",
                style: pw.TextStyle(
                    color: PdfColors.black,
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 20),
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Center(
                child: pw.ClipOval(
                  child: g1.image != null
                      ? pw.SizedBox(
                          width: 100,
                          height: 100,
                          child: pw.Image(image, fit: pw.BoxFit.fill),
                        )
                      : pw.Container(
                          width: 100,
                          height: 100,
                          color: PdfColors.grey.shade(400),
                        ),
                ),
              ),
              pw.Text(
                "Customer Name : ${g1.name} ",
                style: pw.TextStyle(
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              pw.Text(
                "E-mail : ${g1.email} ",
                style: pw.TextStyle(
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              pw.Text(
                "Phone Number : ${g1.phone}  ",
                style: pw.TextStyle(
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              pw.Divider(
                thickness: 2,
                height: 20,
                color: PdfColors.black,
              ),
              pw.Divider(
                thickness: 2,
                height: 3,
                color: PdfColors.black,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    "Product Name ",
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    "Qty ",
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    "Price ",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              pw.Divider(
                thickness: 2,
                height: 20,
                color: PdfColors.black,
              ),
              pw.Divider(
                thickness: 2,
                height: 3,
                color: PdfColors.black,
              ),
              pw.Column(
                children: g1.l1
                    .map(
                      (e) => pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            "${e['protuct']}",
                            style: pw.TextStyle(
                              fontSize: 20,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${e['qty']} ",
                            style: pw.TextStyle(
                              fontSize: 20,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${e['price']}",
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    ),
  );
  final file = File("/storage/emulated/0/Download/example.pdf");
  await file.writeAsBytes(await pdf.save());
}
