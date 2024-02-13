package com.study.springboot.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
    private int page;
    private int maxPage;
    private int startPage;
    private int endPage;
    private int count;
    private int limit;
}
