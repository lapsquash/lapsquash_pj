import re
from argparse import ArgumentParser

parser = ArgumentParser()

parser.add_argument("input", type=str)
parser.add_argument("output", type=str)
args = parser.parse_args()

pathInput: str = args.input
pathOutput: str = args.output

body = ""

with open(pathInput, encoding="utf-8") as file:
    body = file.read()

result = re.sub(
    r"(?<=[A-Za-z0-9])\s+(?=[^A-Za-z0-9])|(?<=[^A-Za-z0-9])\s+(?=[A-Za-z0-9])(?![^<>]*>)",  # noqa: E501
    "",
    body,
    flags=re.MULTILINE,
)

with open(pathOutput, "w", encoding="utf-8") as file:
    file.write(result)
