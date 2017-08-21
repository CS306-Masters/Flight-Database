var resume = document.getElementById('resumeCard');
resume.addEventListener('click', function () {
  window.open('resume.pdf', '_blank');
});

var projects = document.getElementById('projectsCard');
projects.addEventListener('click', function() {
  window.open('https://github.com/orancanoren', '_blank');
});

var about = document.getElementById('aboutCard');
about.addEventListener('click', function() {
  alert('Coming soon!');
});
