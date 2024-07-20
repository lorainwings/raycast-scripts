const { readFileSync, writeFileSync } = require('fs')
const { exec } = require('child_process')
let [keyword, cookie] = process.argv.slice(2)
const searchURL = 'https://www.52pojie.cn/search.php?mod=forum'

const http = async function (url, o) {
  let data = ''
  const params = [url]
  o && params.push({ headers: { cookie }, ...o })
  const response = await fetch(...params);
  const reader = response.body.getReader();
  const textDecoder = new TextDecoder('UTF-8')
  while (true) {
    const { done, value } = await reader.read()
    if (done) break;
    const rs = textDecoder.decode(value)
    data += rs;
  }
  return { data, response }
}

const runShell = async function (cmd) {
  return new Promise((resolve, reject) => {
    exec(cmd, { stdio: 'inherit' }, (error, stdout) => {
      if (error) return reject(error)
      resolve(stdout)
    });
  })
}

const paramsHandle = function () {
  if (cookie) return writeFileSync('cache/.cookie', cookie)
  cookie = readFileSync('cache/.cookie', 'utf-8')
  if (cookie) return
  console.log("🔴 请提供Cookie参数!")
  process.exit(1)
}

const __main = async function () {
  try {
    paramsHandle()
    const { data: html } = await http(searchURL, { method: 'GET' })
    const [, hash] = html.match(/input type="hidden" name="formhash" value="(\w+)"/i)
    const res = await runShell(`curl -sS -D - ${searchURL} -o /dev/null --data-raw 'formhash=${hash}&srchtxt=${keyword}&searchsubmit=yes' -H 'Cookie: ${cookie}'`)
    console.log('res', res);
    const [, location] = res.match(/Location: (.*)/i)
    runShell(`open --new -a "Google Chrome" --args --new-window "https://www.52pojie.cn/${location}"`)
  } catch (e) {
    console.log('e', e);
  }
}


__main()


