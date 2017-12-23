USING: kernel locals sequences math.ranges math.functions ;
IN: tut1


: multiple? ( a b -- ? ) swap divisor? ; inline

: [2,b] ( n -- {2,...,n} ) 2 swap [a,b] ; inline

! without lexical variables
: prime? ( n -- ? ) [ sqrt [2,b] ] [ [ multiple? ] curry ] bi any? not ;

! with lexical variables
:: prime-l? ( n -- ? ) n sqrt [2,b] [ n multiple? ]  any? not ;

! with 'with'
: prime-w? ( n -- ? ) 2 over sqrt [a,b] [ divisor? ] with any? not ;

! fried
: prime-f? ( n -- ? ) [ '[ 2 _ sqrt [a,b] ] call ] [ '[ _ swap divisor? ] ] bi any? not ;


