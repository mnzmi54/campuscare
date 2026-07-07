//CAMPUSCARE 2026
package bean;

public class DisciplineBean {
    private int disciplineID;
    private int studentID;
    private int hepID;
    private String offenseType;
    private String description;
    private String offenseDate;
    private String status;

    public DisciplineBean() {
    }

    public int getDisciplineID() {
        return disciplineID;
    }

    public void setDisciplineID(int disciplineID) {
        this.disciplineID = disciplineID;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public int getHepID() {
        return hepID;
    }

    public void setHepID(int hepID) {
        this.hepID = hepID;
    }

    public String getOffenseType() {
        return offenseType;
    }

    public void setOffenseType(String offenseType) {
        this.offenseType = offenseType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOffenseDate() {
        return offenseDate;
    }

    public void setOffenseDate(String offenseDate) {
        this.offenseDate = offenseDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
