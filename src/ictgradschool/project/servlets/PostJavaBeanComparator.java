package ictgradschool.project.servlets;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;

public class PostJavaBeanComparator implements Comparator<PostJavaBean> {
    private String sortField;
    private String sortOrder;

    public PostJavaBeanComparator(String sortField, String sortOrder) {
        this.sortField = sortField;
        this.sortOrder = sortOrder;
    }

    public int compare(PostJavaBean post1, PostJavaBean post2) {

        if (sortField.equals("title")) {
            if (sortOrder.equals("ascending")) {
                System.out.println("title ascending!");
                return post1.getTitle().compareTo(post2.getTitle());
            } else {

                System.out.println("title descending!");

                return post2.getTitle().compareTo(post1.getTitle());
            }
        } else if (sortField.equals("username")) {
            if (sortOrder.equals("ascending")) {

                System.out.println("username ascending!");

                return post1.getUserName().compareTo(post2.getUserName());

            } else {
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

        return 0;
    }
}