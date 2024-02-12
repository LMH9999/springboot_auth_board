package com.study.springboot.board.service;

import com.study.springboot.board.dto.BoardDTO;
import com.study.springboot.board.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper boardMapper;
    public void save(BoardDTO boardDTO) {
        boardMapper.save(boardDTO);
    }
}
