# reproduce-istanbul-lib-coverage-737

reproduce-istanbul-lib-coverage-737

## bug

Run `reproduce.mjs` with env `RUNTIME=node` and `RUNTIME=browser`.

Merge `coverage-final.json` from different runtime.

Expect 100% coverage.

Actually, `branch not covered` at trailing char `{`

```txt
---------------|---------|----------|---------|---------|-------------------
File           | % Stmts | % Branch | % Funcs | % Lines | Uncovered Line #s 
---------------|---------|----------|---------|---------|-------------------
All files      |     100 |    33.33 |     100 |     100 |                   
 reproduce.mjs |     100 |    33.33 |     100 |     100 | 4-8               
---------------|---------|----------|---------|---------|-------------------
```

```js
reproduce.mjs:1:const IS_NODE = process.env['RUNTIME'].includes('node')
reproduce.mjs:2:const IS_BROWSER = process.env['RUNTIME'].includes('browser')
reproduce.mjs:3:
reproduce.mjs:4:if (IS_NODE) {
reproduce.mjs:5:  console.log('node')
reproduce.mjs:6:}
reproduce.mjs:7:
reproduce.mjs:8:if (IS_BROWSER) {
reproduce.mjs:9:  console.log('browser')
reproduce.mjs:10:}
reproduce.mjs:11:
reproduce.mjs:12:export { }
```

## reproduce

```sh
$ npm i
...
$ npm test
...
```

## actual

`branch not covered` at trailing char `{`

[acutal](./build/actual/lcov-report/reproduce.mjs.html)

## expected

100% coverage

[expected](./build/expected/lcov-report/reproduce.mjs.html)
