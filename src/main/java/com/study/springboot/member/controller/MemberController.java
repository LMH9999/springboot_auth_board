package com.study.springboot.member.controller;

import com.study.springboot.member.dto.MemberDTO;
import com.study.springboot.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @PostMapping("/save")
    public ResponseEntity<?> save(@RequestBody MemberDTO memberDTO){
        System.out.println("MemberController.save");
        System.out.println("memberDTO = " + memberDTO);
//        memberService.save(memberDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body("회원가입 성공");
    }
}
