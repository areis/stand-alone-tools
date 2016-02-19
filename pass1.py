from random import randint, sample

Chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_%.#+*?!'
MAX = 16

PASS = ''
while MAX > 0:
    PASS += ''.join([str(w) for w in sample(Chars, len(Chars))])[0]
    MAX -= 1
print PASS
