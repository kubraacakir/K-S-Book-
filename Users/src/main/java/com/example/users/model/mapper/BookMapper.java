package com.example.users.model.mapper;


import com.example.users.entities.concretes.Book;
import com.example.users.model.dto.BookDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface BookMapper {

    BookMapper INSTANCE = Mappers.getMapper(BookMapper.class);

    @Mapping(source = "name", target = "name")
    BookDto entitytoDto(Book book);

    @Mapping(source = "name", target = "name")
    Book dtotoEntity(BookDto bookDto);
}
