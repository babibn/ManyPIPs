cd   $PSScriptRoot
rm requirements_?.txt -Verbose ;
cat .\requirements.freeze | % { echo  $_ >>"requirements_$($_.ToLower().ToChararray()[0]).txt" }


"z".."a"|%{"RUN [ ! -f requirements_$_.txt ] || pip install   --no-cache-dir -r requirements_$_.txt"}