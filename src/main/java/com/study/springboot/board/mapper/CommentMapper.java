package com.study.springboot.board.mapper;

import com.study.springboot.board.dto.CommentDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {

    void save(CommentDTO commentDTO);

    List<CommentDTO> findAll(Long boardId);
}
