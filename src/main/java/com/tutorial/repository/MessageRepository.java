package com.tutorial.repository;

import com.tutorial.entity.Message;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageRepository extends CrudRepository<Message, Long>, JpaSpecificationExecutor<Message> {
}
