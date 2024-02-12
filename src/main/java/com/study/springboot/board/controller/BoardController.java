package com.study.springboot.board.controller;

import com.study.springboot.board.dto.BoardDTO;
import com.study.springboot.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;
    @PostMapping("/save")
    public ResponseEntity<?> save(@Valid @RequestBody BoardDTO boardDTO, Errors errors) {
        System.out.println("boardDTO = " + boardDTO + ", errors = " + errors);
        if (errors.hasErrors()){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errors.getAllErrors());
        }
        boardService.save(boardDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body("글작성 성공");
    }

    @PutMapping("/update")
    public ResponseEntity<?> update(@Valid @RequestBody BoardDTO boardDTO, Errors errors) {
        System.out.println("boardDTO = " + boardDTO + ", errors = " + errors);
        if (errors.hasErrors()){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errors.getAllErrors());
        }
        boardService.update(boardDTO);
        return ResponseEntity.status(HttpStatus.OK).body("글수정 성공");
    }
}
