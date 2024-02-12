package com.study.springboot.board.controller;

import com.study.springboot.board.dto.BoardDTO;
import com.study.springboot.board.service.BoardService;
import com.study.springboot.member.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
