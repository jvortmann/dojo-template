use std::collections::HashMap;

const BILLS: [i32; 5] = [
    100,
    50,
    10,
    5,
    1,
];

pub fn calc_change(price: i32, paid: i32) -> HashMap<i32, i32> {
    let mut change_value = paid - price;

    let mut change: HashMap<i32, i32> = HashMap::new();

    for bill in BILLS.iter() {
        let n_bills = change_value / bill;
        change_value = change_value % bill;

        if n_bills > 0 {
            change.insert(*bill, n_bills);
        }
    }

    change
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_change_for_paid_10_expected_1_5bill() {
        let expected: HashMap<i32, i32> = [
            (5, 1),
        ].iter().cloned().collect();

        let actual = calc_change(5, 10);

        assert_eq!(expected, actual);
    }

    #[test]
    fn test_change_for_price5_paid_12_expected_1_5bill_and_2_1bill() {
        let expected: HashMap<i32, i32> = [
            (5, 1),
            (1, 2),
        ].iter().cloned().collect();

        let actual = calc_change(5, 12);

        assert_eq!(expected, actual);
    }

    #[test]
    fn test_change_raises_error_when_paid_is_less_than_price() {
        let expected: HashMap<i32, i32> = [
            (5, 1),
            (1, 2),
        ].iter().cloned().collect();

        let actual = calc_change(10, 5);

        assert_eq!(expected, actual);
    }
}