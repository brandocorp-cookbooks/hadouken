default['hadouken']['user'] = 'hadouken'
default['hadouken']['home'] = '/opt/hadouken'
default['hadouken']['config'] = '/opt/hadouken/hadouken.json'
default['hadouken']['binary'] = '/usr/bin/hadouken'
default['hadouken']['version'] = '5.2.0'
default['hadouken']['pidfile'] = '/var/run/hadouken/hadouken.pid'
default['hadouken']['options'] = nil
default['hadouken']['ssd_opts'] = nil
default['hadouken']['download_url'] = 'https://github.com/hadouken/hadouken/releases/download/v%{version}/hadouken-%{version}-amd64.deb'

default['hadouken']['settings']['bittorrent'].tap do |bittorrent|
  bittorrent['defaultSavePath'] = "/opt/hadouken/downloads"
  bittorrent['statePath'] = "/opt/hadouken/state"
  bittorrent['anonymousMode'] = false
  bittorrent['dht']['enabled'] = true
  bittorrent['dht']['routers'] = [
    ['router.bittorrent.com', 6881],
    ['router.utorrent.com', 6881],
    ['dht.transmissionbt.com', 6881],
    ['dht.aelitis.com', 6881]
  ]
end

default['hadouken']['settings']['proxy'].tap do |proxy|
  proxy['type'] = 'none'
  proxy['hostname'] = ''
  proxy['port'] = 0
  proxy['username'] = ''
  proxy['password'] = ['']
  proxy['proxyHostnames'] = true
  proxy['proxyPeerConnections'] = true
end

default['hadouken']['settings']['storage']['sparse'] = true
default['hadouken']['settings']['upnp']['enabled'] = true
default['hadouken']['settings']['utp']['enabled'] = true

default['hadouken']['settings']['extensions']['autoadd']['enabled'] = false
default['hadouken']['settings']['extensions']['automove']['enabled'] = false
default['hadouken']['settings']['extensions']['launcher']['enabled'] = false

default['hadouken']['settings']['extensions']['pushbullet'].tap do |pushbullet|
  pushbullet['enabled'] = false
  pushbullet['token'] = ''
  pushbullet['enabledEvents'] = [
    'hadouken.loaded',
    'torrent.added',
    'torrent.finished'
  ]
end

default['hadouken']['settings']['http'].tap do |http|
  http['address'] = '0.0.0.0'
  http['port'] = 7070
  http['auth']['basic']['userName'] = 'admin'
  http['auth']['basic']['password'] = 'admin'
  http['root'] = "/"
  http['ssl']['enabled'] = false
  http['ssl']['privateKeyFile'] = ''
  http['ssl']['privateKeyPassword'] = ''
  http['webui']['path'] = "/usr/share/hadouken/webui.zip"
end

default['hadouken']['settings']['scripting']['path'] = "/usr/share/hadouken/js"
