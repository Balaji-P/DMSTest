
$repoPath = "C:\Users\balaji.a.perumal\Desktop\SuperDemo"
Push-Location
Set-Location $repoPath
$branchMatch = '*'
$defaultBranch = 'master'
$pushChanges = $false
$resultList = @{}
$branches = git for-each-ref --format='%(refname:short)' refs/remotes/origin
foreach($branch in $branches){
    $branchName = $branch.Substring(7, $branch.Length - 7)
    if($branchName -like $branchMatch -And !($branchName -eq   $defaultBranch)) {
        git checkout "$branchName" 2>&1 | write-host
        # pull any current branch changes
        git pull 2>&1 | write-host
        # merge in remote
        git pull origin $defaultBranch 2>&1 | write-host
        $workingDirectory = git status --porcelain
        if($workingDirectory -eq $null){
            # nothing in the working directory
            if($pushChanges){
                git push 2>&1 | write-host
            }
        $resultList.add($branchName, $success)
        Write-Host("$branchName successfully updated with changes from $DefaultBranch") -ForegroundColor Green
    }
    else {
        # pull wasn't clean
        $resultList.add( $fixedBranch, $failed )
        Write-Warning("Pull failed. Found conflicts.")
        git clean -fdx 2>&1 | write-host
        git reset --hard 2>&1 | write-host
    }
    # switch off so we can delete the copy we have
    git checkout $defaultBranch 2>&1 | write-host
    git branch -D $fixedBranch 2>&1 | write-host
    # reset working directory
    git reset --hard 2>&1 | write-host
    }
}