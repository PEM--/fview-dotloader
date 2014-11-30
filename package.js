Package.describe({
  name: 'pierreeric:fview-dotloader',
  summary: 'Animated dot loader for Meteor\'s famous-views.',
  version: '0.1.1',
  git: 'https://github.com/PEM--/fview-dotloader'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0');
  api.use('mjn:famous@0.3.0_5', 'client', { weak: true });
  api.use('raix:famono@0.9.14', { weak: true });
  api.use(['gadicohen:famous-views@0.1.25', 'coffeescript']);
  api.export('DotLoader', 'client');
  api.addFiles(
    [
      'fview-dotloader.coffee',
    ], 'client');
});
