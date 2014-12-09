$ ->
  
  # Setup slide
  deck = bespoke.from '#sections', [
    bespoke.themes.nebula()
    bespoke.plugins.keys()
    bespoke.plugins.classes()
  ]
  
  # Stat list
  stats = [
    'Unique Portals Visited'
    'Portals Discovered'
    'XM Collected'
    'Hacks'
    'Resonators Deployed'
    'Links Created'
    'Control Fields Created'
    'Mind Units Captured'
    'Longest Link Ever Created'
    'Largest Control Field'
    'XM Recharged'
    'Portals Captured'
    'Unique Portals Captured'
    'Resonators Destroyed'
    'Portals Neutralized'
    'Enemy Links Destroyed'
    'Enemy Control Fields Destroyed'
    'Distance Walked'
    'Max Time Portal Held'
    'Max Time Link Maintained'
    'Max Link Length x Days'
    'Max Time Field Held'
    'Largest Field MUs x Days'
  ]
  
  addSet = ->
    unbind()
    li = $('<li/>')
    s1 = $('<span/>')
    s2 = $('<span/>')
    s3 = $('<span/>')
    chooseStat = ->
      i = 0
      m = 30
      f = ->
        x = Math.floor(Math.random() * stats.length)
        s1.text(stats[x])
        if i++ <= m then setTimeout(f, 100) else setTimeout(chooseNumber, 2000)
      f()
    chooseNumber = ->
      i = 0
      m = 30
      f = ->
        x = Math.floor(Math.random() * 10)
        s3.text('xx' + x)
        if i++ <= m then setTimeout(f, 100) else bind()
      li.append(s3)
      f()
    li.append(s1).append(s2).appendTo('#stats');
    s2.text(' = ')
    s3.text('xxx')
    chooseStat()

  bind = ->
    $(document).on 'keyup', (event) ->
      switch event.which
        when 80 then addSet()

  unbind = ->
    $(document).off('keyup');

  bind()
