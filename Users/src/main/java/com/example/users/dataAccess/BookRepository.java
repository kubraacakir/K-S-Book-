package com.example.users.dataAccess;

import com.example.users.entities.concretes.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;
import java.util.UUID;

@Repository
public interface BookRepository extends JpaRepository<Book, UUID> {
    Set<Book> findByCategory_Id(UUID id);
}
