function onInstall(event) {
  console.log('[Service Worker]', 'Installing!', event);
}
   
function onActivate(event) {
  console.log('[Service Worker]', 'Activating!', event);
}
   
function onFetch(event) {
  console.log('[Service Worker]', 'Fetching!', event);
}

self.addEventListener('install', onInstall);
self.addEventListener('activate', onActivate);
self.addEventListener('fetch', onFetch);

self.addEventListener('push', (event) => {
  const data = event.data.json();
  self.registration.showNotification(data.title, {
    body: data.body,
    icon: '/assets/images/box.png',
  });
});
