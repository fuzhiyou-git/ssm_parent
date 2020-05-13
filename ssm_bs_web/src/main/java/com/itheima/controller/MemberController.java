package com.itheima.controller;


import com.github.pagehelper.PageInfo;
import com.itheima.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.itheima.service.MemberService;

import javax.servlet.http.HttpServletRequest;

import java.util.*;


@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;


    /**
     * 添加会员
     *
     * @param member
     * @return
     */
    @RequestMapping("/addMember")
    @ResponseBody
    public boolean addMember(Member member) {
        return memberService.addMember(member);

    }


    /**
     * 根据id查询会员
     *
     * @param id
     * @return
     */
    @RequestMapping("/findById/{id}")
    public String findMemberById(@PathVariable String id, Model model) {

        model.addAttribute("member", memberService.findMemberById(id));
        return "member/member-update";
    }


    @RequestMapping("/updateMember")
    @ResponseBody
    public boolean updateMember(Member member) {
        return memberService.updateMember(member);

    }


    /**
     * 删除一个会员
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteById")
    @ResponseBody
    //@Secured({"ROLE_MEMBER", "ROLE_ADMIN"}) //只有拥有MEMBER和ADMIN这两个角色的用户才可以删除会员
    public boolean deleteById(Integer id) {
        return memberService.deleteById(id);
    }


    /**
     * 根据会员Id查询已经添加的产品
     *
     * @param id
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/findProductsByMemberId")
    @ResponseBody
    public PageInfo<Product> findProductsByMemberId(Integer id, Integer page, Integer pageSize) {
        return memberService.findProductsByMemberId(id, page, pageSize);

    }


    /**
     * 删除会员的产品
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteProductById")
    @ResponseBody
    public boolean deleteProductById(String id) {
        return memberService.deleteProductById(id);

    }


    //查询所有的会员信息
    @RequestMapping("/findAllMember")
    @ResponseBody
    // @Secured({"ROLE_ADMIN", "ROLE_MEMBER"}) //超管，普通用户，产品管理员可见
    public PageInfo<Member> findAllMember(Integer page, Integer pageSize, String email, String phoneNum, String name) {
        HashMap<String, String> map = new HashMap<>();
        map.put("email", email);
        map.put("phoneNum", phoneNum);
        map.put("name", name);
        return memberService.findAllByPage(page, pageSize, map);

    }

    /**
     * 检查添加的会员名是否存在
     *
     * @param memberName
     * @return
     */
    @RequestMapping("/checkMemberName")
    @ResponseBody
    public boolean checkUsername(String memberName) {
        //去空格处理
        if (memberName.contains(" ")) {
            memberName = memberName.replaceAll(" +", "");
        }
        return memberService.findByName1(memberName);
    }

    //页面跳转
    @RequestMapping("/toMember")
    public String toMember(String pwd) {
        return "member/member-" + pwd;
    }

    /**
     * 根据会员id查询未添加的产品功能的实现
     *
     * @param memberId
     * @return
     */
    @RequestMapping("/toMember_Product/{memberId}")
    public String findAllNoProductByMemberId(@PathVariable String memberId, Model model) {
        Member member = memberService.findMemberById(memberId);
        model.addAttribute("member", member);
        return "member/member-product-add";

    }

    /**
     * 根据会员id添加产品功能的实现
     *
     * @param memberId
     * @param productIds
     * @return
     */
    @RequestMapping("/addProductToMember/{memberId}")
    @ResponseBody
    public boolean addProductToMember(@PathVariable Integer memberId, @RequestBody List<Integer> productIds) {
        return memberService.addProductToMember(memberId, productIds);

    }


    /**
     * 查询会员未添加的产品
     *
     * @param page
     * @param pageSize
     * @param id
     * @param productNum
     * @param productName
     * @return
     */
    @RequestMapping("/findAllNoProductByMemberId")
    @ResponseBody
    public PageInfo<Member> findAllNoProductByMemberId(Integer page, Integer pageSize, Integer id, String productNum, String productName) {
        HashMap<String, String> map = new HashMap<>();
        map.put("productNum", productNum);
        map.put("productName", productName);
        return memberService.findAllNoProductByMemberId(page, pageSize, id, map);

    }


    /**
     * 删除会员和产品
     *
     * @param memberId
     * @param productId
     * @return
     */
    @RequestMapping("/delProductByMemberId")
    @ResponseBody
    public boolean delProductByMemberId(Integer memberId, Integer productId) {
        return memberService.delProductByMemberId(memberId, productId);

    }

}