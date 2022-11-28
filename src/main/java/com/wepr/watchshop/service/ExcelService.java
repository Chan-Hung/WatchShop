package com.wepr.watchshop.service;


import com.wepr.watchshop.model.Order;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Currency;
import java.util.List;
import java.util.Locale;

public class ExcelService {
    public void printExcel(List<Order> orders) throws IOException {
        XSSFWorkbook workbook = new XSSFWorkbook();

        Sheet sheet = workbook.createSheet("Doanh thu Watchshop");
        for (int i = 0; i < 2; i++)
            sheet.setColumnWidth(i, 3000);
        sheet.setColumnWidth(2, 4000);
        sheet.setColumnWidth(3, 4000);
        sheet.setColumnWidth(4, 5000);
        sheet.setColumnWidth(5, 6000);

        Row header = sheet.createRow(0);

        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFillForegroundColor(IndexedColors.LIGHT_TURQUOISE.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        headerStyle.setWrapText(true);

        XSSFFont font = workbook.createFont();
        font.setFontName("Arial");
        font.setFontHeightInPoints((short) 13);
        font.setBold(true);
        headerStyle.setFont(font);

        Cell headerCell = header.createCell(0);
        headerCell.setCellValue("Họ");
        headerCell.setCellStyle(headerStyle);
        headerCell = header.createCell(1);
        headerCell.setCellValue("Tên");
        headerCell.setCellStyle(headerStyle);

        headerCell = header.createCell(2);
        headerCell.setCellValue("Số điện thoại");
        headerCell.setCellStyle(headerStyle);

        headerCell = header.createCell(3);
        headerCell.setCellValue("Phí vận chuyển");
        headerCell.setCellStyle(headerStyle);

        headerCell = header.createCell(4);
        headerCell.setCellValue("Tổng giá trị đơn hàng");
        headerCell.setCellStyle(headerStyle);

        CellStyle style = workbook.createCellStyle();
        style.setWrapText(true);

        CellStyle dataStyle = workbook.createCellStyle();

        XSSFFont dataFont = workbook.createFont();
        font.setFontName("Times New Roman");
        font.setFontHeightInPoints((short) 16);
        font.setBold(false);
        dataStyle.setFont(dataFont);

        //Format Currencyd
        Locale locale = new Locale("vi", "VN");
        Currency currency = Currency.getInstance("VND");
        DecimalFormatSymbols df = DecimalFormatSymbols.getInstance(locale);
        df.setCurrency(currency);
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
        numberFormat.setCurrency(currency);

        Long sumDoanhThu = 0L;
        for (short rowIndex = 0; rowIndex < orders.size(); rowIndex++) {
            Row row = sheet.createRow(rowIndex + 1);
            Order order = orders.get(rowIndex);
            for (int colIndex = 0; colIndex < 5; colIndex++) {

                Cell cell = row.createCell(colIndex);
                cell.setCellStyle(dataStyle);

                if (colIndex == 0) cell.setCellValue((order.getLastName()));
                else if (colIndex == 1) cell.setCellValue(order.getFirstName());
                else if (colIndex == 2) cell.setCellValue(order.getPhoneNumber());
                else if (colIndex == 3) cell.setCellValue(numberFormat.format(order.getShippingFee()));
                else cell.setCellValue(order.getTotal());

            }
            sumDoanhThu += order.getTotal();
        }

        Row row = sheet.createRow(orders.size() + 1);
        Cell cell3 = row.createCell(3);
        cell3.setCellValue("Tổng doanh thu: ");
        cell3.setCellStyle(dataStyle);

        Cell cell4 = row.createCell(4);
        cell4.setCellStyle(dataStyle);
        cell4.setCellValue(numberFormat.format(sumDoanhThu));

        File currDir = new File(".");

        String path = "D:\\HK1_2022-2023\\WEPR\\Revenue\\" + LocalDate.now()+" ";
        String fileLocation = path.substring(0, path.length() - 1)  +"-DoanhThu.xlsx";

        FileOutputStream outputStream = new FileOutputStream(fileLocation);
        workbook.write(outputStream);
        workbook.close();



    }
}
