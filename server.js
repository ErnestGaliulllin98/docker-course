'use strict'

const express = require('express')
const fs = require('fs')
const response = fs.readFileSync('resources/response.json')
const json = JSON.parse(response)

// константы
const port = 8080
const host = '0.0.0.0'

var options = {
  // era: 'long',
  year: 'numeric',
  month: 'numeric',
  day: 'numeric',
  weekday: 'long',
  timezone: 'UTC',
  hour: 'numeric',
  minute: 'numeric',
  second: 'numeric',
}
const date = new Date()
// приложение
const app = express()
app.get('/', (req, res) => {
  // console.log(date) ${date}
  res.send(`${json.payload} ${date.toLocaleString('ru', options)}`)
})

app.listen(port, host)
console.log(`running on http://${host}:${port}`)
