#!/bin/bash
# merge_conflict_fix.sh - Script to resolve merge conflicts in the repository

echo "=== Merge Conflict Resolution Script ==="
echo "This script will resolve the merge conflicts between my-first-branch and main."
echo ""

# Check if we're on the right branch
current_branch=$(git branch --show-current)
echo "Current branch: $current_branch"

if [ "$current_branch" != "main" ]; then
    echo "Switching to main branch..."
    git checkout main
fi

echo ""
echo "=== Attempting merge with unrelated histories ==="
echo "The merge conflicts are caused by unrelated Git histories."
echo "Running: git merge my-first-branch --allow-unrelated-histories"
echo ""

# Perform the merge
git merge my-first-branch --allow-unrelated-histories --no-edit

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Merge completed successfully!"
    echo ""
    echo "Files merged:"
    git show --name-status HEAD~1..HEAD
    echo ""
    echo "The merge conflicts have been resolved."
    echo "PR #2 should now be mergeable."
else
    echo ""
    echo "❌ Merge failed. Please review the errors above."
    echo "You may need to resolve conflicts manually."
fi

echo ""
echo "=== Next Steps ==="
echo "1. Push the merged main branch: git push origin main"
echo "2. Verify that PR #2 now shows as mergeable"
echo "3. The PROFILE.md file from my-first-branch is now included in main"