(function() {
  $(function() {
    var addSet, bind, deck, stats, unbind;
    deck = bespoke.from('#sections', [bespoke.themes.nebula(), bespoke.plugins.keys(), bespoke.plugins.classes()]);
    stats = ['Unique Portals Visited', 'Portals Discovered', 'XM Collected', 'Hacks', 'Resonators Deployed', 'Links Created', 'Control Fields Created', 'Mind Units Captured', 'Longest Link Ever Created', 'XM Recharged', 'Portals Captured', 'Unique Portals Captured', 'Resonators Destroyed', 'Portals Neutralized', 'Enemy Links Destroyed', 'Enemy Control Fields Destroyed', 'Distance Walked', 'Max Time Portal Held', 'Max Time Link Maintained', 'Max Link Length x Days', 'Max Time Field Held', 'Largest Field MUs x Days'];
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
        m = 40;
        f = function() {
          var x;
          x = Math.floor(Math.random() * stats.length);
          s1.text(stats[x]);
          if (i++ <= m) {
            return setTimeout(f, 50);
          } else {
            return setTimeout(chooseNumber, 1000);
          }
        };
        return f();
      };
      chooseNumber = function() {
        var f, i, m;
        i = 0;
        m = 40;
        f = function() {
          var x;
          x = Math.floor(Math.random() * 100);
          s3.text(x < 10 ? "0" + x : x);
          if (i++ <= m) {
            return setTimeout(f, 50);
          } else {
            return bind();
          }
        };
        return f();
      };
      li.append(s1).append(s2).append(s3).appendTo('#stats');
      s2.text(': ');
      s3.text('xx');
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
    bind();
    return $('#sections').fadeIn(2000);
  });

}).call(this);
