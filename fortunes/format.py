#!/usr/bin/python3.9
from sys import argv
import re
import functools
import bisect

N = int(argv[1])

def create_line(text: str):
    return u'\u2503 ' + text + u' \u2503\n'

with open(argv[2]) as f:
    line = f.readline()
    quote = ""

    while line != "":
        line = f.readline()
        quote = u"\u250f" + u"\u2501" * (N + 2) + u"\u2513\n"

        while not re.match(r'^--', line):
            quote += create_line(line[:-1].ljust(N))
            line = f.readline()

        quote += create_line(line[:-1].rjust(N))
        quote += u"\u2517" + u"\u2501" * (N + 2) + u"\u251b"

        print(quote)
        print('%')
        f.readline()
        line = f.readline()

