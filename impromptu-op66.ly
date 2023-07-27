%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

#(set-global-staff-size 18)

\header {
  title = "Impromptu"
  subtitle = \markup \italic "(Fantaisie-Impromptu)"
  composer = "Frédéric Chopin"
  opus = "Op. 66 (1835)"
  maintainer = "Knute Snortum"
  maintainerEmail = "knute (at) snortum (dot) net"
  source = "https://vmirror.imslp.org/files/imglnks/usimg/e/ea/IMSLP139195-PMLP02259-FChopin_Fantaisie-impromptu,_Op.66_BH13.pdf"
  source = "http://conquest.imslp.info/files/imglnks/usimg/5/5d/IMSLP62071-PMLP02259-ChoFantaisieImpromOp66.pdf" 
  copyright = \markup { 
    \center-column {
      "Copyright © 2023 Knute Snortum. This work is licensed under the" 
      \with-url #"https://creativecommons.org/licenses/by-sa/4.0/" 
      "Creative Commons Attribution-ShareAlike 4.0 International License."
    }
  }
}

%%% Scheme functions %%%

makeSpanner =
#(define-music-function (mrkup) (markup?)
  #{
    \override TextSpanner.bound-details.left.text = #mrkup
    \override TextSpanner.bound-details.left.stencil-align-dir-y = 0
    \override TextSpanner.bound-details.left-broken.text = ##f
  #})

%%% Definitions

sd = \sustainOn
su = \sustainOff

staffUp   = \change Staff = "upper"
staffDown = \change Staff = "lower"

textUnderSlur = 
  \once {
    \override TextScript.avoid-slur = #'inside
    \override TextScript.outside-staff-priority = ##f
  }

strictGraceOn = {
  \override Score.SpacingSpanner.strict-note-spacing = ##t
  \newSpacingSection
}

strictGraceOff = {
  \revert Score.SpacingSpanner.strict-note-spacing
  \newSpacingSection
}

%%% Positions 

slurShapeA = \shape #'((0 . -3) (0 . -5) (0 . -5) (0 . -3)) \etc
slurShapeB = \shape #'((0 . 0) (0 . -0.5) (0 . -0.5) (0 . 0)) \etc
slurShapeC = \shape #'((0 . 0) (0 . -0.5) (0 . -0.5) (0 . 0)) \etc

%%% Markup

dimMarkup = \markup \italic "dim."
riten = \markup \large \italic "riten."
aTempo = \markup \large \italic "a tempo"
crescSempre = \makeSpanner \markup \large \italic "sempre cresc."
pesante = \markup \large \italic "pesante"
sotoVoce = \markup \large \italic "soto voce"
rit = \markup \large \italic "rit."
sempreF = \markup { \large "sempre" \dynamic f }
pocoAPocoDim = \makeSpanner \markup \large \italic "poco a poco diminuendo"
ppIlCanto = \markup { \dynamic pp \large "il canto marcato" }

%%% Music

global = {
  \time 4/4
  \key cs \minor
  \accidentalStyle piano
}

