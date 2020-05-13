package com.itheima.controller;

import com.github.pagehelper.PageInfo;
import com.itheima.util.DateUtils;
import com.itheima.util.DownloadUtil;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.itheima.pojo.Product;
import com.itheima.service.ProductService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;


    /**
     * 添加产品信息
     *
     * @param product
     * @return
     */
    @RequestMapping("/addProduct")
    @ResponseBody
    public boolean addProduct(Product product) {
        return productService.addProduct(product);

    }

    /**
     * 删除产品
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteById")
    @ResponseBody
    public boolean deleteById(Integer id) {
        return productService.deleteById(id);
    }


    /**
     * 删除选中
     *
     * @param ids
     * @return
     */
    @RequestMapping("/delSelectedProduct")
    @ResponseBody
    public boolean delSelected(@RequestBody List<Integer> ids) {
        return productService.delSelected(ids);

    }

    @RequestMapping("/findById/{id}")
    public String findById(@PathVariable String id, Model model) {

        model.addAttribute("product", productService.findById(id));
        return "product/product-update";
    }

    //更新产品功能的实现;
    @RequestMapping("/updateProduct")
    @ResponseBody
    public boolean updateProduct(Product product) throws Exception {

        Date departureTime = DateUtils.strToDate(product.getDepartureTimeStr());
        product.setDepartureTime(departureTime);
        return productService.updateProduct(product);
    }


    /**
     * 查询所有的产品信息
     *
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/findAllProduct")
    @ResponseBody
    public PageInfo<Product> findAllProduct(Integer page, Integer pageSize,
                                            String cityName, String productName,
                                            String productPrice) {

        HashMap map = new HashMap();
        map.put("cityName", cityName);
        map.put("productPrice", productPrice);
        map.put("productName", productName);
        return productService.findAllByPage(page, pageSize, map);
    }

    /**
     * 跳转到首页
     *
     * @return
     */
    @RequestMapping("list")
    public String list() {
        return "product/product-list";
    }

    /**
     * 验证产品编号是否存在
     *
     * @param productNum
     * @return
     */
    @RequestMapping("/checkProductNum")
    @ResponseBody
    public boolean heckProductNum(String productNum) {
        return productService.checkProductNum(productNum);
    }


    @RequestMapping("add")
    public String add() {
        return "product/product-add";
    }

}
