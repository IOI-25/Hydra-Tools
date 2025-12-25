
import toml

def main():
    with open("/usr/lib/IOI/Hydra/info.toml", "r") as f:
        info = toml.load(f)
        return info["Hydra"]["version"]