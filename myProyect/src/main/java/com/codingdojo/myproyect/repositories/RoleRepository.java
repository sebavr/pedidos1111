package com.codingdojo.myproyect.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.myproyect.models.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long>{
    List<Role> findAll();
    
    Role findByName(String name);
}