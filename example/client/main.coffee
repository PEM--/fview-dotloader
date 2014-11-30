css = new CSSC
css
.add '.label',
  textAlign: 'center'
  paddingTop: CSSC.px 10
  fontSize: CSSC.px 14
  backgroundColor: CSSC.silver
  border: "#{CSSC.px 1} solid #{CSSC.gray}"
  borderRadius: CSSC.em .5
  boxShadow: "0 #{CSSC.px 3} #{CSSC.px 10} #{CSSC.gray}"
.add ['p', 'pre'], margin: 0, padding: 0
.add 'pre', fontSize: CSSC.px 12
.add '.dotloader-background',
  backgroundColor: CSSC.green
  borderRadius: CSSC.px 10
.add '.dotloader-dots', backgroundColor: CSSC.lime
.add '.theme1-bg', backgroundColor: CSSC.orange
.add '.theme1-dots', backgroundColor: CSSC.yellow
.add '.theme2-bg',
  backgroundColor: CSSC.blue
  borderRadius: CSSC.px 50
.add '.theme2-dots', backgroundColor: CSSC.aqua

Engine = famous.core.Engine

Template.gridExample.rendered = ->
  fscrollview = FView.byId 'scrollview'
  Engine.pipe fscrollview.view
