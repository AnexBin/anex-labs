#!/bin/bash
BASE_DIR="/home/anes/GitHub/anex-labs/03-ai-security"

TOPIC=$1
if [ -z "$TOPIC" ]; then
    echo "Usage: $0 <topic-folder-name>"
    exit 1
fi

for sub in "$BASE_DIR/$TOPIC/subtopics"/*; do
    for file in "$sub"/*.md; do
        # Skip if sub-subtopic already marked done
        if ! grep -q "DONE" "$file"; then
            echo "Next sub-subtopic: $(basename "$file")"
            exit 0
        fi
    done
done

echo "All sub-subtopics in $TOPIC completed!"
