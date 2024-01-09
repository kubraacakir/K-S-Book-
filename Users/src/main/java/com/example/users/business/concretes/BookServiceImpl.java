package com.example.users.business.concretes;

import com.example.users.business.abstracts.BookService;
import com.example.users.dataAccess.BookRepository;
import com.example.users.entities.concretes.Book;
import com.example.users.model.dto.BookDto;
import com.example.users.model.mapper.BookMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor

public class BookServiceImpl implements BookService {
    private final BookRepository bookRepository;

    @Override
    public Set<BookDto> getBookWithCategoryId(UUID categoryId) {
        Set<Book> books = bookRepository.findByCategory_Id(categoryId);
        Set<BookDto> bookDtos = books.stream().map(book -> BookMapper.INSTANCE.entitytoDto(book)).collect(Collectors.toSet());
        return bookDtos;

    }

    @Override
    public BookDto saveBook(BookDto bookDto) {
        return BookMapper.INSTANCE.entitytoDto(bookRepository.save(BookMapper.INSTANCE.dtotoEntity(bookDto)));
    }

    @Override
    public Set<BookDto> getAllBook() {
        List<Book> book = bookRepository.findAll();
        return book.stream().map(book1 -> BookMapper.INSTANCE.entitytoDto(book1)).collect(Collectors.toSet());
    }
}
