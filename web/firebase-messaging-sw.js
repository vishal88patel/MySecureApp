importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyARgzgVx3H2xU4mcw7noLovdqRfxH3WJ2M",
  authDomain: "mysequreapp-5fc1f.firebaseapp.com",
  databaseURL: "mysequreapp-5fc1f.firebaseio.com",
  projectId: "mysequreapp-5fc1f",
  storageBucket: "mysequreapp-5fc1f.appspot.com",
  messagingSenderId: "849138110745",
  appId: "1:849138110745:web:6350aa2e8a7915f0903588",
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});