package com.itheima.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    public static String dateToStr(Date date, String patt) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(patt);
        String format = simpleDateFormat.format(date);
        return format;
    }

    public static Date strToDate(String str) throws Exception {

        if (str != null && "" != str) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

            Date date = simpleDateFormat.parse(str);
            return date;
        }
        return null;


    }

}
