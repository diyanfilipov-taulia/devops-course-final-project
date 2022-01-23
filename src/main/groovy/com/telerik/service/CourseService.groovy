package com.telerik.service

import com.telerik.jpa.Course
import com.telerik.jpa.CourseRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
@Transactional
class CourseService {

  @Autowired
  CourseRepository courseRepository

  Course getCourseById(Long id) {
    courseRepository.getCourseById(id)
    //new Course(title: 'Telerik DevOps', presenter: 'Didoooooooooooooo')
  }

  Course getCourseByTitle(String title) {
    courseRepository.getCourseByTitle(title)
  }
}
