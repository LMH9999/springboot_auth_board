package com.study.springboot.board.controller;

import com.study.springboot.board.dto.CommentDTO;
import com.study.springboot.board.service.CommentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentController {
    private final CommentService commentService;

    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@RequestBody CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        return null;
    }
}
