package com.example.users.business.abstracts;

import com.example.users.model.dto.CategoryDto;

import java.util.Set;

public interface CategoryService {
    CategoryDto save(CategoryDto categoryDto);

    Set<CategoryDto> getAll();
}
