package com.example.users.business.abstracts;

import com.example.users.entities.concretes.Book;
import com.example.users.model.dto.BookDto;

import java.util.Set;
import java.util.UUID;

public interface BookService {
    Set<BookDto> getBookWithCategoryId(UUID categoryId);

    BookDto saveBook(BookDto bookDto);

    Set<BookDto> getAllBook();
}
