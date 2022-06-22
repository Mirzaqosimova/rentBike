package uz.epam.rentbikee.valid;

public interface Validation {

    boolean isPhoneNumberValid(String phoneNumber);

    boolean isNameValid(String name);

    boolean isUserNameValid(String username);

    boolean isPasswordValid(String password);

    boolean validateCommand(String comm);
}
