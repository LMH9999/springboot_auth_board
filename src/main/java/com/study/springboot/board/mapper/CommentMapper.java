package com.study.springboot.board.mapper;

import com.study.springboot.board.dto.CommentDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {

    void save(CommentDTO commentDTO);
}
