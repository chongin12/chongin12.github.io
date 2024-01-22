# Makefile to create a post with the current date and time in the system's timezone in the _posts directory

# Default post name if not provided
POSTNAME ?= postname

# Function to get current date, time, and timezone offset
CURRENT_DATE = $(shell date +%Y-%m-%d)
CURRENT_TIME = $(shell date +%H:%M:%S)
TIMEZONE_OFFSET = $(shell date +%z)

# Directory to store posts
POSTS_DIR = ./_posts

# Target for 'make post'
post:
	$(eval POSTNAME := $(filter-out $@,$(MAKECMDGOALS)))
	@mkdir -p $(POSTS_DIR)
	@echo "---" > $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "layout: post" >> $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "title:  \"$(POSTNAME)!\"" >> $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "date:   $(CURRENT_DATE) $(CURRENT_TIME) $(TIMEZONE_OFFSET)" >> $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "categories:" >> $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "---" >> $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "Created post in _posts: $(CURRENT_DATE)-$(POSTNAME).md"

# Disable implicit rules
%:
	@:
