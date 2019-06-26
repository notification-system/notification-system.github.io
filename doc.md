---
title: Doc
---

# Documentation instructions
---

Just like any part of our projects any pull requests/issues created for our documentation is much appreciated.

Before updating the documentation please run our spell checker.
We have two ways, ether installing npm locally on your computer or using docker

## npm spell checker

```bash
# Install the yaspeller-ci npm package
npm install

# Run the spellcheck application
npm run spellcheck
```

## Docker spell checker

```bash
# Build the spellcheck docker file
docker build -t spellchecker:latest -f Dockerfile-spellcheck .

# Run the docker image
docker run -it spellchecker

# If you easily want to run spellchecker without re-building mount your local dir as a volume
docker run -v $PWD:/scripts -it spellchecker
```

If you find any issues please correct them.
If we are missing any words in our local dictionary feel free to add them to .yaspellerrc
