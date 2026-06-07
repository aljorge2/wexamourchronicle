---
title: "The Vaelthir Hour: Stilver Lugrathe — The Man Behind the Office"
subtitle: "Season 12, Episode 274"
date: 2026-05-21
author: "Sorin VanDenBerghe"
section_label: "Vaelthir"
summary: "Sorin VanDenBerghe sits down with long-form correspondent Joey Vaelwick to discuss his three-day On Record interview with ORCM Chair Stilver Lugrathe."
draft: true
volume: 2
---

The Vaelthir Hour is the Chronicle's daily news programme hosted by Sorin VanDenBerghe. In this episode, Sorin speaks with long-form correspondent Joey Vaelwick about his recent *On Record* piece — a three-day interview with ORCM Chair Stilver Lugrathe.

<div class="audio-player" id="audioPlayer">
  <audio id="audioEl" preload="metadata">
    <source src="/audio/vaelthir-hour-s12e274.mp3" type="audio/mpeg">
  </audio>
  <button class="ap-play" id="apPlay" aria-label="Play">&#9654;</button>
  <span class="ap-time" id="apCurrent">0:00</span>
  <div class="ap-bar" id="apBar">
    <div class="ap-progress" id="apProgress"></div>
  </div>
  <span class="ap-time" id="apDuration">0:00</span>
</div>

<script>
(function(){
  var audio = document.getElementById('audioEl');
  var playBtn = document.getElementById('apPlay');
  var bar = document.getElementById('apBar');
  var progress = document.getElementById('apProgress');
  var curEl = document.getElementById('apCurrent');
  var durEl = document.getElementById('apDuration');

  function fmt(s){
    var m = Math.floor(s/60), sec = Math.floor(s%60);
    return m + ':' + (sec < 10 ? '0' : '') + sec;
  }

  audio.addEventListener('loadedmetadata', function(){
    durEl.textContent = fmt(audio.duration);
  });

  audio.addEventListener('timeupdate', function(){
    curEl.textContent = fmt(audio.currentTime);
    if(audio.duration) progress.style.width = (audio.currentTime/audio.duration*100)+'%';
  });

  playBtn.addEventListener('click', function(){
    if(audio.paused){ audio.play(); playBtn.innerHTML='&#10074;&#10074;'; }
    else { audio.pause(); playBtn.innerHTML='&#9654;'; }
  });

  audio.addEventListener('ended', function(){
    playBtn.innerHTML='&#9654;';
  });

  bar.addEventListener('click', function(e){
    var rect = bar.getBoundingClientRect();
    var pct = (e.clientX - rect.left) / rect.width;
    audio.currentTime = pct * audio.duration;
  });
})();
</script>
