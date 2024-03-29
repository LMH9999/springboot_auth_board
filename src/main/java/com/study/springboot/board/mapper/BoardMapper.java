package com.study.springboot.board.mapper;

import com.study.springboot.board.dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardMapper {
    void save(BoardDTO boardDTO);

    List<BoardDTO> findAll();

    void updateHits(Long id);

    BoardDTO findById(Long id);

    void update(BoardDTO boardDTO);

    void delete(Long id);

    int listCnt();

    List<BoardDTO> pagingList(Map<String, Integer> pagingParams);
}
