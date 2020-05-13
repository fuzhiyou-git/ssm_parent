package com.itheima.pojo;

import com.itheima.util.DateUtils;
import lombok.*;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Product {
    private int id; // 主键
    private String productNum; // 编号 唯一
    private String productName; // 名称
    private String cityName; // 出发城市
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date departureTime; // 出发时间
    private String departureTimeStr;
    private float productPrice; // 产品价格
    private String productPriceStr; // 产品价格
    private String productDesc; // 产品描述
    private Integer productStatus; // 状态 0 关闭 1 开启
    private String productStatusStr;

    public String getProductPriceStr() {
        if (productPriceStr != null) {
            if (productPriceStr.contains(" ")) {
                return productPriceStr.replaceAll(" +", "");
            }

        }
        return productPriceStr;
    }

    public String getProductName() {
        if (productName != null) {
            if (productName.contains(" ")) {

                return productName.replaceAll(" +", "");
            }
        }
        return productName;
    }

    public String getCityName() {
        if (cityName != null) {
            if (cityName.contains(" ")) {
                return cityName.replaceAll(" +", "");
            }
        }
        return cityName;
    }

    public String getProductDesc() {

        if (productDesc != null) {
            if (productDesc.contains(" ")) {
                return productDesc.replaceAll(" +", "");
            }

        }
        return productDesc;
    }

    public String getDepartureTimeStr() {

        if (departureTime != null) {
            departureTimeStr = DateUtils.dateToStr(departureTime, "yyyy-MM-dd HH:mm");
        }
        return departureTimeStr;
    }

    public String getProductStatusStr() {

        if (productStatus != null) {
            if (productStatus == 0) {
                productStatusStr = "关闭";
            }
            if (productStatus == 1) {
                productStatusStr = "开启";
            }
        }
        return productStatusStr;
    }

}
