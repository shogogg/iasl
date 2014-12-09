(function() {
  $(function() {
    var addSet, bind, deck, stats, unbind;
    deck = bespoke.from('#sections', [bespoke.themes.nebula(), bespoke.plugins.keys(), bespoke.plugins.classes()]);
    stats = ['Unique Portals Visited', 'Portals Discovered', 'XM Collected', 'Hacks', 'Resonators Deployed', 'Links Created', 'Control Fields Created', 'Mind Units Captured', 'Longest Link Ever Created', 'Largest Control Field', 'XM Recharged', 'Portals Captured', 'Unique Portals Captured', 'Resonators Destroyed', 'Portals Neutralized', 'Enemy Links Destroyed', 'Enemy Control Fields Destroyed', 'Distance Walked', 'Max Time Portal Held', 'Max Time Link Maintained', 'Max Link Length x Days', 'Max Time Field Held', 'Largest Field MUs x Days'];
    addSet = function() {
      var chooseNumber, chooseStat, li, s1, s2, s3;
      unbind();
      li = $('<li/>');
      s1 = $('<span/>');
      s2 = $('<span/>');
      s3 = $('<span/>');
      chooseStat = function() {
        var f, i, m;
        i = 0;
        m = 30;
        f = function() {
          var x;
          x = Math.floor(Math.random() * stats.length);
          s1.text(stats[x]);
          if (i++ <= m) {
            return setTimeout(f, 100);
          } else {
            return setTimeout(chooseNumber, 2000);
          }
        };
        return f();
      };
      chooseNumber = function() {
        var f, i, m;
        i = 0;
        m = 30;
        f = function() {
          var x;
          x = Math.floor(Math.random() * 10);
          s3.text('xx' + x);
          if (i++ <= m) {
            return setTimeout(f, 100);
          } else {
            return bind();
          }
        };
        li.append(s3);
        return f();
      };
      li.append(s1).append(s2).appendTo('#stats');
      s2.text(' = ');
      s3.text('xxx');
      return chooseStat();
    };
    bind = function() {
      return $(document).on('keyup', function(event) {
        switch (event.which) {
          case 80:
            return addSet();
        }
      });
    };
    unbind = function() {
      return $(document).off('keyup');
    };
    return bind();
  });

}).call(this);
