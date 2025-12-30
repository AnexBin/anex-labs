#!/bin/bash
BASE_DIR="/home/anes/GitHub/anex-labs/03-ai-security"

# Find first topic with incomplete SESSION_COMPLETE.md
for topic in "$BASE_DIR"/*; do
    if [ -d "$topic" ] && ! grep -q "DONE" "$topic/SESSION_COMPLETE.md"; then
        echo "Next topic: $(basename "$topic")"
        exit 0
    fi
done

echo "All topics completed!"
