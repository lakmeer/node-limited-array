
# Some simple tests

lim-arr = require \../index
same    = require \assert .deep-equal


# Construction

same [],             lim-arr 0
same [ 0 ],          lim-arr 1
same [ 0 0 0 0 0 ],  lim-arr 5
same [ \s ],         lim-arr 1, \s
same [ \s \s \s ],   lim-arr 3, \s
same [ true true ],  lim-arr 2, true


# Modification

m = lim-arr 3

same [ 0 0 0 ], m
same [ 0 0 1 ], m.push 1
same [ 0 1 2 ], m.push 2
same [ 1 2 3 ], m.push 3
same [ 2 3 \x ], m.push \x
same [ 3 \x m ], m.push m


# 'last' getter

n = lim-arr 3, \a

same \a, n.last
n.push \b
same \b, n.last
n.push \c
same \c, n.last


# Can be iterated over correctly
# Should only produce 3 results if
# extra properties have been added
# non-enumeratively

same 3, [ 'ok' for x in m ].length
same 3, [ 'ok' for x in n ].length

