module mealoca

abstract sig User {}

sig Tag {}

sig Professor extends User{
    projects: set Project,
    laboratories: set Laboratory
}

sig Student extends User{
    tags: set Tag
}

sig Laboratory{
    projects: set Project,
    professors: set Professor
}

sig Project{
    laboratories: set Laboratory,
    professors: set Professor,
    tags: set Tag
}

sig Application{
    project: one Project,
    tags: set Tag
}

//Project facts
fact {
    all p: Project | some p.laboratories  //Projeto está relacionado à ao menos um laboratório
    all p: Project | some p.professors  //Projeto está relacionado à ao menos um professor
}

//Laboratory facts
fact {
    all l: Laboratory | some l.professors //Laboratório tem ao menos um professor associado.
}

//Professor facts
fact {
    all p: Professor | p.projects in p.laboratories.projects //Todo projeto de um professor está associado a um laboratório do qual ele faz parte
}

show
