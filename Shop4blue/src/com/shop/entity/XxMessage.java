package com.shop.entity;

import java.util.Date;

public class XxMessage {
	private String username;
    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	private Long id;

    private Date createDate;

    private Date modifyDate;

    private String ip;

    private Boolean isDraft;

    private Boolean receiverDelete;

    private Boolean receiverRead;

    private Boolean senderDelete;

    private Boolean senderRead;

    private String title;

    private Long forMessage;

    private Long receiver;

    private Long sender;

    private String content;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Boolean getIsDraft() {
        return isDraft;
    }

    public void setIsDraft(Boolean isDraft) {
        this.isDraft = isDraft;
    }

    public Boolean getReceiverDelete() {
        return receiverDelete;
    }

    public void setReceiverDelete(Boolean receiverDelete) {
        this.receiverDelete = receiverDelete;
    }

    public Boolean getReceiverRead() {
        return receiverRead;
    }

    public void setReceiverRead(Boolean receiverRead) {
        this.receiverRead = receiverRead;
    }

    public Boolean getSenderDelete() {
        return senderDelete;
    }

    public void setSenderDelete(Boolean senderDelete) {
        this.senderDelete = senderDelete;
    }

    public Boolean getSenderRead() {
        return senderRead;
    }

    public void setSenderRead(Boolean senderRead) {
        this.senderRead = senderRead;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Long getForMessage() {
        return forMessage;
    }

    public void setForMessage(Long forMessage) {
        this.forMessage = forMessage;
    }

    public Long getReceiver() {
        return receiver;
    }

    public void setReceiver(Long receiver) {
        this.receiver = receiver;
    }

    public Long getSender() {
        return sender;
    }

    public void setSender(Long sender) {
        this.sender = sender;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}