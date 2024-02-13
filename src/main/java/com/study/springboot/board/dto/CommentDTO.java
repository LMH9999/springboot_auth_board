package com.study.springboot.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class CommentDTO {
    private Long id;
    @NotNull
    private Long boardId;
    @NotBlank
    private String writer;
    @NotBlank
    private String contents;
    private Timestamp createdTime;
}
