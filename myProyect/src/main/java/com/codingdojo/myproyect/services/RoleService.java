package com.codingdojo.myproyect.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.myproyect.models.Role;
import com.codingdojo.myproyect.repositories.RoleRepository;

@Service
public class RoleService {

    private final RoleRepository roleRepository;
    
    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public List<Role> allRole() {
        return roleRepository.findAll();
    }
    public Role findRole(Long id) {
        Optional<Role> optionalRole = roleRepository.findById(id);
        if(optionalRole.isPresent()) {
            return optionalRole.get();
        } else {
            return null;
        }
    }
	public Role createOrUpdateRole(Role role) {
        return roleRepository.save(role);
    }
	public void deleteRole(Long id) {
    	Optional<Role> optionalRole = roleRepository.findById(id);
        if(optionalRole.isPresent()) {
        	roleRepository.deleteById(id);
        } else {
            return;
        }
    }
}