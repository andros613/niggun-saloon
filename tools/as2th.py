# Convert ArtScroll convention to Tehillat Hashem convention
import fire

KAMATZ = r"o̞"
OBAR = r"ō"
# TODO: o̞ is IPA, not diacritic


def fix_apostrophe(text):
    return text.replace("’", "'")


def fix_tzeirei(text):
    return text.replace("ay", "ei")


def fix_obar(text):
    return text.replace(OBAR, "o")


def fix_kamatz(text):
    return text.replace("o", KAMATZ)


def fix_dashes(text):
    return text.replace("--", "-").replace("-", "- ")


def main(fp):
    with open(fp) as fin:
        for line in fin:
            text = line.strip().lower()
            text = fix_kamatz(text)
            text = fix_obar(text)
            text = fix_tzeirei(text)
            text = fix_apostrophe(text)
            text = fix_dashes(text)
            print(text)


if __name__ == '__main__':
    fire.Fire(main)
