package com.itheima.controller;

import com.itheima.pojo.Product;
import com.itheima.service.ProductService;
import com.itheima.util.DateUtils;
import com.itheima.util.DownloadUtil;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.List;

@Controller
@RequestMapping("/excel")
public class ExcelController {
    @Autowired
    private ProductService productService;

    @Autowired
    private HttpSession session;

    @Autowired
    private HttpServletResponse response;

    //去产品导出页面
    @RequestMapping("/toProductExcel")
    public String toProductExcel() {
        return "product/excel-product";
    }

    @RequestMapping("/printExcel")
    public void printExcel(String inputDate) throws Exception {
        //第一步：创建工作簿、创建工作表
        InputStream in =
                session.getServletContext().
                        getResourceAsStream("/make/xlsprint/tOUTPRODUCT.xlsx");
        Workbook workbook = new XSSFWorkbook(in);
        Sheet sheet = workbook.getSheetAt(0);

        // 第二步： 获取第一行
        Row row = sheet.getRow(0);
        Cell cell = row.getCell(1);
        //指定第一行标题行的内容:2012-08  --->  2012年8月份出货表
        String value = inputDate.replace("-0", "-").replace("-", "年") + "月份产品表";
        cell.setCellValue(value);

        // 第三步： 获取第三行样式
        row = sheet.getRow(2);
        CellStyle[] cellStyles = new CellStyle[7];
        for (int i = 0; i < cellStyles.length; i++) {
            cellStyles[i] = row.getCell(i + 1).getCellStyle();
        }

        // 第四步： 调用service查询、导出数据行
        List<Product> list =
                productService.findProductByTime(inputDate);
        if (list != null && list.size() > 0) {
            int index = 2;
            for (Product cp : list) {
                row = sheet.createRow(index++);
                cell = row.createCell(1);
                cell.setCellValue(cp.getProductNum());
                cell.setCellStyle(cellStyles[0]);

                cell = row.createCell(2);
                cell.setCellValue(cp.getProductName());
                cell.setCellStyle(cellStyles[1]);

                cell = row.createCell(3);
                cell.setCellValue(cp.getCityName());
                cell.setCellStyle(cellStyles[2]);

                cell = row.createCell(4);
                cell.setCellValue(DateUtils.dateToStr(cp.getDepartureTime(), "yyyy-MM-dd HH:mm"));
                cell.setCellStyle(cellStyles[3]);

                cell = row.createCell(5);
                cell.setCellValue(cp.getProductPrice() + "元");
                cell.setCellStyle(cellStyles[4]);

                cell = row.createCell(6);
                cell.setCellValue(cp.getProductDesc());
                cell.setCellStyle(cellStyles[5]);

                cell = row.createCell(7);
                cell.setCellValue(cp.getProductStatusStr());
                cell.setCellStyle(cellStyles[6]);
            }
        }

        // 第五步：导出下载
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        workbook.write(bos);
        new DownloadUtil().download(bos, response, "产品详情表.xlsx");
    }

    //大标题的样式
    public CellStyle bigTitle(Workbook wb) {
        CellStyle style = wb.createCellStyle();
        Font font = wb.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) 16);
        font.setBold(true);//字体加粗
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);                //横向居中
        style.setVerticalAlignment(VerticalAlignment.CENTER);        //纵向居中
        return style;
    }

    //小标题的样式
    public CellStyle title(Workbook wb) {
        CellStyle style = wb.createCellStyle();
        Font font = wb.createFont();
        font.setFontName("黑体");
        font.setFontHeightInPoints((short) 12);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);                //横向居中
        style.setVerticalAlignment(VerticalAlignment.CENTER);        //纵向居中
        style.setBorderTop(BorderStyle.THIN);                        //上细线
        style.setBorderBottom(BorderStyle.THIN);                    //下细线
        style.setBorderLeft(BorderStyle.THIN);                        //左细线
        style.setBorderRight(BorderStyle.THIN);                        //右细线
        return style;
    }

    //文字样式
    public CellStyle text(Workbook wb) {
        CellStyle style = wb.createCellStyle();
        Font font = wb.createFont();
        font.setFontName("Times New Roman");
        font.setFontHeightInPoints((short) 10);

        style.setFont(font);

        style.setAlignment(HorizontalAlignment.LEFT);                //横向居左
        style.setVerticalAlignment(VerticalAlignment.CENTER);        //纵向居中
        style.setBorderTop(BorderStyle.THIN);                        //上细线
        style.setBorderBottom(BorderStyle.THIN);                    //下细线
        style.setBorderLeft(BorderStyle.THIN);                        //左细线
        style.setBorderRight(BorderStyle.THIN);                        //右细线

        return style;
    }
}
