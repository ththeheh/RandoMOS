package ictgradschool.project.servlets;

import ictgradschool.project.servlets.PostJavaBean;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;

public class PostJavaBeanComparator implements Comparator<PostJavaBean> {
    private String sortField;
    private String sortOrder;

    public PostJavaBeanComparator(String sortField, String sortOrder) {
        this.sortField = sortField; // class member variable called 'sortField' is assigned the value of parameter also called 'sortField'
        this.sortOrder = sortOrder;
    }

    public int compare(PostJavaBean post1, PostJavaBean post2) {

        if (sortField.equals("title")) {
            if (sortOrder.equals("ascending")) {
                System.out.println("title ascending!");
                return post1.getTitle().compareTo(post2.getTitle());
            } else { // descending

                System.out.println("title descending!");

                return post2.getTitle().compareTo(post1.getTitle());
            }
        } else if (sortField.equals("username")) {
            // can't do return fi1.fullfileSize - fi2.fullfileSize; for ascending sort
            // or return fi2.fullfileSize - fi1.fullfileSize; for descending sort
            // since the type of fullfileSize is long and the return value of this function is int

            // Using the Java Object Wrapper "Long" to wrap basic data type long
            // and then use its object method compareTo() as we did with String.compareTo above
            if (sortOrder.equals("ascending")) {

                System.out.println("username ascending!");

                return post1.getUserName().compareTo(post2.getUserName());

            } else { // descending

                System.out.println("username descending!");

                return post2.getUserName().compareTo(post1.getUserName());
            }
        } else if (sortField.equals("date")) {
            DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String thisDateStr = post1.getDate();
            LocalDate thisdateLocal = LocalDate.parse(thisDateStr, inputFormat);
            String otherDateStr = post2.getDate();
            LocalDate otherdateLocal = LocalDate.parse(otherDateStr, inputFormat);
            if (sortOrder.equals("ascending")) {
                System.out.println("date ascending!");

                return thisdateLocal.compareTo(otherdateLocal);
            } else {

                System.out.println("date ascending!");

                return otherdateLocal.compareTo(thisdateLocal);

            }
        }

        System.out.println("something wrong with this");
        return 0;
    }
}