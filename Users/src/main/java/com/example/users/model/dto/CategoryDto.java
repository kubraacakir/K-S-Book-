package com.example.users.model.dto;

import com.example.users.entities.concretes.Book;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDto {
    private UUID id;

    @NotBlank
    private String name;

    private String imagePath;

    private Set<Book> books;
}
