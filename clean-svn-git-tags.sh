#!/usr/bin/env sh

branches=`git branch | egrep -v master`

# delete all branches except master
if [ ! -z "$branches" ] ; then
	git branch -D $branches
fi

tags=`git tag`

for tag in $tags
do
	# avoid ambiguity with remote
	fullTag="refs/tags/$tag"

	# check if commit is empty
	diff=`git diff $fullTag^..$fullTag`
	if [ -z "$diff" ] ; then
		# The diff is empty in tag $fullTag
		# get commit hash
		commitTag=`git rev-parse $fullTag`
		# delete current tag
		git tag -d $tag
		# tag the previous commit with same name
		git tag $tag $commitTag^
	else
		echo The diff is not empty in tag $fullTag
		# requires manual rebase -i
	fi
done
