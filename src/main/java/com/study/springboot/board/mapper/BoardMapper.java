package com.study.springboot.board.mapper;

import com.study.springboot.board.dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
    void save(BoardDTO boardDTO);
}
