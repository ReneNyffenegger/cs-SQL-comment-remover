set-strictMode -version latest

$src = get-content -raw SQL.cs

add-type -typeDef $src

$sqlText = @'
select
      29 + 13 as num    , -- As always: 42
     'xyz'    as literal, -- a literal
     [abc]
from
   [foo bar] join
     /* 
        comment
        comment
        comment
      
     */
    baz
    -- comment
'@

write-host ([tq84.SQL]::removeComments($sqlText))

write-host '-------------------------------------'

write-host ([tq84.SQL]::removeComments($sqlText, $true))

write-host '-------------------------------------'

write-host ([tq84.SQL]::removeComments($sqlText, $true, $true))
