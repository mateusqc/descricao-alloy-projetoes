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
    applications: set Application,
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
    // relação entre n:m entre professor e project.
    all proj: Project | (all prof: Professor | proj in prof.projects iff prof in proj.professors)
    
    // relação entre n:m entre laboratory e project.
    all lab: Laboratory | (all proj: Project | lab in proj.laboratories iff proj in lab.projects)
    
    // relação entre n:m entre laboratory e professor.
    all prof: Professor | (all lab: Laboratory | lab in prof.laboratories iff prof in lab.professors)

    //relação 1:n entre Project e Application
    all a: Application | (all p: Project | a in p.applications iff a.project = p)
    
}

pred show {
	#Professor = 2
	#Project = 2
}
run show for 3
