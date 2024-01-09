package com.example.users.model.mapper;

import com.example.users.entities.concretes.Category;
import com.example.users.model.dto.CategoryDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface CategoryMapper {
    CategoryMapper INSTANCE = Mappers.getMapper(CategoryMapper.class);
    @Mapping(source = "id", target = "id")
    CategoryDto entitytoDto(Category category);

    @Mapping(source = "name", target = "name")
    Category dtotoEntity(CategoryDto categoryDto);
}
