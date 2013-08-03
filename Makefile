default:
	lsc -cpb src/limited-array.ls > index.js

test:
	lsc test/test

.PHONY: test
