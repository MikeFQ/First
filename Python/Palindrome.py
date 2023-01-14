# Given a string, find if it is a palindrome

def is_palindrome(check_str: str) -> bool:
    check_str = check_str.lower()
    return check_str == check_str[::-1]

def is_palindrome_1(check_str: str) -> bool:
    check_str = check_str.lower()
    for i in range(len(check_str) // 2):
        if check_str[i] != check_str[-1 * (i + 1)]:
            return False
    return True

def is_palindrome_2(check_str: str) -> bool:
    check_str = check_str.lower()
    return next((False for i in range(len(check_str) // 2) if check_str[i] != check_str[-1 * (i + 1)]), True)

check_str = str(input('Enter the word\n'))

print(is_palindrome(check_str))
print(is_palindrome_1(check_str))
print(is_palindrome_2(check_str))


