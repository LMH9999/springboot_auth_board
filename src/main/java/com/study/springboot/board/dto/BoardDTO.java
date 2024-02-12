package com.study.springboot.board.dto;

import lombok.*;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardDTO {
    private Long id;
    private String email;
    @NotBlank
    private String title;
    @NotBlank
    private String contents;
    private int hits;
    private LocalDateTime createdTime;
    private LocalDateTime updatedTime;
}
