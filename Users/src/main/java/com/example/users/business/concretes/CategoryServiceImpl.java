package com.example.users.business.concretes;

import com.example.users.business.abstracts.CategoryService;
import com.example.users.dataAccess.CategoryRepository;
import com.example.users.entities.concretes.Category;
import com.example.users.model.dto.CategoryDto;
import com.example.users.model.mapper.CategoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;

    @Override
    public CategoryDto save(CategoryDto categoryDto) {
        return CategoryMapper.INSTANCE.entitytoDto(categoryRepository.save(CategoryMapper.INSTANCE.dtotoEntity(categoryDto)));
    }

    @Override
    public Set<CategoryDto> getAll() {
        List<Category> allCategories = categoryRepository.findAll();
        Set<CategoryDto> categories = allCategories.stream()
                .map(category -> CategoryMapper.INSTANCE.entitytoDto(category)).collect(Collectors.toSet());
        return categories;
    }
}
