find . -name '*.sh' | xargs wc -l

# If file name includes special characters
# find . -name '*.sh' | sed 's/.*/"&"/' | xargs  wc -l

# To get output in sorted order
# find . -name '*.sh' | xargs wc -l | sort -nr