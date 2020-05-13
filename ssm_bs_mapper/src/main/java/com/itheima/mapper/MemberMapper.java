package com.itheima.mapper;

import org.apache.ibatis.annotations.*;
import com.itheima.pojo.Member;
import com.itheima.pojo.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemberMapper {

    @Select("select * FROM member  where id=#{id}")
    Member findMemberById(int id);


    List<Member> findAll(@Param("map") HashMap<String, String> map);


    /**
     * 插入会员
     *
     * @param member
     * @return
     */
    @Insert("insert into member values (null,#{name},#{nickname},#{phoneNum},#{email})")
    int addMember(Member member);


    /**
     * 根据ID删除会员
     *
     * @param id
     * @return
     */
    @Delete("delete from member where id=#{id}")
    boolean deleteById(Integer id);


    /**
     * 更改会员信息
     *
     * @param member
     */
    @Update("update member set name=#{name},nickname=#{nickname},phoneNum=#{phoneNum},email=#{email} where id=#{id}")
    void updateMember(Member member);

    @Select("select * from product where id not in(select productId from member_product where memberId=#{memberId})")
    List<Product> findMemberByIdAndAllProduct(int memberId);


    /**
     * 根据会员Id查询所有已经添加的产品数据
     *
     * @param memberId
     * @return
     */
    @Select("select * from product where id in(select productId from member_product where memberId=#{memberId})")
    List<Product> findProductsByMemberId(int memberId);


    @Delete("delete from member_product where productId=#{productId}")
    int deleteProductById(int productId);


    /**
     * 多条件查询会员
     *
     * @param map
     * @return
     */
    List<Member> findMemberByMany(@Param("map") Map<String, String> map);


    /**
     * 查询会员名称
     *
     * @param name
     * @return
     */
    @Select("SELECT * FROM member where NAME=#{name}")
    Member findByName(String name);


    /**
     * 根据产品编号查询产品
     *
     * @param productNum
     * @return
     */
    @Select("select * from product where productNum like binary CONCAT('%' ,#{productNum}, '%') ")
    List<Product> findProductByProductNum(String productNum);

    @Delete("delete from member_product where memberId=#{memberId} and productId=#{productId}")
    void deleteProduct(@Param("memberId") Integer memberId, @Param("productId") Integer productId);

    /**
     * 添加产品给会员
     *
     * @param memberId
     * @param productIds
     */
    void addProductToMember(@Param("memberId") Integer memberId, @Param("productIds") List<Integer> productIds);

    /**
     * 查询会员未添加的产品
     *
     * @param memberId
     * @param map
     * @return
     */
    List<Product> findAllNoProductByMemberId(@Param("memberId") Integer memberId, @Param("map") HashMap<String, String> map);


    /**
     * 删除会员和产品(从中间表)
     *
     * @param memberId
     * @param productId
     */
    @Delete("delete from member_product where memberId=#{memberId} and productId=#{productId}")
    void delProductByMemberId(@Param("memberId") Integer memberId, @Param("productId") Integer productId);
}
