package com.study.springboot.member.controller;

import com.study.springboot.member.dto.MemberDTO;
import com.study.springboot.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @PostMapping("/save")
    public ResponseEntity<?> save(@RequestBody MemberDTO memberDTO){
        log.info(String.valueOf(memberDTO));
        memberService.save(memberDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body("회원가입 성공");
    }
}
