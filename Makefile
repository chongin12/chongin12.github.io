# Makefile to create a post with the current date and time in the system's timezone in the _posts directory

# Function to get current date, time, and timezone offset
CURRENT_DATE = $(shell date +%Y-%m-%d)
CURRENT_TIME = $(shell date +%H:%M:%S)
TIMEZONE_OFFSET = $(shell date +%z)

# Directory to store posts
POSTS_DIR = ./_posts

# Target for 'make post'
post:
	$(eval POSTNAME := $(shell echo $(title) | sed 's/ /-/g'))
	@mkdir -p $(POSTS_DIR)
	@echo "---" > $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "layout: post" >> $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "title:  \"$(title)\"" >> $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "date:   $(CURRENT_DATE) $(CURRENT_TIME) $(TIMEZONE_OFFSET)" >> $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "categories:" >> $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "---" >> $(POSTS_DIR)/$(CURRENT_DATE)-$(POSTNAME).md
	@echo "Created post in _posts: $(CURRENT_DATE)-$(POSTNAME).md"

# Disable implicit rules
%:
	@:
