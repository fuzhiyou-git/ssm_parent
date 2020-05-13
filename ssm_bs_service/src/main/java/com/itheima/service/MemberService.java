package com.itheima.service;

import com.github.pagehelper.PageInfo;
import com.itheima.pojo.Member;
import com.itheima.pojo.Product;

import java.util.HashMap;
import java.util.List;

public interface MemberService {


    PageInfo<Member> findAllByPage(Integer page, Integer pageSize, HashMap<String, String> map);

    boolean addMember(Member member);

    boolean deleteById(Integer id);

    void delSelected(String[] ids);

    Member findMemberById(String id);

    boolean updateMember(Member member);

    boolean addProductToMember(Integer memberId, List<Integer> ids);

    PageInfo<Product> findProductsByMemberId(Integer id, Integer page, Integer pageSize);

    boolean deleteProductById(String productId);


    boolean findByName1(String memberName);


    PageInfo<Member> findAllNoProductByMemberId(Integer page, Integer pageSize, Integer id, HashMap<String, String> map);

    boolean delProductByMemberId(Integer memberId, Integer productId);
}