rightHand = \relative {
  \global
  R1 * 4 |
  r16 gs'( a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  r16 gs,( a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  r16 a,( cs ds  fs a cs ds  \ottava 1 b' a gs fs  e ds fs cs) |
  \ottava 0 bs( ds a gs  fs a e ds  fs cs bs ds a gs b a)~ |
  
  \barNumberCheck 9
  a16( gs a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  r16 gs,( as gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  ds16( e ds css  ds b' as gs)  fss( e' ds cs  b as gs fss) |
  as16( gs b css,)  e( ds gs as,)  cs( b ds fss,)  as( gs fss gs) |
  gs16->( gs' bs, cs)  fs,->( fs' bs, cs)  \stemDown es,->( es' bs cs)
    \stemNeutral fs,->( fs' bs, cs) |
  cs,16->( cs' fs, a)  ds,->( ds' fs, a)  e->( e' gs, b)  gs->( gs' b, e) |
  gs,16->( gs' bs, cs)  fs,->( fs' bs, cs)  \stemDown es,->( es' bs cs)
    \stemNeutral fs,->( fs' bs, cs) |
  \stemDown es,16->( es' b ds)  \stemNeutral fs,->( fs' b, ds)  a->( a' b, e)
    gs,->( gs' b, e) |
    
  \barNumberCheck 17
  gs,16( gs'-> bs, cs)  fs,( fs'-> bs, cs)  \stemDown es,( es'-> bs cs)
    \stemNeutral fs,( fs' bs, cs) |
  cs,16( cs'-> fs, a)  ds,( ds'-> fs, a)  e-\slurShapeB ( e'-> gs, b)
    gs( gs'-> b, e) |
  gs,16( gs'-> bs, cs)  fs,( fs'-> bs, cs)  ds( ds'-> fs, a)
    cs,( cs'-> fs, a) |
  cs,16( cs'-> ds, fs)  bs,( bs'-> ds, fs)  bs,( bs'-> ds, fs)
    bs,( bs'-> ds, fs) |
  c16( c'-> ds, fs)  b,( b'-> ds, fs)  b,( b'-> ds, fs)  as,( as'-> ds, fs) |
  as,16( as' ds, fs)  a,( a' ds, fs)  a,( a' ds, fs)  a,( a' ds, fs) |
  c16( c' ds, fs)  b,(b' ds, fs)  b,( b' ds, fs)  as,( as' ds, fs) |
  as,16( as' ds, fs)  a,( a' ds, fs)  a,( a' ds, fs)  gs,( gs' ds fs) |
  
  \barNumberCheck 25
  r16^\aTempo gs,( a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  r16 gs,( a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  r16 a,( cs ds  fs a cs ds  \ottava 1 b' a gs fs  e ds fs cs) |
  \ottava 0 bs( ds a gs  fs a e ds  fs cs bs ds a gs b a)~ |
  a16( gs a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  e16( ds e ds  css ds fs a)  fs( es fs es  dss es gs cs) |
  r16 cs,( d cs  bs cs fs a)  fs( es fs es  dss es gs cs) |
  gs16( fs gs fs  es fs a cs)  a( gs a gs fss gs bs ds) |
  
  \barNumberCheck 33
  gs,16( a gs fss  gs e'-> ds d  cs c b as  a gs g fs) |
  e16( fs e ds  e e'-> ds d  cs c b as  a gs g fs |
  gs16) r gs'( g  fs es e ds  d cs c b  as a gs g |
  fs es e ds  d cs c b  as a gs g  fs e ds cs |
  gs8) r \ottava 1 a'''16( gs e' e,)  fs( e cs' cs,)  ds( cs gs' gs,) |
  \ottava 0 a16( gs e' e,)  fs( e cs' cs,)  ds( cs gs' gs,)  a( gs e' e,) |
  fs16( e cs' cs,)  ds( cs gs' gs,)  ds'( cs gs' gs,)  ds'( cs a' a,) |
  ds16( cs gs' gs,) ds'( cs fss fss,)  ds'( cs gs' gs,)  ds'( bs gs' gs,) |
  
  \barNumberCheck 41
  \break
  \bar "||" 
  \key df \major
  R1 * 2 |
  \tempo "Moderato cantabile" 4 = 88
  af'2 \tag layout { bf8[(\trill } \tag midi { bf8[(\prall } af df ef]) |
  f2 af |
  gf4 f ef f8. df16 |
  af2 bf->~ |
  bf2 \tag layout { cf8[(\trill } \tag midi { cf8[(\prall } bf ef f]) |
  gf4( f ef f) |
  
  \barNumberCheck 49
  df2 \strictGraceOn \grace { c32*4[( df ef df] } \strictGraceOff f4.) ef8 |
  ef1-> |
  af,2^\aTempo \tag layout { bf8[(\trill } \tag midi { bf8[(\prall } 
    af df ef]) |
  f2 af-> |
  gf4 f ef \strictGraceOn \grace { f32*4[( ef df ef] } \strictGraceOff 
    f8.) df16 |
  af2 bf->~ |
  bf2 \tag layout { cf8[(\trill } \tag midi { cf8[(\prall } bf ef f]) |
  gf4( f ef f) |
  
  \barNumberCheck 57
  df4. g,32( af bf af) f'4. ef8 |
  ef2( df4) r8 af'( |
  af,2) \tag layout { bf8.[(\trill } \tag midi { bf8.[(\prall } 
    a16 bf8. c16]) |
  af8 r c'4(~ \tuplet 7/4 { c8[ bf af ff df bf8.) af'16]( } |
  ef,2)-> \acciaccatura { c'8 } bf8.[( a16 bf8. ef16]) |
  af,4 r bf \tuplet 3/2 { df8( c bf) } |
  af2 \tag layout { bf8[(\trill } \tag midi { bf8[(\prall } af df ef]) |
  f2 af-> |
  
  \barNumberCheck 65
  gf4 f ef \strictGraceOn \grace { f32*4[( ef df ef] } \strictGraceOff f8) df |
  af2 bf->~ |
  bf2 \tag layout { cf8[(\trill } \tag midi { cf8[(\prall } bf ef f]) |
  gf4( f ef f) |
  df4. g,32( af bf af) f'4.( ef8) |
  ef2( df4) r8 af'( |
  af,2) \tag layout { bf8.[(\trill } \tag midi { bf8.[(\prall } 
    a16 bf8. c16]) |
  af8 r c'4(~ \tuplet 7/4 { c8[ bf af ff df bf8.) af'16]( } |
  
  \barNumberCheck 73
  ef,2) \acciaccatura { c'8 } 
  bf8.[( a16 bf8. ef16]) |
  af,4 r bf \tuplet 3/2 { df8( c bf) } |
  af2 \tag layout { bf8[(\trill } \tag midi { bf8[(\prall } af df ef]) |
  f2 af |
  gf4 f ef \strictGraceOn \grace { f32*4[( ef df ef] } \strictGraceOff f8) df |
  af2 bf->~ |
  bf2 \tag layout { cf8[(\trill } \tag midi { cf8[(\prall } bf ef f]) |
  gf4( f ef f) |
  
  \barNumberCheck 81
  df4. g,32( af bf af) f'4. ef8 |
  ef1 |
  \break
  \bar "||"
  \key cs \minor
  r16 gs,( a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  r16 gs,( a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  r16 a,( cs ds  fs a cs ds  \ottava 1 b' a gs fs  e ds fs cs) |
  \ottava 0 bs( ds a gs  fs a e ds  fs cs bs ds a gs b a)~ |
  a16( gs a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  r16 gs,( as gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  
  \barNumberCheck 89
  ds16( e ds css  ds b' as gs)  fss( e' ds cs  b as gs fss) |
  as16( gs b css,)  e( ds gs as,)  cs( b ds fss,)  as( gs fss gs) |
  gs16->( gs' bs, cs)  fs,->( fs' bs, cs)  \stemDown es,->( es' bs cs)
    \stemNeutral fs,->( fs' bs, cs) |
  cs,16->( cs' fs, a)  ds,->( ds' fs, a)  e->( e' gs, b)  gs->( gs' b, e) |
  gs,16->( gs' bs, cs)  fs,->( fs' bs, cs)  \stemDown es,->( es' bs cs)
    fs,->( fs' bs, cs) |
  es,16->( es' b ds)  fs,->( fs' b, ds)  a->( a' b, e)  gs,->( gs' b, e) |
  gs,16( gs'-> bs, cs)  fs,( fs'-> bs, cs)  es,( es'-> bs cs)
    fs,( fs'-> bs, cs) |
  \stemNeutral cs,16( cs'-> fs, a)  ds,( ds'-> fs, a)  e-\slurShapeC ( 
    e'-> gs, b)  gs( gs'-> b, e) |
  
  \barNumberCheck 97
  gs,16( gs'-> bs, cs)  fs,( fs'-> bs, cs)  ds( ds'-> fs, a)
    cs,( cs'-> fs, a) |
  cs,16( cs'-> ds, fs)  bs,( bs'-> ds, fs)  bs,( bs'-> ds, fs)
    bs,( bs'-> ds, fs) |
  c16( c'-> ds, fs)  b,( b'-> ds, fs)  b,( b'-> ds, fs)  as,( as'-> ds, fs) |
  as,16( as'-> ds, fs)  a,( a' ds, fs)  a,( a' ds, fs)  a,( a' ds, fs) |
  c16( c' ds, fs)  b,( b' ds, fs)  b,( b' ds, fs)  as,( as' ds, fs) |
  as,16( as'-> ds, fs)  a,( a' ds, fs)  a,( a' ds, fs)  gs,( gs' ds fs) |
  r16^\aTempo gs,( a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  r16 gs,( a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  
  \barNumberCheck 105
  r16 a,( cs ds  fs a cs ds  \ottava 1 b' a gs fs  e ds fs cs) |
  \ottava 0 bs( ds a gs  fs a e ds  fs cs bs ds a gs b a)~ |
  a16( gs a gs  fss gs cs e  ds cs ds cs  bs cs e gs) |
  e16( ds e ds  css ds fs a)  fs( es fs es  dss es gs cs) |
  r16 cs,( d cs  bs cs fs a)  fs( es fs es  dss es gs cs) |
  gs16( fs gs fs  es fs a cs)  a( gs a gs fss gs bs ds) |
  gs,16( a gs fss  gs e'-> ds d  cs c b as  a gs g fs) |
  e16( fs e ds  e e'-> ds d  cs c b as  a gs g fs |
  
  \barNumberCheck 113
  gs16) r gs'( g  fs es e ds  d cs c b  as a gs g |
  fs es e ds  d cs c b  as a gs g  fs e ds cs |
  gs8) r \ottava 1 a'''16( gs e' e,)  fs( e cs' cs,)  ds( cs gs' gs,) |
  \ottava 0 a16( gs e' e,)  fs( e cs' cs,)  ds( cs gs' gs,)  a( gs e' e,) |
  fs16( e cs' cs,)  ds( cs gs' gs,)  ds'( cs gs' gs,)  ds'( cs a' a,) |
  ds16( cs gs' gs,)  ds'( cs fss fss,)  ds'( cs gs' gs,)  ds'( bs gs' gs,) |
  ds'16( cs gs' gs,)  a'( gs e'^> e,) \stemUp a( gs e'^> gs,) \stemNeutral
    a( gs ds'^> ds,) |
  a'16( gs ds'^> ds,)  a'( gs cs^> cs,)  e( ds gs^> gs,)  e'( ds gs^> gs,) |
  
  \barNumberCheck 121
  e'16( ds gs^> gs,)  a'( gs e'^> e,)  a( gs e'^> e,)  a( gs ds'^> ds,) |
  a'16( gs ds'^> ds,)  a'( gs cs^> cs,)  e( ds gs^> gs,)  e'( ds gs^> gs,) |
  e'16( ds gs^> gs,)  a'( gs e'^> e,)  fs( e cs'^> cs,)  a'( gs e'^> e,) |
  e16( ds gs^> gs,)  a'( gs e'^> e,)  fs( e cs'^> cs,)  a'( gs e'^> e,) |
  fs16( e cs' cs,)  a'( gs cs cs,)  fs( e cs' cs,)  a'( gs cs cs,) |
  fs16( e cs' cs,)  a'( gs cs cs,)  fs( e cs' cs,)  a'( gs cs cs,) |
  ds16( cs gs' gs,)  ds'( cs gs' gs,)  ds'( cs gs' gs,)  ds'( cs gs' gs,) |
  ds'16( cs gs' gs,)  ds'( cs gs' gs,)  ds'( cs gs' gs,)  ds'( cs gs' gs,) |
  
  \barNumberCheck 129
  \repeat unfold 6 { 
    ds'16( cs gs' gs,)  ds'( cs gs' gs,)  ds'( cs gs' gs,)  ds'( cs gs' gs,) |
  }
  ds'16( cs gs' es,)  ds'( cs gs' es,)  ds'( cs gs' es,)  ds'( cs gs' es,) |
  es'16( ds gs fs,)  es'( ds gs fs,)  es'( ds gs fs,)  es'( ds gs fs,) |
  
  \barNumberCheck 137
  <fs gs~ bs ds>1\arpeggio |
  <es gs cs>\arpeggio |
  \bar "|."
}

leftHand = \relative {
  \clef bass
  \global
  <gs, gs'>1~ |
  q1 |
  \omit TupletBracket
  \tuplet 3/2 4 { 
    <cs, cs'>8[( gs'' cs e cs gs])  cs,[( gs' cs e cs gs]) |
    cs,8[( gs' cs e cs gs)]  cs,[( gs' cs e cs gs)] |
  }
  \scaleDurations 4/6 {
    cs,8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    cs,8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    ds8[( a' cs fs cs a])  fs[( cs' ds a' ds, cs]) |
    gs,8[( ds' fs bs fs ds])  gs,[( ds' fs bs fs ds]) |
    
    \barNumberCheck 9
    cs8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    cs,8[( gs' as e' as, gs)]  e[( gs as cs as gs)] |
    ds8[( gs b ds b gs])  ds[( as' cs fss cs as]) |
    gs,8[(^\dimMarkup ds' gs b gs ds])  gs,8[( ds' gs b gs ds]) |
    a8[( cs fs a fs cs])  a[( cs fs a fs cs]) |
    b8[( fs' a b a fs])  e,[( b' e gs e b]) |
    a8[( cs fs a fs cs])  a[( cs fs a fs cs]) |
    b8[( ds a' b a ds,])  e,[( b' e gs e b]) |
    
    \barNumberCheck 17
    a8[( cs fs a fs cs])  a8[( cs fs a fs cs]) |
    b8[( fs' a b a fs])  e,[( b' e gs e b]) |
    a8[( cs fs a fs cs])  a[( ds fs a fs ds]) |
    gs,8[( ds' fs bs fs ds])  gs,[( ds' fs bs fs ds]) |
    a8[( ds fs b fs ds])  as[( ds fs as fs ds]) |
    bs8[( ds fs a fs ds])  bs[( ds fs a fs ds]) |
    a8[( ds fs b fs ds])  as[( ds fs as fs ds]) |
    b8[( ds fs a fs ds])  bs[( ds fs gs fs ds]) |
    
    \barNumberCheck 25
    cs8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    cs,8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    ds8[( a' cs fs cs a])  fs[( cs' ds a' ds, cs]) |
    gs,8[( ds' fs bs fs ds])  gs,[( ds' fs bs fs ds]) |
    cs8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    fs8[( cs' ds a' ds, cs])  \clef treble gs[( cs es b' es, cs]) |
    a8[( cs fs a fs cs])  gs[( cs es b' es, cs]) |
    a8[( cs fs a fs cs])  \clef bass bs,[( fs' gs ds' gs, fs]) |
    
    \barNumberCheck 33
    cs8[( gs' cs e cs gs])  ds[( gs bs fs' bs, gs]) |
    e8[( gs cs e cs gs])  fs[( cs' ds a' ds, cs]) |
  }
  <gs cs e gs>8 r r4 <fss cs' e a> r |
  R1 |
  <gs,, gs'>8 r \clef treble <e''' e'>4 <cs cs'> <gs gs'> |
  \clef bass <e e'>4 <cs cs'> <gs gs'> <e e'> |
  <cs cs'>4 <gs gs'> q <a a'> |
  <gs gs'>4 <fss fss'> <gs gs'>2 |
  
  \barNumberCheck 41
  \key df \major
  \override Beam.auto-knee-gap = ##f
  \stemDown
  \tuplet 3/2 4 { df'8[(^\pesante af' df f af df])  f[( df af f df af]) } |
  \scaleDurations 2/3 {
    df,8[( af' df f af df]) f[( df af f df af])~ |
    <df, af'>8[( af'' c ef c af])  df,[( af' c gf' c, af]) |
    df,8[( af' df f df af])  
      << 
        { s4. \staffUp af'4*3/2-> \staffDown } 
        \\ 
        { df,,8[-\slurShapeA ^( af' f' \staffUp af \staffDown f af,]) } 
      >> |
    gf'8->( ef af,)  f'->( df af)  ef'(-> c af)  df->( af f) |
    af,8[( ef' af c af ef])  gf,[( gf' bf df bf gf]) |
    bf,8[( f' bf d bf f])  bf,[( bf' d af' d, bf]) |
    ef,8( gf' bf,)  f( f' a,)  gf( ef' bf)  af( gf' c,) |
    
    \barNumberCheck 49
    df,8[( af' df f df af])  ef[( g df' ef df g,]) |
    af,8[( ef' af c af ef])  af,[( ef' gf bf gf ef]) |
    af,8[( ef' af c af ef])  af,[( af' c gf' c, af]) |
    df,8[( af' df f df af])  
      << 
        { s4. \staffUp af'4*3/2-> \staffDown } 
        \\ 
        { df,,8[^( af' f' \staffUp af \staffDown f af,]) } 
      >> |
    gf'8->( ef af,)  f'->( df af)  ef'(-> c af)  df->( af f) |
    af,8[( ef' af c af ef])  gf,[( gf' bf df bf gf]) |
    bf,8[( f' bf d bf f])  bf,[( bf' d af' d, bf]) |
    ef,8( gf' bf,)  f( f' a,)  gf( ef' bf)  af( gf' c,) |
    
    \barNumberCheck 57
    df,8[( af' df f df af])  df,[( af' c gf' c, af]) |
    df,8[( af' c gf' c, af])  df,[( af' df f df af]) |
    af,8[( ef' af c af ef])  af,[( ef' g df' g, ef]) |
    af,8[( ef' af c af ef])  df[( af' df ff df af]) |
    ef,8[( ef' af c af ef])  ef,[( ef' g df' g, ef]) |
    af,8[( ef' af c af ef])  gf,![( gf' bf df bf gf]) |
    af,8[( af' c ef c af])  ef[( af c gf' c, af]) |
    df,8[( af' df f df af])  
      << 
        { s4. \staffUp af'4*3/2-> \staffDown } 
        \\ 
        { df,,8[^( af' f' \staffUp af \staffDown f af,]) } 
      >> |
      
    \barNumberCheck 65
    gf'8->( ef af,)  f'->( df af)  ef'(-> c af)  df->( af f) |
    af,8[( ef' af c af ef])  gf,[( gf' bf df bf gf]) |
    bf,8[( f' bf d bf f])  bf,[( bf' d af' d, bf]) |
    ef,8( gf' bf,)  f( f' a,)  gf( ef' bf)  af( gf' c,) |
    df,8[( af' df f df af])  df,[( af' c gf' c, af]) |
    df,8[( af' c gf' c, af])  df,[( af' df f df af]) |
    af,8[( ef' af c af ef])  af,[( ef' g df' g, ef]) |
    af,8[( ef' af c af ef])  df[( af' df ff df af]) |
    
    \barNumberCheck 73
    ef,8[( ef' af c af ef])  ef,[( ef' g df' g, ef]) |
    af,8[( ef' af c af ef])  gf,![( gf' bf df bf gf]) |
    af,8[( ef' af c af ef])  af,[( af' c gf' c, af]) |
    df,8[( af' df f df af])  
      << 
        { s4. \staffUp af'4*3/2-> \staffDown } 
        \\ 
        { df,,8[^( af' f' \staffUp af \staffDown f af,]) } 
      >> |
    gf'8->( ef af,)  f'->( df af)  ef'(-> c af)  df->( af f) |
    af,8[( ef' af c af ef])  gf,[( gf' bf df bf gf]) |
    bf,8[( f' bf d bf f])  bf,[( bf' d af' d, bf]) |
    ef,8( gf' bf,)  f( f' a,)  gf( ef' bf)  af( gf' c,) |
    
    \barNumberCheck 81
    df,8[( af' df f df af])  df,[( af' c gf' c, af]) |
    df,8[( af' c gf' c, af])  df,[( af' c gf' c, af]) |
    \key cs \minor
    \stemNeutral
    cs,8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    cs,8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    ds8[( a' cs fs cs a])  fs[( cs' ds a' ds, cs]) |
    gs,8[( ds' fs bs fs ds])  gs,[( ds' fs bs fs ds]) |
    cs8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    cs,8[( gs' as e' as, gs)]  e[( gs as cs as gs)] |
    
    \barNumberCheck 89
    ds8[( gs b ds b gs])  ds[( as' cs fss cs as]) |
    gs,8[(^\dimMarkup ds' gs b gs ds])  gs,8[( ds' gs b gs ds]) |
    a8[( cs fs a fs cs])  a[( cs fs a fs cs]) |
    b8[( fs' a b a fs])  e,[( b' e gs e b]) |
    a8[( cs fs a fs cs])  a[( cs fs a fs cs]) |
    b8[( ds a' b a ds,])  e,[( b' e gs e b]) |
    a8[( cs fs a fs cs])  a[( cs fs a fs cs]) |
    b8[( fs' a b a fs])  e,[( b' e gs e b]) |
    
    \barNumberCheck 97
    a8[( cs fs a fs cs])  a[( ds fs a fs ds]) |
    gs,8[( ds' fs bs fs ds])  gs,[( ds' fs bs fs ds]) |
    a8[( ds fs b fs ds])  as[( ds fs as fs ds]) |
    bs8[( ds fs a fs ds])  bs[( ds fs a fs ds]) |
    a8[( ds fs b fs ds])  as[( ds fs as fs ds]) |
    b8[( ds fs a fs ds])  bs[( ds fs gs fs ds]) |
    cs8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    cs,8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    
    \barNumberCheck 105
    ds8[( a' cs fs cs a])  fs[( cs' ds a' ds, cs]) |
    gs,8[( ds' fs bs fs ds])  gs,[( ds' fs bs fs ds]) |
    cs8[( gs' cs e cs gs)]  e[( gs cs e cs gs)] |
    fs8[( cs' ds a' ds, cs])  \clef treble gs[( cs es b' es, cs)] |
    a8[( cs fs a fs cs])  gs[( cs es b' es, cs]) |
    a8[( cs fs a fs cs])  \clef bass bs,[( fs' gs ds' gs, fs]) |
    cs8[( gs' cs e cs gs])  ds[( gs bs fs' bs, gs]) |
    e8[( gs cs e cs gs])  fs[( cs' ds a' ds, cs]) |
  }
  
  \barNumberCheck 113
  <gs cs e gs>8 r r4 <fss cs' e a> r |
  R1 |
  <gs,, gs'>8 r \clef treble <e''' e'>4 <cs cs'> <gs gs'> |
  \clef bass <e e'>4 <cs cs'> <gs gs'> <e e'> |
  <cs cs'>4 <gs gs'> q <a a'> |
  <gs gs'>4 <fss fss'> <gs gs'>2 |
  cs8[( e' cs gs])  cs,[( fs' bs, gs]) |
  cs,8[( e' cs gs])  cs,[( fs' bs, gs]) |
  
  \barNumberCheck 121
  cs,8[( e' cs gs])  cs,[( fs' bs, gs]) |
  cs,8[( e' cs gs])  cs,[( fs' bs, gs]) |
  cs,8[( e' cs gs])  cs,[( gs'' cs, gs]) |
  cs,8[( e' cs gs])  cs,[( gs'' cs, gs]) |
  cs,8[( e' cs gs])  cs,[( e' cs gs]) |
  cs,8[( e' cs gs])  cs,[( e' cs gs]) |
  cs,4 r r2 |
  R1 |
  
  \barNumberCheck 129
  <cs gs'>1-> |
  as'4( gs cs ds) |
  es1 |
  gs1-> |
  fs2( es) |
  ds2 es4( cs) |
  gs1 |
  <gs, gs'>1 |
  
  \barNumberCheck 137
  <cs gs'>\arpeggio |
  q\arpeggio |
}

dynamics = {
  \override TextScript.Y-offset = -0.5
  s1\sf |
  s1 * 3 |
  s1\p |
  s1 |
  r16 s4..\< s4..\> s16\! |
  s4 s2\> s8\! s |
  
  \barNumberCheck 9
  s1 * 2 |
  s2...\cresc s16\! |
  s8.\> s16\! s8.\> s16\! s8.\> s16\! s8.\> s16\! |
  s1\f |
  s1 * 3 |
  
  \barNumberCheck 17
  s1\p |
  s2 s\cresc |
  s2 s4..\f\> s16\! |
  s1 * 3 |
  s1\pp |
  s2 s^\riten |
  
  \barNumberCheck 25
  s1\p |
  s1 |
  r16 s4..\< s4..\> s16\! |
  s1 |
  s2 s\cresc |
  s1 |
  s2... s16\! |
  \crescSempre s1-\tweak Y-offset -0.5 \startTextSpan |
  
  \barNumberCheck 33
  s1 * 2 |
  s8\stopTextSpan s2..\f |
  s1 |
  s1\ff |
  s1 * 2 |
  s4 s2.^\riten |
  
  \barNumberCheck 41
  % key of df major
  \tuplet 3/2 { s4.\< s4 s8\! s4.\> s4 s8\! | }
  s1 |
  s2^\sotoVoce s4..\< s16\! |
  s4..\< s16\! s2 |
  s2. s8.\> s16\! |
  s1 |
  s2 s4..\< s16\! |
  s1 |
  
  \barNumberCheck 49
  s1 |
  s2 s^\rit |
  s2 s4..\< s16\! |
  s1 * 3 |
  s2 s4..\< s16\! |
  s1 |
  
  \barNumberCheck 57
  s2 s4..\> s16\! |
  s1 |
  s2\sf s4..\< s16\! |
  s4 s\sf s4..\f\> s16\! |
  s2 s4..\< s16\! |
  s2 s4\pp s8.\> s16\! |
  s2 s4..\< s16\! |
  s1 | 
  
  \barNumberCheck 65
  s2. s8.\> s16\! |
  s2 s\sf |
  s2 s4..\< s16\! |
  s2...\> s16\! |
  s2 s4..\> s16\! |
  s1 |
  s1\sf |
  s4 s\f s4..\> s16\! |
  
  \barNumberCheck 73
  s1 |
  s2 s4\pp s8.\> s16\! |
  s2 s4..\< s16\! |
  s1 * 3 |
  s2 s4..\< s16\! |
  s2...\> s16\! |
  
  \barNumberCheck 81
  s1 |
  s1^\riten
  % key of cs minor
  s1\p |
  s1 |
  r16 s4..\< s4..\> s16\! |
  s4 s2\> s8. s16\! |
  s1 |
  s2. s4\cresc |
  
  \barNumberCheck 89
  s2... s16\! |
  s8.\> s16\! s8.\> s16\! s8.\> s16\! s8.\> s16\! |
  s1\f |
  s1 * 3 |
  s1\p |
  s2. s4\cresc |
  
  \barNumberCheck 97
  s2 s4..\f\> s16\! |
  s1 * 3 |
  s1\pp |
  s2 s^\riten |
  s1\p |
  s1 |
  
  \barNumberCheck 105
  r16 s4..\< s4..\> s16\! |
  s1 |
  s2 s\cresc |
  s1 |
  s2... s16\! |
  \crescSempre s1-\tweak Y-offset -0.5 \startTextSpan |
  s1 * 2 |
  
  \barNumberCheck 113
  s8\stopTextSpan s2..\f |
  s1 |
  s1\ff |
  s1 * 3 |
  \tag layout { s1^\sempreF } \tag midi { s1\ff } |
  s2 s\p |
  
  \barNumberCheck 121
  s4 s2.\ff |
  s2 s\p |
  s4 s2.\ff |
  s1 |
  \tag layout { \pocoAPocoDim s1\startTextSpan } \tag midi { s1\dim } |
  s1 |
  \tag layout { s4.. s16\stopTextSpan } \tag midi { s2 } s2\p |
  s1 |
  
  \barNumberCheck 129
  \tag layout { s1^\ppIlCanto } \tag midi { s1\pp } |
  s1 * 6 |
  s1^\riten |
  
  \barNumberCheck 137
  s1\ppp |
}

pedal = {
  s1\sd |
  s2. s4\su |
  s1\sd |
  s2... s16\su |
  \repeat unfold 3 { s2...\sd s16\su | }
  s2\sd s4..\su\sd s16\su |
  
  \barNumberCheck 9
  s2...\sd s16\su |
  s2...\sd s16\su |
  \repeat unfold 6 { s2\sd s4..\su\sd s16\su | }
  
  \barNumberCheck 17
  \repeat unfold 8 { s2\sd s4..\su\sd s16\su | }
  
  \barNumberCheck 25
  \repeat unfold 3 { s2...\sd s16\su | }
  \repeat unfold 5 { s4..\sd s16\su s4..\sd s16\su | }
  
  \barNumberCheck 33
  \repeat unfold 2 { s4..\sd s16\su s4..\sd s16\su | }
  s2 s4\sd s\su |
  s1 |
  s1\sd |
  s2... s16\su |
  s1 * 2 |
  
  \barNumberCheck 41
  % key of df major
  s1\sd |
  s2... s16\su |
  s2\sd s4..\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s4\sd s\su\sd s\su\sd s8.\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s4\sd s\su\sd s\su\sd s8.\su\sd s16\su |
  
  \barNumberCheck 49
  \repeat unfold 4 { s2\sd s4..\su\sd s16\su | }
  s4\sd s\su\sd s\su\sd s8.\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s4\sd s\su\sd s\su\sd s8.\su\sd s16\su |
  
  \barNumberCheck 57
  s2\sd s4..\su\sd s16\su |
  s2\sd s\su |
  \repeat unfold 6 { s2\sd s4..\su\sd s16\su | }
  
  \barNumberCheck 65
  s4\sd s\su\sd s\su\sd s8.\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s4\sd s\su\sd s\su\sd s8.\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s2\sd s\su |
  s2\sd s4..\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  
  \barNumberCheck 73
  \repeat unfold 4 { s2\sd s4..\su\sd s16\su | }
  s4\sd s\su\sd s\su\sd s8.\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  s4\sd s\su\sd s\su\sd s8.\su\sd s16\su |
  
  \barNumberCheck 81
  s2\sd s4..\su\sd s16\su |
  s2...\sd s16-\tweak extra-offset #'(-1.5 . 0) \su |
  % key of cs minor
  \repeat unfold 3 { s2...\sd s16\su | }
  s2\sd s4..\su\sd s16\su |
  s2...\sd s16\su |
  s2...\sd s16\su |
  
  \barNumberCheck 89
  \repeat unfold 8 { s2\sd s4..\su\sd s16\su | }
  
  \barNumberCheck 97
  \repeat unfold 6 { s2\sd s4..\su\sd s16\su | }
  s2...\sd s16\su |
  s2...\sd s16\su |
  
  \barNumberCheck 105
  \repeat unfold 8 { s2\sd s4..\su\sd s16\su | }
  
  \barNumberCheck 113
  s2 s4\sd s\su |
  s1 |
  s1\sd |
  s2... s16\su |
  s2\sd s4..\su\sd s16\su |
  s1 | 
  s2\sd s4..\su\sd s16\su |
  s2\sd s4..\su\sd s16\su |
  
  \barNumberCheck 121
  \repeat unfold 3 { s2\sd s4..\su\sd s16\su | }
  s2...\sd s16\su |
  s1\sd |
  s2... s16\su |
  s1 * 2 |
  
  \barNumberCheck 129
  s2...\sd s16\su |
  s1 * 2 |
  s2...\sd s16\su |
  s1 * 2 |
  s2...\sd s16\su |
  s2...\sd s16\su |
  
  \barNumberCheck 137
  \tag layout {
    s2.\sd s4\su |
    s2.\sd s4\su |
  }
  \tag midi {
    s1\sd |
    s1\su\sd |
  }
}

tempi = {
  \set Score.tempoHideNote = ##t
  \tempo "Allegro agitato" 2 = 84
  s1 * 8 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 7 |
  s2 \tempo 2 = 60 s |
  
  \barNumberCheck 25
  \tempo 2 = 84 s1 |
  s1 * 7 |
  
  \barNumberCheck 33
  s1 * 7 |
  s4 \tempo 2 = 60 s2 \tempo 2 = 50 s4 |
  
  \barNumberCheck 41
  \tempo "Largo" 4 = 88
  s1 * 8 |
  
  \barNumberCheck 49
  s1 |
  s2 \tempo 4 = 80 s |
  \tempo 4 = 88 s1 |
  s1 * 5 |
  
  \barNumberCheck 57
  s1 * 8 |
  
  \barNumberCheck 65
  s1 * 8 |
  
  \barNumberCheck 73
  s1 * 8 |
  
  \barNumberCheck 81
  s1 |
  \tempo 4 = 80 s2 \tempo 4 = 72 s |
  \tempo "Tempo primo" 2 = 84 s1 |
  s1 * 5 |
  
  \barNumberCheck 89
  s1 * 8 |
  
  \barNumberCheck 97
  s1 * 5 |
  s2 \tempo 2 = 60 s |
  \tempo 2 = 84 s1 |
  s1 |
  
  \barNumberCheck 105
  s1 * 8 |
  
  \barNumberCheck 113
  s1 * 8 |
  
  \barNumberCheck 121
  s1 * 8 |
  
  \barNumberCheck 129
  s1 * 7 |
  \tempo 2 = 74 s2 \tempo 2 = 64 s |
}

%%% Output

\paper {
  ragged-right = ##f
  ragged-last-bottom = ##f
  min-systems-per-page = 5
  page-count = 9
  
  last-bottom-spacing = 
    #'((basic-distance . 6)
       (minimum-distance . 4)
       (padding . 3)
       (stretchability . 30)) % defaults 1, 0, 1, 30
    
  top-system-spacing.minimum-distance = 10
    
  #(set-paper-size "letter")
  
  two-sided = ##t
  inner-margin = 12\mm
  outer-margin = 8\mm
}

\layout {
  \context {
    \Score
    \omit BarNumber
    \override Slur.details.free-head-distance = 1
  }
  \context {
    \PianoStaff
    \consists Span_stem_engraver
    connectArpeggios = ##t
  } 
  \context {
    \Voice
    \override Tie.minimum-length = 2
  }
}

\midi {
  \context {
    \Staff
    \consists "Dynamic_performer"
  }
  \context {
    \Voice
    \remove "Dynamic_performer"
  } 
  \context {
    \Score
    midiMinimumVolume = #0.35
    midiMaximumVolume = #0.99
  }  
}

\score { 
  \keepWithTag #'layout
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Dynamics \pedal
    \new Devnull \tempi
  >>
  \layout {}
}

\include "articulate.ly"

\score { 
  \keepWithTag #'midi
  \articulate <<
    \new Score <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
  >>
  \midi {}
}
