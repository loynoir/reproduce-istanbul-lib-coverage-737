const IS_NODE = process.env['RUNTIME'].includes('node')
const IS_BROWSER = process.env['RUNTIME'].includes('browser')

if (IS_NODE) {
  console.log('node')
}

if (IS_BROWSER) {
  console.log('browser')
}

export { }
