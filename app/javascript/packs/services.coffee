import Sortable from 'sortablejs';

document.addEventListener('turbolinks:load', () => {
  var el = document.getElementById('sortable-list');
  var sortable = Sortable.create(el);
})
