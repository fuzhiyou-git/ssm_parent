package com.itheima.service;

import com.github.pagehelper.PageInfo;
import com.itheima.pojo.Product;

import java.util.HashMap;
import java.util.List;

public interface ProductService {
    boolean addProduct(Product product);

    PageInfo<Product> findAllByPage(Integer page, Integer pageSize, HashMap map);

    boolean deleteById(Integer ordersId);

    boolean delSelected(List<Integer> ids);

    Product findById(String id);

    boolean updateProduct(Product product);



    boolean checkProductNum(String productNum);

    List<Product> findProductByTime(String inputDate);
}
