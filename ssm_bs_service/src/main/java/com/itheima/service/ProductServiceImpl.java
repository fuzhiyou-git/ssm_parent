package com.itheima.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.pojo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itheima.mapper.ProductMapper;
import com.itheima.pojo.Product;

import java.util.HashMap;
import java.util.List;

@Service()
@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;


    @Override
    public boolean addProduct(Product product) {
        productMapper.addProduct(product);
        return true;

    }

    /**
     * 查询所有产品
     *
     * @param page
     * @param pageSize
     * @param map
     * @return
     */
    @Override
    public PageInfo<Product> findAllByPage(Integer page, Integer pageSize, HashMap map) {
        PageHelper.startPage(page, pageSize);
        String productPrice = (String) map.get("productPrice");
        if ("".equals(productPrice.trim()) || productPrice.length() <= 0) {
            return new PageInfo(productMapper.findAllNoProductPrice(map));
        }

        map.put("productPrice", Double.valueOf(productPrice));
        map.put("productPrice_t", Double.valueOf(productPrice) * 2);
        return new PageInfo(productMapper.findAll(map));
    }

    /**
     * 删除产品
     *
     * @param productId
     * @return
     */
    @Override
    public boolean deleteById(Integer productId) {
        //查询产品是否有会员
        List<Member> memberList = productMapper.findProductByProductId(productId);
        if (memberList.size() > 0) {
            return false;
        }
        //没有会员购买，可以删除
        productMapper.deleteById(productId);
        return true;
    }

    /**
     * 删除选中产品
     *
     * @param productIds
     * @return
     */
    @Override
    public boolean delSelected(List<Integer> productIds) {
        //先判断是否有会员购买
        int count = productMapper.findMemberByProductIds(productIds);
        if (count > 0) {
            return false;
        }
        //没有会员购买可以删除
        productMapper.delSelected(productIds);
        return true;

    }

    @Override
    public Product findById(String id) {
        return productMapper.findById(Integer.parseInt(id));
    }

    @Override
    public boolean updateProduct(Product product) {
        String productNumDB = productMapper.findIdByproductNum(product.getId());
        //查询出是否改变产品编号
        if (productNumDB.equals(product.getProductNum()) && product.getProductNum() != null) {
            //1.没改变，可以更新
            return productMapper.updateProduct(product) > 0;
        } else {
            //改变产品编号，根据改变的产品编号查询是否存在产品编号
            Product productChange = productMapper.findByproductNum(product.getProductNum());
            if (productChange == null) {
                //产品不存在，可以修改
                return productMapper.updateProduct(product) > 0;
            }
            //产品编号存在
            return false;
        }
    }

    @Override
    public boolean checkProductNum(String productNum) {
        Product product = productMapper.checkProductNum(productNum);
        return product != null;
    }

    @Override
    public List<Product> findProductByTime(String inputDate) {
        return productMapper.findProductByTime(inputDate);
    }


}

