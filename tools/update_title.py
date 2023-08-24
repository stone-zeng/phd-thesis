import re


TITLE_PATTERN = re.compile(r'((?:title|booktitle|journal)\s+=\s+{)(.+)(},\n)')
WORD_PATTERN = r'([^A-Za-z]*)([A-Za-z])(.+)'


def main():
    with open('main.bib', 'r', encoding='utf-8') as f:
        lines = f.readlines()
    with open('main.bib', 'w', encoding='utf-8') as f:
        f.writelines(re.sub(TITLE_PATTERN, updateTitle, line) for line in lines)


def updateTitle(m: re.Match) -> str:
    sentences = m.group(2).split(': ')
    title = ': '.join(capitalize(' '.join(map(titlecase, t.split()))) for t in sentences)
    return m.group(1) + title + m.group(3)


def titlecase(s: str) -> str:
    # if s[0] == '{' and s[-1] == '}' or s.lower() in {
    if s[0] == '{' or s.lower() in {
        'and', 'as', 'but', 'for', 'if', 'nor', 'or', 'so', 'yet',
        'a', 'an', 'the',
        'at', 'by', 'from', 'in', 'into', 'of', 'off', 'on', 'onto', 'per', 'to', 'through', 'up', 'via', 'with',
        'is',
        'de', 'des'
    }:
        return s
    def _titlecase(m: re.Match):
        return m.group(1) + m.group(2).upper() + m.group(3)
    return re.sub(WORD_PATTERN, _titlecase, s)


def capitalize(s: str) -> str:
    return s[0].upper() + s[1:]


if __name__ == '__main__':
    main()
