Feature: Launch a set of images defined by name and GUID

    @persist_browser
    Scenario: Log into atmosphere
        Given a browser
        When I login to Atmosphere

    @persist_browser
    Scenario: Create project
        Given a browser
        Then I create project "BDD-01" if necessary

    @persist_browser
    Scenario Outline: Launch all featured images
        Given a browser
        # Launch instance
        When I go to "/application/images"
        Then I should see "SEARCH" within 10 seconds
        When I type slowly "<image-guid>" to "0" index of class "form-control"
        Then I should see "<image-name>" within 20 seconds
        When I press "<image-name>"
        Then I should see and press "Launch" within 10 seconds
        And I should see "Launch an Instance / Basic Options" within 10 seconds
        And I should see "alloted GBs of Memory" within 10 seconds
        When I choose provider "<provider>" from Provider dropdown
        And I choose "BDD-01" from Project dropdown
        # This button sometimes gives trouble
        And I press "Launch Instance"
        And I wait for 3 seconds
        And I double-check that I press "Launch Instance"
        Then I should see "Build" within 60 seconds

    Examples: Selected images
      | image-guid                           | image-name                     | provider                        |
      | c3ff7e02-98d1-43c9-b84f-9f7cd79bec4d | Ubuntu 12.04 Unity GUI v1      | iPlant Cloud - Tucson​           |
      | d559c236-53ef-437a-999e-02ae16c4b5f0 | Ubuntu 14.04.2 XFCE Base       | iPlant Cloud - Tucson​           |
      | 524bd34b-5579-4f7e-958b-172ff6c403db | CyVerse CentOS 6.8 GUI Base    | iPlant Cloud - Tucson​           |
      | 5de53056-9448-4519-b9b7-74dde60b9905 | Ubuntu 14.04 with Docker 1.7.x | iPlant Cloud - Tucson​           |
      | 7a7f187f-a5dc-4c23-8197-ed3f114a1a2c | functional genomics_v1.0       | iPlant Cloud - Tucson​           |

      | c3ff7e02-98d1-43c9-b84f-9f7cd79bec4d | Ubuntu 12.04 Unity GUI v1      | iPlant Cloud - Austin​           |
      | d559c236-53ef-437a-999e-02ae16c4b5f0 | Ubuntu 14.04.2 XFCE Base       | iPlant Cloud - Austin​           |
      | 524bd34b-5579-4f7e-958b-172ff6c403db | CyVerse CentOS 6.8 GUI Base    | iPlant Cloud - Austin​           |
      | 5de53056-9448-4519-b9b7-74dde60b9905 | Ubuntu 14.04 with Docker 1.7.x | iPlant Cloud - Austin​           |
      | 7a7f187f-a5dc-4c23-8197-ed3f114a1a2c | functional genomics_v1.0       | iPlant Cloud - Austin           |

      | c3ff7e02-98d1-43c9-b84f-9f7cd79bec4d | Ubuntu 12.04 Unity GUI v1      | iPlant Workshop Cloud - Tucson​  |
      | d559c236-53ef-437a-999e-02ae16c4b5f0 | Ubuntu 14.04.2 XFCE Base       | iPlant Workshop Cloud - Tucson​  |
      | 524bd34b-5579-4f7e-958b-172ff6c403db | CyVerse CentOS 6.8 GUI Base    | iPlant Workshop Cloud - Tucson​  |
      | 5de53056-9448-4519-b9b7-74dde60b9905 | Ubuntu 14.04 with Docker 1.7.x | iPlant Workshop Cloud - Tucson​​  |
      | 7a7f187f-a5dc-4c23-8197-ed3f114a1a2c | functional genomics_v1.0       | iPlant Workshop Cloud - Tucson​  |
