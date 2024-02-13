package com.study.springboot.board.controller;

import com.study.springboot.board.dto.CommentDTO;
import com.study.springboot.board.service.CommentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentController {
    private final CommentService commentService;

    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@Valid @RequestBody CommentDTO commentDTO) {
        commentService.save(commentDTO);
        return null;
    }
}
