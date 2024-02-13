package com.study.springboot.board.service;

import com.study.springboot.board.dto.BoardDTO;
import com.study.springboot.board.dto.PageDTO;
import com.study.springboot.board.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper boardMapper;
    public void save(BoardDTO boardDTO) {
        boardMapper.save(boardDTO);
    }

    public List<BoardDTO> findAll() {
        return boardMapper.findAll();
    }

    public void updateHits(Long id) {
        boardMapper.updateHits(id);
    }

    public BoardDTO findById(Long id) {
        return boardMapper.findById(id);
    }

    public void update(BoardDTO boardDTO) {
        boardMapper.update(boardDTO);
    }

    public void delete(Long id) {
        boardMapper.delete(id);
    }

    int pageLimit = 3;
    int blockLimit = 3;
    public List<BoardDTO> pagingList(int page) {
        int pageStart = (page - 1) * pageLimit;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pageStart);
        pagingParams.put("limit", pageLimit);
        return boardMapper.pagingList(pagingParams);
    }

    public PageDTO pagingParam(int page) {
        // 전체 글 갯수 조회
        int boardCount = boardMapper.listCnt();
        // 전체 페이지 갯수 계산
        int maxPage = (int) (Math.ceil((double) boardCount / pageLimit));
        // 시작 페이지 값 계산
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setCount(boardCount);
        pageDTO.setLimit(pageLimit);
        return pageDTO;
    }
}
