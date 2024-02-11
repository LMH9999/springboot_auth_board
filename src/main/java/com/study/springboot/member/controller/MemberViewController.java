package com.study.springboot.member.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberViewController {

    //회원가입 페이지
    @GetMapping("/save")
    public String saveForm() {
        return "member/save";
    }


}
