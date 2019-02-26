
fn rotaciona(value: String) -> String {
    let mut char_vec: Vec<char> = value.chars().collect();
    char_vec.rotate_left(1);
    char_vec.into_iter().collect()
}

fn anagrama(value: String) -> String {
    let chars = value.chars();
    let result = String::from("");

    let size = value.len();

    for i in 0..size {
        // result.push(chars[i]);
        // for j in 1..size {
        //      result.push(chars[j])
        // }
    }

    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_anagrama() {
        let value = String::from("a");
        let expected = "a";
        assert_eq!(expected, anagrama(value));
    }

    #[test]
    fn test_with_two_char(){
        let value = String::from("ab");
        let expected_values = "ab ba";
        assert_eq!(expected_values, anagrama(value));
    }

    #[test]
    fn test_rotaciona() {
        let value = String::from("birl");
        let expected_value = String::from("irlb");
        assert_eq!(expected_value, rotaciona(value));
    }

    #[test]
    fn test_anagrama_for_two_letters() {
        let value = String::from("ab");
        let expected_value = String::from("ab ba");
        assert_eq!(expected_value, rotaciona(value));
    }
}