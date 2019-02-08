fn main() {
	println!("Welcome do the Dojo");
}

#[cfg(test)]
mod tests {
    #[test]
    fn TestMain() {
		assert_eq!(1,1);	
	}
}