@search @wip
Feature: User searches BlenderKit asset gallery
This currently works only on production.

  Scenario: User goes to MODELS asset gallery
      Given user has Chrome running
        And user is logged in
        And page contains element "nav item MODELS"
       When user clicks on element "nav item MODELS"
       Then they are on "/asset-gallery?query=category_subtree:model%20order:-created"

  Scenario: User searches MODELS asset gallery
       When user types "kitten" into element "SEARCH field"
        And user clicks on element "SEARCH submit"
       Then search result named "Kitten" is present

  Scenario: User looks on model pop-up preview
       When user clicks on search result named "Kitten"
       Then page contains clickable element "ASSET POPUP"
        And page contains clickable element "ASSET POPUP AUTHOR AVATAR"
        And page contains clickable element "ASSET POPUP LICENSE"
        And element "ASSET POPUP NAME" contains text "Kitten"
        And element "ASSET POPUP AUTHOR NAME" contains text "Vilém Duha"
        And element "ASSET POPUP PLAN" contains text "Free Plan"

  Scenario: User goes to model detail
       When user clicks on element "ASSET POPUP GET MODEL button"
       Then they are on path matching "/get-blenderkit/\w{8}-\w{4}-\w{4}-\w{4}-\w{12}/"
