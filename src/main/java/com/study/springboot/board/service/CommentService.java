package com.study.springboot.board.service;

import com.study.springboot.board.mapper.CommentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentMapper commentMapper;
}
