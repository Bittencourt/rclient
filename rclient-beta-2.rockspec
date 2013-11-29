package = 'rclient'
version = 'beta-2'

source = {
   url = 'git+file://git@github.com:jucor/lua-rclient.git',
   tag = '1.0-beta2'
}

description = {
  summary = 'Client for the Rserve package of the R statistical programming language, part of Sci-lua',
  homepage = 'http://scilua.org/rclient.html'
}

dependencies = {'xsys', 'luasocket'}
build = {
type = 'none',
 install = {
        lua =  {
            ['rclient._rclient'] = '_rclient.lua',
            ['rclient.init'] = 'init.lua'
        }
    }
}
