
#let mode = 1 // 0 is eval // 1 is correction with slide 


#let slide(body, color : white) = align(center + top,text( size: 20pt, rect( inset: 15pt, fill: color ,body)))

#set page(paper: "presentation-16-9")
#set heading(numbering: " 1.1) ")
#show heading.where(level : 1): it => {
    let dict = it.body.children.last()
    let body = it.body.children.rev().slice(1).rev().join()
    let dict = eval(dict.text )
    let point = dict.point
    if mode == 0 {
        align(center, rect(inset : 15pt)[#body: $point/point$ \ #[*_#dict.consignes _*]] )
    } else {
        slide(  text(body, weight: "bold",size: 30pt), color: red)
     }
}
#show heading.where(level : 2): it => {    
    let dict = it.body.children.last()
    let body = it.body.children.rev().slice(1).rev().join()
    let dict = eval(dict.text )
    let point = dict.point
    if mode == 0 {
        underline(
        [Question] +
        counter(it.func()).display() +
        text(body.children.join()))
        linebreak() 
        if dict.keys().contains("hint") {[*_HINT :_* ] + emph(dict.hint) + linebreak()}
    }
    else {
        pagebreak()
        slide(it)
        if dict.keys().contains("correction") {rect(inset: 15pt, stroke: red + 1mm)[Correction: #dict.correction] }

    }
}

#show heading: it => text(it,weight: "light") // just to overwrite the formatting myself


= My Evaluation #{ (point : 20, consignes: [read the questions!]) }

== Where is the moon? #{(point : 2, hint : [think harder])}
#lorem(15)

== What is the moon? #{(point : 1, correction : [just multiply silly!])}
#lorem(15)

== What's the mass of the moon? #{(point : 1, correction : [just multiply silly!])}
#lorem(15)
