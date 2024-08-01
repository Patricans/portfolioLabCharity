package pl.coderslab.charity.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import pl.coderslab.charity.models.User;
import pl.coderslab.charity.repositories.UsersRepository;


import java.util.regex.Pattern;

@Component
public class UserValidator implements Validator {
    @Autowired
    private UsersRepository usersRepository;
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email","NonEmpty");
        final Pattern emailRegexPattern = Pattern.compile("^(?=.{1,64}@)[A-Za-z0-9\\+_-]+(\\.[A-Za-z0-9\\+_-]+)*@"
                + "[^-][A-Za-z0-9\\+-]+(\\.[A-Za-z0-9\\+-]+)*(\\.[A-Za-z]{2,})$");
        // regex z neta (sprawdzajacy poprawność maili i gmaili //

        if(!emailRegexPattern.matcher(user.getEmail()).matches()) {
            errors.rejectValue("email","Email.invalid");
        }
        if(usersRepository.findByEmail(user.getEmail()) != null) {
            errors.rejectValue("email","Email.exists");
        }
        if(!user.getPassword().equals(user.getPassword2())) {
            errors.rejectValue("password2","PasswordConfirm.invalid");
        }
        if(user.getPassword().length() < 8) {
            errors.rejectValue("password","Password.tooShort");
            errors.rejectValue("password2","Password.tooShort");
        }
    }
}
