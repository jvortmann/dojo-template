fn convert_single(roman: char) -> i32 {
    match roman {
        'I' => 1,
        'V' => 5,
        'X' => 10,
        'L' => 50,
        'C' => 100,
        'D' => 500,
        'M' => 1000,
        _ => 0
    }
}

pub fn convert_decimal(roman: String) -> i32 {
    let mut result = 0;

    for chr in roman.chars() {
        result = result + convert_single(chr);
    }

    return result;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_convert_single_decimal_for_single_roman() {
        assert_eq!(1, convert_decimal(String::from("I")));
        assert_eq!(5, convert_decimal(String::from("V")));
        assert_eq!(10, convert_decimal(String::from("X")));
        assert_eq!(50, convert_decimal(String::from("L")));
        assert_eq!(100, convert_decimal(String::from("C")));
        assert_eq!(500, convert_decimal(String::from("D")));
        assert_eq!(1000, convert_decimal(String::from("M")));
    }

    #[test]
    fn test_convert_single_repeated_numbers() {
        assert_eq!(3, convert_decimal(String::from("III")));
        assert_eq!(30, convert_decimal(String::from("XXX")));
        assert_eq!(300, convert_decimal(String::from("CCC")));
        assert_eq!(3000, convert_decimal(String::from("MMM")));
    }

    #[test]
    fn test_convert_compounded_numbers_lowers_at_right() {
        assert_eq!(8, convert_decimal(String::from("VIII")));
        assert_eq!(62, convert_decimal(String::from("LXII")));
        assert_eq!(158, convert_decimal(String::from("CLVIII")));
        assert_eq!(1120, convert_decimal(String::from("MCXX")));
    }

    #[test]
    fn test_convert_compounded_numbers_lowers_at_left() {
        assert_eq!(4, convert_decimal(String::from("IV")));
        assert_eq!(9, convert_decimal(String::from("IX")));
        assert_eq!(90, convert_decimal(String::from("XC")));
    }
}