package com.itheima.mapper;

import com.itheima.pojo.Member;
import org.apache.ibatis.annotations.*;
import com.itheima.pojo.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ProductMapper {

    @Select(" SELECT * FROM product WHERE id=#{id}")
    Product findById(Integer id);


    @Insert("insert into product(productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) values(#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    int addProduct(Product product);


    @Delete("delete from product where id=#{id}")
    int deleteById(Integer id);


    @Update("update product set productNum=#{productNum},productName=#{productName},cityName=#{cityName},departureTime=#{departureTime},productPrice=#{productPrice},productDesc=#{productDesc} where id=#{id};")
    int updateProduct(Product product);


    @Select("select productNum from product where id=#{id}")
    String findIdByproductNum(Integer id);


    @Select("select productNum from product where productNum=#{productNum}")
    Product findByproductNum(@Param("productNum") String productNum);


    /**
     * 查询产品编号是否存在
     *
     * @param productNum
     * @return
     */
    @Select("SELECT * FROM product WHERE productNum=#{productNum}")
    Product checkProductNum(String productNum);


    /**
     * 根据日期查询产品
     *
     * @param inputDate
     * @return
     */
    @Select("SELECT * FROM product WHERE DATE_FORMAT(DepartureTime,'%Y-%m')=#{inputDate}")
    List<Product> findProductByTime(String inputDate);

    @Select("SELECT * FROM member_product WHERE productId=#{productId}")
    List<Member> findProductByProductId(Integer productId);

    int findMemberByProductIds(@Param("productIds") List<Integer> productIds);

    int delSelected(@Param("ids") List<Integer> ids);

    List<Product> findAllNoProductPrice(@Param("map") Map map);

    List<Product> findAll(@Param("map") Map<String, String> map);
}