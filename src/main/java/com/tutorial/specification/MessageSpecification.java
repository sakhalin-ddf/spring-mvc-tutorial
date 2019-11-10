package com.tutorial.specification;

import com.tutorial.entity.Message;
import com.tutorial.entity.Message_;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import java.util.ArrayList;
import java.util.List;

public class MessageSpecification implements Specification<Message> {
  private String tag;

  public String getTag() {
    return tag;
  }

  public void setTag(String tag) {
    this.tag = tag;
  }

  public MessageSpecification() {
  }

  public MessageSpecification(String tag) {
    this.tag = tag;
  }

  @Override
  public Predicate toPredicate(Root<Message> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
    List<Predicate> listPredicates = new ArrayList<Predicate>();

    if (tag != null && !tag.isEmpty()) {
      listPredicates.add(criteriaBuilder.equal(root.get(Message_.tag), tag));
    }

    if (listPredicates.size() == 0) {
      return null;
    }

    return criteriaBuilder.and(listPredicates.toArray(new Predicate[]{}));
  }
}
