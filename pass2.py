from random import sample
from sys import argv

Chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_%.#+*?!'

if len(argv) > 1:
    MAX = int(argv[1])
else:
    MAX = 8

PASS = ''.join([str(w) for w in sample(Chars, len(Chars))])[:MAX]
print PASS
