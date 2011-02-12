<TeXmacs|1.0.7>

<style|generic>

<\body>
  <doc-data|<doc-title|Soft Integrals>>

  In this note we document the calculation of the soft contribution in an FKS
  subtraction framework. We want to extract the soft contribution from the
  integral

  <\equation>
    <big|int>d\<Phi\><rsup|n+1> R=<big|int>d\<Phi\><rsup|n>R<rsup|s> +
    remnants
  </equation>

  For this purpose, <math|R> can be given in the soft approximation

  <\equation>
    R=4\<pi\>\<alpha\><rsub|s> \<mu\><rsup|2\<epsilon\>>
    <left|[><big|sum><rsub|i\<neq\>j><with|math-font|cal|B><rsub|i
    j><frac|k<rsub|i>\<cdot\>k<rsub|j>|(k<rsub|i>\<cdot\>l)(k<rsub|j>\<cdot\>l)>-<with|math-font|cal|B><big|sum><rsub|i><frac|k<rsub|i><rsup|2>|(k<rsub|i>\<cdot\>l)<rsup|2>>C<rsub|i><right|]>,
  </equation>

  where <math|<with|math-font|cal|B><rsub|i j>> is the colour correlated Born
  cross section,<math| C<rsub|i>> is the casimir invariant for the
  <math|i<rsup|th>> leg, and <math|<with|math-font|cal|B>> is the Born cross
  section (all quantities as defined in FNO2006, eq. (2.97), and normalized
  according to eq. (2.98)).

  \;

  <section|Soft phase space>

  The phase space in the soft limit always factorizes as

  <\equation>
    d\<Phi\><rsup|n+1>=d\<Phi\><rsup|n><frac|d<rsup|d-1>l|2l<rsup|0>(2\<pi\>)<rsup|d-1>>
    .
  </equation>

  We write now

  <\equation>
    d<rsup|d-1>l=d l<rsub|1> d l<rsub|2> d<rsup|d-3>l<rsub|\<perp\>>=d
    l<rsub|1> d l<rsub|2> d l<rsub|\<perp\>>
    \ \ l<rsub|\<perp\>><rsup|-2\<epsilon\>>
    \<Omega\><rsup|1-2\<epsilon\>>,<label|eq:dl1>
  </equation>

  where we have used <math|d=4-2\<epsilon\>>, and <math|\<Omega\><rsup|n>> is
  the solid angle in <math|n> dimension. From

  <\equation>
    \<Omega\><rsup|n>=<frac|n \<pi\><rsup|n/2>|\<Gamma\>(1+n/2)>=<frac|\<pi\><rsup|n/2>
    2<rsup|n> \<Gamma\><left|(><frac|n+1|2><right|)>|<sqrt|\<pi\>>
    \<Gamma\>(n)> \<Longrightarrow\> \<Omega\><rsup|1-2\<epsilon\>>=2<frac|(4\<pi\>)<rsup|-\<epsilon\>>
    \<Gamma\><left|(>1-\<epsilon\><right|)>| \<Gamma\>(1-2\<epsilon\>)> .
  </equation>

  Turning eq. (<reference|eq:dl1>) into polar coordinates we get

  <\equation>
    <frac|d<rsup|d-1>l|2l<rsup|0>(2\<pi\>)<rsup|d-1>>=<frac|\<pi\><rsup|\<epsilon\>>
    \<Gamma\><left|(>1-\<epsilon\><right|)>| \<Gamma\>(1-2\<epsilon\>)>
    <frac|1|(2\<pi\>)<rsup|3>>l<rsup|1-2\<epsilon\>> d l \ \ d cos \<theta\>
    d\<phi\> (sin \<theta\> sin \<phi\>)<rsup|-2\<epsilon\>> .
  </equation>

  Observe that <math|l<rsub|\<perp\>>> is positive. Having defined

  <\equation>
    l<rsub|1>=cos \<theta\>, \ \ \ \ \ l<rsub|2>=sin \<theta\> cos \<phi\>,
    \ \ \ l<rsub|\<perp\>>=sin \<theta\> sin \<phi\> ,
  </equation>

  this means that <math|0\<less\>\<phi\>\<less\>\<pi\>>, and that only even
  quantities can be integrated in this way. In other words,
  <math|l<rsub|\<perp\>>> should not be confused with <math|l<rsub|3>>
  (<math|l<rsub|3>> is no longer available at this stage). Inserting

  <\equation>
    l=\<xi\><frac|<sqrt|s>|2>,
  </equation>

  this becomes

  <\equation>
    <frac|d<rsup|d-1>l|2l<rsup|0>(2\<pi\>)<rsup|d-1>>=<left|[><frac|(4\<pi\>)<rsup|\<epsilon\>>
    \<Gamma\><left|(>1-\<epsilon\><right|)>|
    \<Gamma\>(1-2\<epsilon\>)><right|]> s<rsup|-\<epsilon\>>
    <frac|1|(2\<pi\>)<rsup|3>> <frac|s|4> \<xi\><rsup|1-2\<epsilon\>> d\<xi\>
    \ \ \ d cos \<theta\> d\<phi\> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>> .
  </equation>

  This is to be multiplied by <math|\<xi\><rsup|-2>[\<xi\><rsup|2>R]>, with
  <math|[\<xi\><rsup|2>R]> having a finite limit as
  <math|\<xi\>\<rightarrow\>0>. The <math|\<xi\>> integration is performed by
  separating first

  <\equation>
    \<xi\><rsup|-1-2\<epsilon\>>=-<frac|\<xi\><rsub|c><rsup|-2\<epsilon\>>|2\<epsilon\>>\<delta\>(\<xi\>)+<left|(><frac|1|\<xi\>><right|)><rsub|\<xi\><rsub|c>>-2\<epsilon\><left|(><frac|log
    \<xi\>|\<xi\>><right|)><rsub|\<xi\><rsub|c>> ,
  </equation>

  where the <math|\<delta\>> term yields the soft contribution. We thus
  define

  <\eqnarray*>
    <tformat|<table|<row|<cell|R<rsup|s>>|<cell|=>|<cell|-<frac|1|2\<epsilon\>><left|[><frac|(4\<pi\>)<rsup|\<epsilon\>>
    \<Gamma\><left|(>1-\<epsilon\><right|)>|
    \<Gamma\>(1-2\<epsilon\>)><right|]> s<rsup|-\<epsilon\>>
    \<xi\><rsub|c><rsup|-2\<epsilon\>><frac|1|(2\<pi\>)<rsup|3>><big|int> d
    cos \<theta\> d\<phi\> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>>\<times\>>>|<row|<cell|>|<cell|>|<cell|<frac|s\<xi\><rsup|2>|4>
    4\<pi\>\<alpha\><rsub|s> \<mu\><rsup|2\<epsilon\>><left|[><big|sum><rsub|i\<neq\>j><with|math-font|cal|B><rsub|i
    j><frac|k<rsub|i>\<cdot\>k<rsub|j>|(k<rsub|i>\<cdot\>l)(k<rsub|j>\<cdot\>l)>-<with|math-font|cal|B><big|sum><rsub|i><frac|k<rsub|i><rsup|2>|(k<rsub|i>\<cdot\>l)<rsup|2>>C<rsub|i><right|]>,<eq-number>>>>>
  </eqnarray*>

  or, collecting the normalization factor of (2.93) of FNR2006

  <\equation*>
    <with|math-font|cal|N>=<frac|(4\<pi\>)<rsup|\<epsilon\>> |
    \<Gamma\>(1-\<epsilon\>)><left|(><frac|\<mu\><rsup|2>|Q<rsup|2>><right|)><rsup|\<epsilon\>>
    ,
  </equation*>

  we get

  <\eqnarray*>
    <tformat|<table|<row|<cell|R<rsup|s>>|<cell|=>|<cell|<with|math-font|cal|N>
    <left|[>1-<frac|\<pi\><rsup|2>|6>\<epsilon\><rsup|2><right|]><left|(><frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>><right|)><rsup|\<epsilon\>><left|(><frac|-1|2\<epsilon\>><right|)><frac|\<alpha\>|2\<pi\>><big|int>
    d cos \<theta\> d\<phi\> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>>\<times\>>>|<row|<cell|>|<cell|>|<cell|<frac|s\<xi\><rsup|2>
    |4><left|[><big|sum><rsub|i\<neq\>j><with|math-font|cal|B><rsub|i
    j><frac|k<rsub|i>\<cdot\>k<rsub|j>|(k<rsub|i>\<cdot\>l)(k<rsub|j>\<cdot\>l)>-<with|math-font|cal|B><big|sum><rsub|i><frac|k<rsub|i><rsup|2>|(k<rsub|i>\<cdot\>l)<rsup|2>>C<rsub|i><right|]>,<eq-number>>>>>
  </eqnarray*>

  <section|Two masselss particles>

  We begin with an iconal factor for massless particles with momenta
  <math|k<rsub|1>> and <math|k<rsub|2>>, <math|k<rsub|1><rsup|2>=k<rsub|2><rsup|2>=0>,

  <\equation>
    R<rsup|s><rsub|12>=<with|math-font|cal|N>
    <left|[>1-<frac|\<pi\><rsup|2>|6>\<epsilon\><rsup|2><right|]><left|(><frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>><right|)><rsup|\<epsilon\>><left|(><frac|-1|2\<epsilon\>><right|)><frac|\<alpha\>|2\<pi\>><big|int>
    d cos \<theta\> d\<phi\> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>>\<times\><frac|s\<xi\><rsup|2>
    |4><frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|1>\<cdot\>l
    \ \ \ \ k<rsub|2>\<cdot\>l> <with|math-font|cal|B><rsub|12>.
  </equation>

  We first expand

  <\equation>
    <frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|1>\<cdot\>l
    \ \ \ \ k<rsub|2>\<cdot\>l>=<frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|1>\<cdot\>l
    \ \ \ (k<rsub|1>+k<rsub|2>)\<cdot\>l>+<frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|2>\<cdot\>l
    \ \ (k<rsub|1>+k<rsub|2>)\<cdot\>l> .
  </equation>

  and define. for <math|k<rsup|2>=0> and <math|m<rsup|2>\<gtr\>0>,

  <\equation>
    I(k,m)=<big|int>d cos \<theta\> <frac|d\<phi\>|\<pi\>> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>> <left|[><frac|s\<xi\><rsup|2>|4><frac|k\<cdot\>m|k\<cdot\>l
    \ \ \ \ \ m\<cdot\>l><right|]> ,
  </equation>

  so that

  <\equation>
    I(k<rsub|1>,k<rsub|1>+k<rsub|2>)+I(k<rsub|2>,k<rsub|1>+k<rsub|2>)=<big|int>d
    cos \<theta\> <frac|d\<phi\>|\<pi\>> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>> <left|[><frac|s\<xi\><rsup|2>|4><frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|1>\<cdot\>l
    \ \ \ \ k<rsub|2>\<cdot\>l><right|]> .
  </equation>

  We have:

  <\equation>
    I(k,m)=<frac|1|\<epsilon\>>I<rsub|d>(k,m)+I<rsub|0>(k,m)+\<epsilon\>I<rsub|\<epsilon\>>(k,m)
    .
  </equation>

  We separate out the collinear component\ 

  <\equation>
    <frac|k\<cdot\>m|k\<cdot\>l \ \ m\<cdot\>l>=<left|[><frac|k\<cdot\>m|k\<cdot\>l
    \ \ m\<cdot\>l>-<frac|n\<cdot\>k| k\<cdot\>l
    \ \ \ n\<cdot\>l><right|]>+<frac|n\<cdot\>k| k\<cdot\>l \ \ \ n\<cdot\>l>
    ,
  </equation>

  where the term in square bracket has no collinear singularities. Assuming
  <math|n> along the time direction, we have:

  <\equation>
    <frac|s\<xi\><rsup|2>|4> \ <frac|n\<cdot\>k| k\<cdot\>l
    \ \ \ \ n\<cdot\>l>=<frac|1|1-cos \<theta\>> \ ,
  </equation>

  and

  <\equation>
    <big|int>d cos \<theta\> <frac|d\<phi\>|\<pi\>> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>> <frac|1|1-cos
    \<theta\>>=<frac|-1|\<epsilon\>> ,
  </equation>

  so

  <\equation>
    I<rsub|d>(k,m)=-1 .
  </equation>

  The remaining integral has no collinear singularities. We find

  <\equation>
    <big|int>d cos \<theta\> <frac|d\<phi\>|\<pi\>> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>> <frac|s\<xi\><rsup|2>|4><left|[><frac|k\<cdot\>m|k<rsub|>\<cdot\>l
    \ m\<cdot\>l>-<frac|k<rsup|0>| k\<cdot\>l \ \ \ l<rsup|0>><right|]>
    =I<rsub|0>(k,m)+\<epsilon\>I<rsub|\<varepsilon\>>(k,m) \ ,
  </equation>

  and, defining <math|<wide|k|^>=k/k<rsup|0>>, and
  <math|<wide|m|^>=m/m<rsup|0>>, we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|I<rsub|d>(k,m)>|<cell|=>|<cell|-1
    ,<eq-number>>>|<row|<cell|I<rsub|0>(k,m)>|<cell|=>|<cell|log<frac|(<wide|k|^>\<cdot\><wide|m|^>)<rsup|2>|<wide|m|^><rsup|2>>
    ,<eq-number>>>|<row|<cell|I<rsub|\<epsilon\>>(k,m)>|<cell|=>|<cell|-2<left|[><frac|1|4>log<rsup|2>
    <frac|1-\<beta\>|1+\<beta\>>+ log<frac|<wide|k|^>\<cdot\><wide|m|\<bind\>>|1+\<beta\>>
    log<frac|<wide|k|^>\<cdot\><wide|m|\<bind\>>|1-\<beta\>>+Li<rsub|2><left|(>1-<frac|<wide|k|^>\<cdot\><wide|m|\<bind\>>|1+\<beta\>><right|)>+Li<rsub|2><left|(>1-<frac|<wide|k|^>\<cdot\><wide|m|\<bind\>>|1-\<beta\>><right|)><right|]>
    ,<eq-number>>>>>
  </eqnarray*>

  with <math|\<beta\>=<sqrt|1-m<rsup|2>>>. We have\ 

  <\equation>
    <big|int>d cos \<theta\> <frac|d\<phi\>|\<pi\>> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>> <left|[><frac|s\<xi\><rsup|2>|4><frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|1>\<cdot\>l
    \ \ \ \ k<rsub|2>\<cdot\>l><right|]>=I(k<rsub|1>,k<rsub|1>+k<rsub|2>)+
    I(k<rsub|2>,k<rsub|1>+k<rsub|2>)
  </equation>

  So:

  <\eqnarray*>
    <tformat|<table|<row|<cell|R<rsup|s><rsub|12>
    >|<cell|=>|<cell|<left|[>1-<frac|\<pi\><rsup|2>|6>\<epsilon\><rsup|2><right|]><left|(><frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>><right|)><rsup|\<epsilon\>><left|(><frac|-1|2\<epsilon\>><right|)><big|int>d
    cos \<theta\> <frac|d\<phi\>|\<pi\>> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>> <left|[><frac|s\<xi\><rsup|2>|4><frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|1>\<cdot\>l
    \ \ k<rsub|2>\<cdot\>l><right|]>>>|<row|<cell|>|<cell|=>|<cell|<left|[>1+\<epsilon\>log<frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>>+<left|(><frac|1|2>log<rsup|2><frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>>-<frac|\<pi\><rsup|2>|6><right|)>\<epsilon\><rsup|2><right|]><left|(><frac|-1|2\<epsilon\>><right|)><left|[>I(k<rsub|1>,k<rsub|1>+k<rsub|2>)+
    I(k<rsub|2>,k<rsub|1>+k<rsub|2>)<right|]>>>|<row|<cell|>|<cell|=>|<cell|<frac|A|\<epsilon\><rsup|2>>+<frac|B|\<epsilon\>>+C<eq-number>>>>>
  </eqnarray*>

  with

  <\eqnarray*>
    <tformat|<table|<row|<cell|A>|<cell|=>|<cell|1<eq-number>>>|<row|<cell|B>|<cell|=>|<cell|log<frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>>-<frac|1|2><left|[>I<rsub|0>(k<rsub|1>,k<rsub|1>+k<rsub|2>)+I<rsub|0>(k<rsub|2>,k<rsub|1>+k<rsub|2>)<right|]><eq-number>>>|<row|<cell|C>|<cell|=>|<cell|<left|[><frac|1|2>log<rsup|2><frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>>-<frac|\<pi\><rsup|2>|6><right|]>-<frac|1|2><left|[>I<rsub|0>(k<rsub|1>,k<rsub|1>+k<rsub|2>)+I<rsub|0>(k<rsub|2>,k<rsub|1>+k<rsub|2>)<right|]>
    log<frac|Q<rsup|2>|s \ \ \<xi\><rsub|c><rsup|2>>+>>|<row|<cell|>|<cell|>|<cell|-<frac|1|2><left|[>I<rsub|\<epsilon\>>(k<rsub|1>,k<rsub|1>+k<rsub|2>)+I<rsub|\<epsilon\>>(k<rsub|2>,k<rsub|1>+k<rsub|2>)<right|]>
    \ .<eq-number>>>>>
  </eqnarray*>

  In case <math|k<rsub|1>> is massless and <math|k<rsub|2>> is not, we get
  instead

  <\eqnarray*>
    <tformat|<table|<row|<cell| R<rsup|s><rsub|12>>|<cell|=>|<cell|<left|[>1-<frac|\<pi\><rsup|2>|6>\<epsilon\><rsup|2><right|]><left|(><frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>><right|)><rsup|\<epsilon\>><left|(><frac|-1|2\<epsilon\>><right|)><big|int>d
    cos \<theta\> <frac|d\<phi\>|\<pi\>> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>> <left|[><frac|s\<xi\><rsup|2>|4><frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|1>\<cdot\>l
    \ \ k<rsub|2>\<cdot\>l><right|]>>>|<row|<cell|>|<cell|=>|<cell|<left|[>1+\<epsilon\>log<frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>>+<left|(><frac|1|2>log<rsup|2><frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>>-<frac|\<pi\><rsup|2>|6><right|)>\<epsilon\><rsup|2><right|]><left|(><frac|-1|2\<epsilon\>><right|)>
    I(k<rsub|1>,k<rsub|2>)>>|<row|<cell|>|<cell|=>|<cell|<frac|A|\<epsilon\><rsup|2>>+<frac|B|\<epsilon\>>+C<eq-number>>>>>
  </eqnarray*>

  <\with|mode|math>
    <\eqnarray*>
      <tformat|<table|<row|<cell|A>|<cell|=>|<cell|<frac|1|2><eq-number>>>|<row|<cell|B>|<cell|=>|<cell|<frac|1|2>log<frac|Q<rsup|2>|s
      \ \ \<xi\><rsub|c><rsup|2>>-<frac|1|2>
      I<rsub|0>(k<rsub|1>,k<rsub|2>)<eq-number>>>|<row|<cell|C>|<cell|=>|<cell|<frac|1|2><left|[>log<rsup|2><frac|Q<rsup|2>|s
      \ \ \<xi\><rsub|c><rsup|2>>-<frac|\<pi\><rsup|2>|6><right|]>-<frac|1|2>I<rsub|0>(k<rsub|1>,k<rsub|2>)
      log<frac|Q<rsup|2>|s \ \ \<xi\><rsub|c><rsup|2>>-<frac|1|2>I<rsub|\<epsilon\>>(k<rsub|1>,k<rsub|2>)
      \ .<eq-number>>>>>
    </eqnarray*>
  </with>

  In case both <math|k<rsub|1>> and <math|k<rsub|2>> are massive, we instead
  define

  <\equation>
    I(k<rsub|1>,k<rsub|2>)=I<rsub|0>(k<rsub|1>,k<rsub|2>)+\<epsilon\>I<rsub|\<varepsilon\>>(k<rsub|1>,k<rsub|2>)
    ,
  </equation>

  <\equation>
    I<rsub|0>(k<rsub|1>,k<rsub|2>)=<big|int>d cos \<theta\>
    <frac|d\<phi\>|\<pi\>> <left|[><frac|s\<xi\><rsup|2>|4><frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|1>\<cdot\>l
    \ \ k<rsub|2>\<cdot\>l><right|]>\ 
  </equation>

  <\equation>
    I<rsub|\<epsilon\>>(k<rsub|1>,k<rsub|2>)=-2<big|int>d cos \<theta\>
    <frac|d\<phi\>|\<pi\>>log[sin\<theta\> sin\<phi\>]
    <left|[><frac|s\<xi\><rsup|2>|4><frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|1>\<cdot\>l
    \ \ k<rsub|2>\<cdot\>l><right|]> .
  </equation>

  and get (neglecting now <math|\<epsilon\><rsup|2>> terms)

  <\eqnarray*>
    <tformat|<table|<row|<cell|R<rsup|s><rsub|12>>|<cell|=>|<cell|<left|(><frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>><right|)><rsup|\<epsilon\>><left|(><frac|-1|2\<epsilon\>><right|)><big|int>d
    cos \<theta\> <frac|d\<phi\>|\<pi\>> (sin \<theta\> sin
    \<phi\>)<rsup|-2\<epsilon\>> <left|[><frac|s\<xi\><rsup|2>|4><frac|k<rsub|1>\<cdot\>k<rsub|2>|k<rsub|1>\<cdot\>l
    \ \ k<rsub|2>\<cdot\>l><right|]>>>|<row|<cell|>|<cell|=>|<cell|<left|[>1+\<epsilon\>log<frac|Q<rsup|2>|s
    \ \ \<xi\><rsub|c><rsup|2>><right|]><frac|-I(k<rsub|1>,k<rsub|2>)|2\<epsilon\>>
    \ = <frac|B|\<epsilon\>>+C<eq-number>>>>>
  </eqnarray*>

  with

  <\with|mode|math>
    <\eqnarray*>
      <tformat|<table|<row|<cell|B>|<cell|=>|<cell|-<frac|1|2>
      I<rsub|0>(k<rsub|1>,k<rsub|2>)<eq-number>>>|<row|<cell|C>|<cell|=>|<cell|-<frac|1|2>I<rsub|0>(k<rsub|1>,k<rsub|2>)
      log<frac|Q<rsup|2>|s \ \ \<xi\><rsub|c><rsup|2>>-<frac|1|2>I<rsub|\<epsilon\>>(k<rsub|1>,k<rsub|2>)
      \ ,<eq-number>>>>>
    </eqnarray*>
  </with>

  and

  <\equation>
    I<rsub|0>(k<rsub|1>,k<rsub|2>)=<frac|1|\<beta\>>log
    <frac|1+\<beta\>|1-\<beta\>>, \ \ \ \ \ \ \ \ \ \ \<beta\>=<sqrt|1-<frac|k<rsub|1><rsup|2>k<rsub|2><rsup|2>|(k<rsub|1>\<cdot\>k<rsub|2>)<rsup|2>>>
    ,
  </equation>

  The expression for <math|I<rsub|\<epsilon\>>> is better given as a fortran
  function in this case.

  In the particular case <math|k<rsub|1>=k<rsub|2>=p> we have

  <\equation>
    I<rsub|0>=2
  </equation>

  <\equation>
    I<rsub|\<epsilon\>>=<frac|2|\<beta\>> log<frac|1+\<beta\>|1-\<beta\>> ,
    \ \ \ \ \ \ \ \<beta\>=<frac|\|<wide|p|\<vect\>>\||p<rsup|0>> .
  </equation>
</body>

<\initial>
  <\collection>
    <associate|sfactor|5>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|eq:dl1|<tuple|4|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Soft
      phase space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Two
      masselss particles> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>