fn main() {
    println!("Welcome do the Dojo");
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_main() {
        assert_eq!(1,1);
    }
}