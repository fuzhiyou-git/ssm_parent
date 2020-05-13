package com.itheima.pojo;

import lombok.*;

import java.util.List;
import java.util.Objects;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UsersInfo {
    private Integer id;
    private String username;
    private String email;
    private String password;
    private String phoneNum;
    private int status;
    private String statusStr;
    private List<Role> roles;

    public String getStatusStr() {


        if (status == 0) {
            statusStr = "未开启";
        }
        if (status == 1) {
            statusStr = "开启";
        }

        return statusStr;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UsersInfo usersInfo = (UsersInfo) o;
        return id == usersInfo.id &&
                status == usersInfo.status &&
                Objects.equals(username, usersInfo.username) &&
                Objects.equals(email, usersInfo.email) &&
                Objects.equals(password, usersInfo.password) &&
                Objects.equals(phoneNum, usersInfo.phoneNum) &&
                Objects.equals(statusStr, usersInfo.statusStr) &&
                Objects.equals(roles, usersInfo.roles);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, email, password, phoneNum, status, statusStr, roles);
    }
}
