package com.study.springboot.member.service;

import com.study.springboot.member.dto.MemberDTO;
import com.study.springboot.member.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper memberMapper;
    public void save(MemberDTO memberDTO) {
        memberMapper.save(memberDTO);
    }
}
