package com.telerik.jpa

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.Table

@Entity
@Table(name = "course")
class Course {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  Long id

  String title
  String presenter
  boolean certified
}
