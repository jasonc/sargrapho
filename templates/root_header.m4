<!DOCTYPE html>
<html>
<head>
  <link href='style.css' rel='stylesheet' type='text/css'>
  <title>SarGraphO</title>
  <meta charset="UTF-8">
</head>
<body>

include(home_link.m4)

<div id='page'>

  <div id='periods'>
    <h1>Metrics by Period</h1>
    <div class='odd'>
      <div class='period'>day</div>
      <div class='period'><a href='combined/cpu-day.html' title='day - cpu'>cpu</a></div>
      <div class='period'><a href='combined/io-day.html' title='day - io'>io</a></div>
      <div class='period'><a href='combined/load-day.html' title='day - load'>load</a></div>
      <div class='period'><a href='combined/memory-day.html' title='day - memory'>memory</a></div>
      <div class='period'><a href='combined/swap-day.html' title='day - swap'>swap</a></div>
    </div>
    <div class='even'>
      <div class='period'>week</div>
      <div class='period'><a href='combined/cpu-week.html' title='week - cpu'>cpu</a></div>
      <div class='period'><a href='combined/io-week.html' title='week - io'>io</a></div>
      <div class='period'><a href='combined/load-week.html' title='week - load'>load</a></div>
      <div class='period'><a href='combined/memory-week.html' title='week - memory'>memory</a></div>
      <div class='period'><a href='combined/swap-week.html' title='week - swap'>swap</a></div>
    </div>
    <div class='odd'> 
      <div class='period'>month</div>
      <div class='period'><a href='combined/cpu-month.html' title='month - cpu'>cpu</a></div>
      <div class='period'><a href='combined/io-month.html' title='month - io'>io</a></div>
      <div class='period'><a href='combined/load-month.html' title='month - load'>load</a></div>
      <div class='period'><a href='combined/memory-month.html' title='month - memory'>memory</a></div>
      <div class='period'><a href='combined/swap-month.html' title='month - swap'>swap</a></div>
    </div>
    <div class='even'>
      <div class='period'>year</div>
      <div class='period'><a href='combined/cpu-year.html' title='year - cpu'>cpu</a></div>
      <div class='period'><a href='combined/io-year.html' title='year - io'>io</a></div>
      <div class='period'><a href='combined/load-year.html' title='year - load'>load</a></div>
      <div class='period'><a href='combined/memory-year.html' title='year - memory'>memory</a></div>
      <div class='period'><a href='combined/swap-year.html' title='year - swap'>swap</a></div>
    </div>
  </div><!-- periods -->

  <div id='hosts'>
    <h1>Metrics by Host</h1>
