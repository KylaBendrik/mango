// find the forms
//  for each one: Add some submit logic
//    While submitting: send the data ourselves
//      When the response comes back: Display a helpful message

const handleSubmission = function handlSubmission(submitEvent) {
  submitEvent.preventDefault();

  const post_url = submitEvent.target.action;

  fetch('/cart')
}

const nodes = document
  .querySelectorAll('.cart-form')
  .forEach(form => {
    form.addEventListener('submit', handleSubmission);
  })

// To display pretty messages:
// Adding a message container
// Adding a message to that container
// Keeping track of the recent messages
// Timing out stale messages