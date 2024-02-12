package com.study.springboot.member.controller;

import com.study.springboot.member.dto.MemberDTO;
import com.study.springboot.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @PostMapping("/save")
    public ResponseEntity<?> save(@RequestBody MemberDTO memberDTO) {
        log.info(String.valueOf(memberDTO));
        memberService.save(memberDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body("회원가입 성공");
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody MemberDTO memberDTO, HttpSession session) {
        log.info(String.valueOf(memberDTO));

        MemberDTO loginResult = memberService.login(memberDTO);

        if (loginResult != null) {
            session.setAttribute("login", loginResult.getEmail());
            return ResponseEntity.status(HttpStatus.OK).body("로그인 성공");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("로그인 실패");
        }
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logout(HttpSession session) {
        session.invalidate();

        return ResponseEntity.status(HttpStatus.OK).body("로그아웃 성공");
    }

    
}
