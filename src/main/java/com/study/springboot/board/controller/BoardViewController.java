package com.study.springboot.board.controller;

import com.study.springboot.board.dto.BoardDTO;
import com.study.springboot.board.dto.CommentDTO;
import com.study.springboot.board.dto.PageDTO;
import com.study.springboot.board.service.BoardService;
import com.study.springboot.board.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardViewController {
    private final BoardService boardService;
    private final CommentService commentService;

    @GetMapping
    public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                       Model model) {
        List<BoardDTO> boardDTOList = boardService.pagingList(page);
        PageDTO pageDTO = boardService.pagingParam(page);

        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);

        return "board/list";
    }

    @GetMapping("/save")
    public String saveForm() {
        return "board/save";
    }

    @GetMapping("/{id}/{page}")
    public String detail(@PathVariable Long id, @PathVariable int page, Model model) {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page",page);

        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);

        return "board/detail";
    }

    @GetMapping("/update/{id}/{page}")
    public String updateForm(@PathVariable Long id, @PathVariable int page, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        return "board/update";
    }
}
