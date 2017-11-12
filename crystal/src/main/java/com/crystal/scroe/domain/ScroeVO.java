package com.crystal.scroe.domain;

import java.io.Serializable;
import java.util.Date;

public class ScroeVO implements Serializable {
    private Integer scoreid;

    private String scorename;

    private Integer pages;

    private Date purchasedate;

    private String state;

    private static final long serialVersionUID = 1L;

    public Integer getScoreid() {
        return scoreid;
    }

    public void setScoreid(Integer scoreid) {
        this.scoreid = scoreid;
    }

    public String getScorename() {
        return scorename;
    }

    public void setScorename(String scorename) {
        this.scorename = scorename == null ? null : scorename.trim();
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public Date getPurchasedate() {
        return purchasedate;
    }

    public void setPurchasedate(Date purchasedate) {
        this.purchasedate = purchasedate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", scoreid=").append(scoreid);
        sb.append(", scorename=").append(scorename);
        sb.append(", pages=").append(pages);
        sb.append(", purchasedate=").append(purchasedate);
        sb.append(", state=").append(state);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        ScroeVO other = (ScroeVO) that;
        return (this.getScoreid() == null ? other.getScoreid() == null : this.getScoreid().equals(other.getScoreid()))
            && (this.getScorename() == null ? other.getScorename() == null : this.getScorename().equals(other.getScorename()))
            && (this.getPages() == null ? other.getPages() == null : this.getPages().equals(other.getPages()))
            && (this.getPurchasedate() == null ? other.getPurchasedate() == null : this.getPurchasedate().equals(other.getPurchasedate()))
            && (this.getState() == null ? other.getState() == null : this.getState().equals(other.getState()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getScoreid() == null) ? 0 : getScoreid().hashCode());
        result = prime * result + ((getScorename() == null) ? 0 : getScorename().hashCode());
        result = prime * result + ((getPages() == null) ? 0 : getPages().hashCode());
        result = prime * result + ((getPurchasedate() == null) ? 0 : getPurchasedate().hashCode());
        result = prime * result + ((getState() == null) ? 0 : getState().hashCode());
        return result;
    }
}