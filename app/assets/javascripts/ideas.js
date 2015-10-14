$(document).ready(function() {
  createIdea();
});

function createIdea() {
  $("create-idea").on("click", function() {
    var ideaParams = {
      idea: {
        title: $("idea-title").val(),
        body: $("idea-body").val()
      }
    };
    $.ajax({
      type: "POST",
      url: "/ideas.json",
      data: ideaParams,
      success: function(idea) {
        renderIdea(idea)
      }
    })
  })
}

function renderIdea(idea) {
  $("#ideas").append(
    "<div class='idea' data-id='"
    + idea.id
    + "'><h4>"
    + idea.title
    + "</h4><h5>"
    + idea.body
    + "</h5><button id='delete-idea' class='btn btn-default btn-xs'>Delete</button></div>"
  )
}