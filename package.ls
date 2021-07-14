#!/usr/bin/env lsc -cj
author: 'TOKYO CivicWorks'
name: 'jpbudget'
description: 'Japan National Budget Visualization Site'
version: '0.0.1'
homepage: 'http://budget.civic-works.tokyo'
repository:
  type: 'git'
  url: 'https://github.com/TOKYOCivicWorks/jpbudget'
engines:
  node: '4.4.x'
  npm: '2.15.x'
scripts:
  prepublish: 'lsc -cj package.ls'
  start: 'node server/app.js'
dependencies:
  'basic-auth': '^2.0.1'
  'bcrypt': '*'
  'cookie-sessions': 'git://github.com/clkao/cookie-sessions.git'
  'crypto-js': '^4.0.0'
  'forever': '^4.0.1',
  'jade': '0.27.x'
  'livescript': '^1.6.0'
  'mongoose': '3.2.x'
  'node-fetch': '^2.6.0'
  'passport': '0.1.x'
  'passport-facebook': '0.1.x'
  'passport-github': '0.1.x'
  'passport-http-bearer': '^1.0.1'
  'passport-local': '0.1.x'
  'passport-twitter': '0.1.x'
  'zappajs': '0.6.x'
devDependencies:
  LiveScript: '1.1.1'
  q: '*'
  brunch: '1.6.x'
  'javascript-brunch': '1.5.x'
  'LiveScript-brunch': '1.5.x'
  'css-brunch': '1.5.x'
  'sass-brunch': '1.5.x'
  'jade-brunch': '1.5.x'
  'static-jade-brunch': '>= 1.4.8 < 1.5'
  'auto-reload-brunch': '1.6.x'
  'uglify-js-brunch': '1.5.x'
  'clean-css-brunch': '1.5.x'
  'jade-angularjs-brunch': '0.0.5'
  'jsenv-brunch': '1.4.2'
