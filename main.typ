#import "template.typ": *
#show: ams-article.with(
  title: [標準様相論理の諸性質とその形式化],
  authors: (
    (
      name: "SnO2WMaN",
      url: "sno2wman.net"
    ),
  ),
  abstract: [
    標準様相論理の諸性質，具体的には健全性，完全性などについて，自己完結した証明を与える．
    また本書の証明は定理証明支援系であるLean 4によって形式化したので，それについて少し述べる．
  ],
  bibliography-file: "bib.yaml",
)

#let vdash = $tack.r$

本書の証明は @openlogic, @kikuchi2016 などを参照しているが，一部改変している．
特に強完全性定理の為のLindenbaum補題はZornの補題を用いて大幅に省略している．

#theorem[
  以下のように，論理式の形を規定する式を公理図式という．すなわち，$Phi,Psi$を適当な論理式で置き換えたものは論理式となる．

  公理図式は論理式ではないことに注意せよ．

  ある公理図式に対し，その形を満たす論理式の集合を公理集合という．

  以下では，記号を濫用し，公理図式を表す記号と対応する公理集合を同じ記号で表すことにする．
  例えば，$K$は公理図式を表す記号だが，同時に$K$の形を満たす公理集合を表す記号でもあるとする．
]

#theorem[
  公理集合の合併もまた公理集合である．
  ただし，普通は$union$は省略して繋げて表す．
  また，一般に考える公理集合には大抵$K$が含まれるので，$K$は先頭に置かれる．
  すなわち，$K union Lambda_1 union Lambda_2$は$K Lambda_1 Lambda_2$と表記する．

  更に，いくつかの公理集合の合併には特別な名前が存在する．
  - 一般に，$K T 4$は$S 4$，$K T 5$は$S 5$ と表記する．
  - $K L$ は一般に $G L$ と表記される．
]

#theorem[
  $Gamma$は論理式の集合，$phi$は論理式とする．
  公理集合$Lambda$に対し，$Gamma$から$phi$への*演繹*を$Gamma vdash_Lambda phi$と書き，以下のように再帰的に定める．

  1. $phi in Gamma$のとき，$Gamma vdash_Lambda phi$
  2. $phi in Lambda$のとき，$Gamma vdash_Lambda phi$
  3. $Gamma_1 vdash_Lambda phi -> psi$かつ$Gamma_2 vdash_Lambda phi$があるとき，$Gamma_1 union Gamma_2 vdash_Lambda psi$
  4. $emptyset vdash_Lambda phi$のとき，任意に$Gamma$を取って$Gamma vdash_Lambda square.stroked phi$
  5. $phi$が以下の（古典）命題論理の公理の形であるとき，任意に$Gamma$を取って$Gamma vdash_Lambda phi$

  $Gamma$から$phi$への演繹$Gamma vdash phi$が存在する（あるいは構成出来る）とき，$Gamma$から$phi$は*演繹可能*であるという．
]

#theorem[
  $Gamma$から$bot$が演繹可能なとき，$Gamma$は*$Lambda$矛盾*しているという．逆に$bot$が演繹可能でないなら，$Gamma$は$Lambda$矛盾していないまたは*$Lambda$無矛盾*という．
]

#theorem[
  $Gamma subset.eq Delta$ならば，$Gamma vdash_Lambda phi$から$Delta vdash_Lambda phi$を構成可能．
]
#proof[
  演繹の構成による帰納法を用いればよい．
  モーダスポネンスの場合以外はほぼ明らか．

  モーダスポネンスの場合について示す．
  $Gamma vdash_Lambda phi$が$Gamma_1 vdash_Lambda psi -> phi$と$Gamma_2 vdash_Lambda psi$より構成された演繹だとする．
  このとき，$Gamma = Gamma_1 union Gamma_2 subset.eq Delta$であることに注意する．
  明らかに，$Gamma_1 subset.eq Delta$と$Gamma_2 subset.eq Delta$であるから，帰納法の仮定より演繹$Delta vdash_Lambda psi -> phi$と$Delta vdash_Lambda psi$を構成出来て，
  これよりモーダスポネンスから$Delta union Delta vdash_Lambda phi$を構成出来る．$Delta union Delta = Delta$だから，$Delta vdash_Lambda phi$が構成出来て題意は示される．
]

#theorem[
  $Lambda subset.eq Lambda'$ならば，$Gamma vdash_Lambda phi$から$Gamma vdash_Lambda' phi$を構成可能．
]
#proof[
  明らか．
]

#theorem[
  $Gamma union {phi} vdash_Lambda psi$ から $Gamma vdash_Lambda phi -> psi$ が構成可能である，逆もまた然り．
]

#proof[
  逆の場合は $Gamma union {phi} vdash_Lambda phi$ から弱化とモーダスポネンスより直ちに明らかである．

  順の場合については，$Gamma vdash_Lambda psi$ から $Gamma \\ {phi} vdash_Lambda phi -> psi$ が構成可能という形で示せば十分．
]

#theorem[
  任意の演繹$Gamma vdash_Lambda phi$に対し，ある有限集合$Delta subset.eq Gamma$が存在して$Delta vdash_Lambda phi$が構成可能．
]
