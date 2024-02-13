package com.study.springboot.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class CommentDTO {
    private Long id;
    private Long boardId;
    private String writer;
    private String contents;
    private Timestamp createdTime;
}
