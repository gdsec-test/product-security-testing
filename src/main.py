def sus(bool=False):
    return "suspicious" if bool else "not suspicious"


if __name__ == "__main__":
    print(f"I am {sus()}")
