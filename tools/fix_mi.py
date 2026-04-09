# Convert ArtScroll convention to Tehillat Hashem convention
import fire

KAMATZ = r"o̞"
OBAR = r"ō"


def fix_doubles(text):
    for l in ['b', 'd', 'g', 'k', 'l', 'm', 'n', 'y']:
        text = text.replace(f"{l}-{l}", f"-{l}")
    return text

def add_space(text):
    return text.replace('-', '- ')


def main(fp):
    with open(fp) as fin:
        for line in fin:
            text = line.strip().lower()
            text = fix_doubles(text)
            text = add_space(text)
            print(text)


if __name__ == '__main__':
    fire.Fire(main)
