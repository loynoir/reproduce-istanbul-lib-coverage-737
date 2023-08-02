#!/bin/bash
set -ex

# faking 100% coverage
env RUNTIME=node,browser npm exec -- c8 --report-dir build/expected node ./reproduce.mjs

# collect coverage from diffent runtime
env RUNTIME=node npm exec -- c8 --report-dir build/actual/node node ./reproduce.mjs
env RUNTIME=browser npm exec -- c8 --report-dir build/actual/browser node ./reproduce.mjs

# merge coverage from different runtime
mkdir -p ./build/actual/temp
npm exec -- istanbul-merge --out ./build/actual/temp/coverage.json ./build/actual/node/coverage-final.json ./build/actual/browser/coverage-final.json

# report
npm exec -- nyc report -r lcov -r text --temp-directory ./build/actual/temp --report-dir ./build/actual
