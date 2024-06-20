package eu.gaminatorium.user;

import eu.gaminatorium.user.dto.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class UserFacade {

    private final UserService userService;


    public List<UserDto> findAll() {
        return userService.findAll();
    }

    public Optional<UserDto> getUserById(long userId) {
        return userService.getUserById(userId);

    }

    public void deleteUserById(long userId) {
        userService.deleteUserById(userId);
    }

    public Optional<UserDto> updateUser(long userId, UserDto userDto) {
        return userService.updateUser(userId, userDto);
    }

    public UserDto addUser(UserDto userDto) {
        return userService.addUser(userDto);
    }
}
