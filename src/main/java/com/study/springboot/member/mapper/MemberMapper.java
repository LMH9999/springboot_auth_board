package com.study.springboot.member.mapper;

import com.study.springboot.member.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    void save(MemberDTO memberDTO);
}
