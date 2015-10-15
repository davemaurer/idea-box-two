$(document).ready(function() {
  renderIdeas();
  createIdea();
  editIdea();
  deleteIdea();
});


function renderIdeas() {
  $.ajax({
    type: "GET",
    url: '/api/v1/ideas',
    success: function(ideas) {
      ideas.forEach(function(idea) {
        renderIdea(idea);
      });
    }
  });
}

function createIdea() {
  $("#create-idea").on("click", function() {
    var ideaParams = {
      idea: {
        title: $("#idea-title").val(),
        body: $("#idea-body").val()
      }
    };

    $.ajax({
      type: "POST",
      url: "/api/v1/ideas.json",
      data: ideaParams,
      success: function(idea) {
        renderIdea(idea);
        clearForm();
      }
    });
  });
}

function editIdea() {
  $("#all-ideas").delegate("edit-idea", "click", function() {
    var $idea = $(this).closest(".idea");

    var ideaParams = {
      idea: {
        title: $("#idea-title").val(),
        body: $("#idea-body").val()
      }
    };

    $.ajax({
      type: "PUT",
      url: "/api/v1/ideas" + $idea.attr('data-id') + ".json",
      data: ideaParams,
      success: function(idea) {
        $idea.replaceWith(idea);
      }
    });
  });
}


function deleteIdea() {
  $("#all-ideas").delegate("#delete-idea", "click", function() {
    var $idea = $(this).closest(".idea");

    $.ajax({
      type: "DELETE",
      url: "/api/v1/ideas/" + $idea.attr('data-id') + ".json",
      success: function() {
        $idea.remove();
      },
      error: function() {
        $idea.remove();
      }
    });
  });
}

function clearForm() {
  $("#idea-title").val('');
  $("#idea-body").val('');
}

function truncateIdea(idea) {
  if(idea.body.length >= 100) {
    idea.body = idea.body.slice(0, 100) + '...';
  }
  return idea;
}

function renderIdea(idea) {
  truncateIdea(idea);
  $("#all-ideas").prepend(
    "<div class='idea' data-id='"
    + idea.id
    + "'><h4>"
    + idea.title
    + "</h4><h5>"
    + idea.body
    + "</h5><h5>"
    + idea.quality
    + "</h5>"
    + "<button id='edit-idea' class='btn btn-info btn-xs'>Edit</button>"
    + "<button id='delete-idea' class='btn btn-danger btn-xs'>Delete</button></div>"
  );
}
