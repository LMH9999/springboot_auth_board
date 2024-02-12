package com.study.springboot.member.service;

import com.study.springboot.member.dto.MemberDTO;
import com.study.springboot.member.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper memberMapper;
    public void save(MemberDTO memberDTO) {
        memberMapper.save(memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        //입력한 이메일로 DB에서 조회
        MemberDTO loginMember = memberMapper.findByEmail(memberDTO.getEmail());
        log.info(String.valueOf(loginMember));

        if (loginMember != null) {
            //조회 결과가 있다
            if (memberDTO.getPassword().equals(loginMember.getPassword())) {
                //비밀번호 일치
                return loginMember;
            } else {
                //비밀번호 불일치
                return null;
            }
        } else {
            //조회 결과가 없다
            return null;
        }

    }

    public String emailCheck(String email) {
        MemberDTO checkMember = memberMapper.findByEmail(email);
        if (checkMember != null) {
            //조회 결과가 있다 -> 사용할 수 없다.
            return null;
        } else {
            //조회 결과가 없다 -> 사용할 수 있다.
            return "ok";
        }

    }
}
