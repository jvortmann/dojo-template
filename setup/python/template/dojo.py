# types are optional
def is_too_old(age : int) -> bool:
    if age >= 100:
        return True
    return False

# it executes what is inside `main` when running
# this script: python main.py
if __name__ == "__main__":
    dojo(100)