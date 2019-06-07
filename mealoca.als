module mealoca

sig User {}

sig Professor extends User{
    projects: set Project,
    laboratories: set Laboratory
}

sig Student extends User{}

sig Laboratory{
    projects: set Project,
    professors: set Professor
}

sig Project{
    laboratories: set Laboratory,
    professors: set Professor
}

sig Application{
    project: lone Project
}

fact {
    all p: Project | p.professors in p.laboratories.professors
    all p: Professor | p.projects in p.laboratories.projects
}

assert Exemplo {
    all p: Professor | p.projects in p.laboratories.projects
}