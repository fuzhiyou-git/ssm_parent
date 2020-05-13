package com.itheima.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itheima.mapper.MemberMapper;
import com.itheima.pojo.Member;
import com.itheima.pojo.Product;

import java.util.HashMap;
import java.util.List;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {


    @Autowired
    private MemberMapper memberMapper;


    /**
     * 查询所有产品
     *
     * @param page
     * @param pageSize
     * @param map
     * @return
     */
    @Override
    public PageInfo<Member> findAllByPage(Integer page, Integer pageSize, HashMap<String, String> map) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo(memberMapper.findAll(map));
    }

    /**
     * 添加会员
     *
     * @param member
     * @return
     */
    @Override
    public boolean addMember(Member member) {
        memberMapper.addMember(member);
        return true;

    }

    /**
     * 根据ID删除会员
     *
     * @param memberId
     * @return
     */
    @Override
    public boolean deleteById(Integer memberId) {
        //先删除会员的产品，
        //查询会员测产品
        List<Product> productList = memberMapper.findProductsByMemberId(memberId);
        if (productList.size() > 0) {
            for (Product product : productList) {
                memberMapper.deleteProduct(memberId, product.getId());
            }
        }
        //删除会员
        memberMapper.deleteById(memberId);
        return true;
    }

    @Override
    public void delSelected(String[] ids) {
        for (String id : ids) {
            memberMapper.deleteById(Integer.parseInt(id));
        }
    }

    @Override
    public Member findMemberById(String id) {
        return memberMapper.findMemberById(Integer.parseInt(id));
    }

    /**
     * 更该会员功能的实现
     *
     * @param member
     * @return
     */
    @Override
    public boolean updateMember(Member member) {

        //1.根据ID查询数据库中的会员名
        Member memberDB = memberMapper.findMemberById(member.getId());
        //1.1判断是否改变会员名
        if (memberDB != null && memberDB.getName().equals(member.getName())) {
            //1.2没改变会员名更新
            memberMapper.updateMember(member);
            return true;
        }
        //2.改变会员名更新
        //会员名去空格处理
        String memberNameUpdate = member.getName().replaceAll(" +", "");

        //2.1根据会员名查询是否存在这个会员
        Member memberDBName = memberMapper.findByName(memberNameUpdate);
        if (memberDBName == null) {
            memberMapper.updateMember(member);
            //2.3等于空，可以更新
            return true;
        }
        //2.4会员名已经存在
        return false;

    }

    @Override
    public boolean addProductToMember(Integer memberId, List<Integer> ids) {
        memberMapper.addProductToMember(memberId, ids);
        return true;
    }


    @Override
    public PageInfo<Product> findProductsByMemberId(Integer id, Integer page, Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo(memberMapper.findProductsByMemberId(id));
    }

    @Override
    public boolean deleteProductById(String productId) {
        return memberMapper.deleteProductById(Integer.parseInt(productId)) > 0;

    }

    /**
     * 查询会员名是否存在
     *
     * @param memberName
     * @return
     */
    @Override
    public boolean findByName1(String memberName) {
        return memberMapper.findByName(memberName) != null;
    }

    /**
     * 查询会员未添加的产品
     *
     * @param page
     * @param pageSize
     * @param id
     * @param map
     * @return
     */
    @Override
    public PageInfo<Member> findAllNoProductByMemberId(Integer page, Integer pageSize, Integer id, HashMap<String, String> map) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo(memberMapper.findAllNoProductByMemberId(id, map));
    }

    @Override
    public boolean delProductByMemberId(Integer memberId, Integer productId) {
        memberMapper.delProductByMemberId(memberId, productId);
        return true;
    }


}
