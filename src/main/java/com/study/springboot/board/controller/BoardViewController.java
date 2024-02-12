package com.study.springboot.board.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardViewController {

    @GetMapping
    public String list() {
        return "board/list";
    }

    @GetMapping("/save")
    public String saveForm(){
        return "board/save";
    }
}
